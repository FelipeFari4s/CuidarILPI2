import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/sono_repouso_modelo.dart';
import 'package:uuid/uuid.dart';

void mostrarModalSonoRepouso(BuildContext context, String idosoId,
    {SonoRepousoModelo? avaliacao}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(24),
      child: ModalSonoRepouso(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ModalSonoRepouso extends StatefulWidget {
  final String idosoId;
  final SonoRepousoModelo? avaliacaoExistente;

  ModalSonoRepouso({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalSonoRepousoState createState() => _ModalSonoRepousoState();
}

class _ModalSonoRepousoState extends State<ModalSonoRepouso> {
  final _formKey = GlobalKey<FormState>();
  final _medicamentoController = TextEditingController();
  bool isLoad = false;

  bool _sonoPreservado = false;
  List<String> _horarioSono = [];
  List<String> _caracteristicasSono = [];
  bool _usaMedicamento = false;

  final List<String> _opcoesHorarioSono = ['Matutino', 'Vespertino', 'Noturno'];
  final List<String> _opcoesCaracteristicasSono = [
    'Insônia',
    'Acorda durante à noite',
    'Sonolência diurna'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _sonoPreservado = widget.avaliacaoExistente!.sonoPreservado;
      _horarioSono = List.from(widget.avaliacaoExistente!.horarioSono);
      _caracteristicasSono = List.from(widget.avaliacaoExistente!.caracteristicasSono);
      _usaMedicamento = widget.avaliacaoExistente!.usaMedicamento;
      _medicamentoController.text = widget.avaliacaoExistente!.medicamentoUtilizado;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Avaliação de Sono e Repouso',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(8),
                constraints: BoxConstraints(),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
          Divider(color: Colors.white),
          Expanded(
            child: ListView(
              children: [
                _buildSonoPreservado(),
                SizedBox(height: 24),
                _buildHorarioSono(),
                SizedBox(height: 24),
                _buildCaracteristicasSono(),
                SizedBox(height: 24),
                _buildMedicamento(),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.card3,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: isLoad ? null : _salvarAvaliacao,
            child: isLoad
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    'Salvar Avaliação',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSonoPreservado() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estado do Sono',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Sono preservado',
                  style: TextStyle(color: Colors.white)),
              value: _sonoPreservado,
              onChanged: (value) {
                setState(() => _sonoPreservado = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorarioSono() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Horário do Sono',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _opcoesHorarioSono.map((opcao) => FilterChip(
                label: Text(opcao),
                selected: _horarioSono.contains(opcao),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _horarioSono.add(opcao);
                    } else {
                      _horarioSono.remove(opcao);
                    }
                  });
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _horarioSono.contains(opcao) ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaracteristicasSono() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Características do Sono',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _opcoesCaracteristicasSono.map((opcao) => FilterChip(
                label: Text(opcao),
                selected: _caracteristicasSono.contains(opcao),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _caracteristicasSono.add(opcao);
                    } else {
                      _caracteristicasSono.remove(opcao);
                    }
                  });
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _caracteristicasSono.contains(opcao) ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicamento() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uso de Medicamento',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Usa medicamento para dormir',
                  style: TextStyle(color: Colors.white)),
              value: _usaMedicamento,
              onChanged: (value) {
                setState(() => _usaMedicamento = value);
              },
            ),
            if (_usaMedicamento)
              TextFormField(
                controller: _medicamentoController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Qual medicamento?',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = SonoRepousoModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      sonoPreservado: _sonoPreservado,
      horarioSono: _horarioSono,
      caracteristicasSono: _caracteristicasSono,
      usaMedicamento: _usaMedicamento,
      medicamentoUtilizado: _medicamentoController.text,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarSonoRepouso(widget.idosoId, avaliacao);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar a avaliação')),
      );
    } finally {
      setState(() => isLoad = false);
    }
  }
} 