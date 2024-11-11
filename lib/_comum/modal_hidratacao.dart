import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/hidratacao_modelo.dart';
import 'package:uuid/uuid.dart';

void mostrarModalHidratacao(BuildContext context, String idosoId,
    {HidratacaoModelo? avaliacao}) {
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
      child: ModalHidratacao(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ModalHidratacao extends StatefulWidget {
  final String idosoId;
  final HidratacaoModelo? avaliacaoExistente;

  ModalHidratacao({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalHidratacaoState createState() => _ModalHidratacaoState();
}

class _ModalHidratacaoState extends State<ModalHidratacao> {
  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;

  bool _hidratado = true;
  String? _turgorElasticidade;
  String? _ingestaHidrica;
  bool _solicitaIngesta = false;
  bool _precisaAuxilio = false;

  final List<String> _opcoesTurgor = ['+/4+', '++/4+', '+++/4+', '++++/4+'];
  final List<String> _opcoesIngesta = ['Insatisfatória', 'Regular', 'Satisfatória'];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _hidratado = widget.avaliacaoExistente!.hidratado;
      _turgorElasticidade = widget.avaliacaoExistente!.turgorElasticidade;
      _ingestaHidrica = widget.avaliacaoExistente!.ingestaHidrica;
      _solicitaIngesta = widget.avaliacaoExistente!.solicitaIngesta;
      _precisaAuxilio = widget.avaliacaoExistente!.precisaAuxilio;
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
                  'Avaliação de Hidratação',
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
                _buildStatusHidratacao(),
                SizedBox(height: 24),
                _buildTurgorElasticidade(),
                SizedBox(height: 24),
                _buildIngestaHidrica(),
                SizedBox(height: 24),
                _buildCaracteristicas(),
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

  Widget _buildStatusHidratacao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.water_drop, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Status de Hidratação',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth < 600
                ? Column(
                    children: _buildStatusRadios(),
                  )
                : Row(
                    children: _buildStatusRadios()
                        .map((radio) => Expanded(child: radio))
                        .toList(),
                  );
          },
        ),
      ],
    );
  }

  List<Widget> _buildStatusRadios() {
    return [
      RadioListTile<bool>(
        title: Text('Hidratado', style: TextStyle(color: Colors.white)),
        value: true,
        groupValue: _hidratado,
        onChanged: (value) => setState(() => _hidratado = value!),
      ),
      RadioListTile<bool>(
        title: Text('Desidratado', style: TextStyle(color: Colors.white)),
        value: false,
        groupValue: _hidratado,
        onChanged: (value) => setState(() => _hidratado = value!),
      ),
    ];
  }

  Widget _buildTurgorElasticidade() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Turgor e Elasticidade da Pele',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 8,
          children: _opcoesTurgor.map((opcao) => ChoiceChip(
            label: Text(opcao),
            selected: _turgorElasticidade == opcao,
            onSelected: (selected) {
              setState(() {
                _turgorElasticidade = selected ? opcao : null;
              });
            },
            selectedColor: AppColors.card3,
            labelStyle: TextStyle(
              color: _turgorElasticidade == opcao ? Colors.white : Colors.black,
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildIngestaHidrica() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingesta Hídrica',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 8,
          children: _opcoesIngesta.map((opcao) => ChoiceChip(
            label: Text(opcao),
            selected: _ingestaHidrica == opcao,
            onSelected: (selected) {
              setState(() {
                _ingestaHidrica = selected ? opcao : null;
              });
            },
            selectedColor: AppColors.card3,
            labelStyle: TextStyle(
              color: _ingestaHidrica == opcao ? Colors.white : Colors.black,
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildCaracteristicas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Características',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        CheckboxListTile(
          title: Text('Solicita ingesta hídrica',
              style: TextStyle(color: Colors.white)),
          value: _solicitaIngesta,
          onChanged: (value) {
            setState(() {
              _solicitaIngesta = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Precisa de auxílio para ingesta hídrica',
              style: TextStyle(color: Colors.white)),
          value: _precisaAuxilio,
          onChanged: (value) {
            setState(() {
              _precisaAuxilio = value!;
            });
          },
        ),
      ],
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = HidratacaoModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      hidratado: _hidratado,
      turgorElasticidade: _turgorElasticidade ?? '',
      ingestaHidrica: _ingestaHidrica ?? '',
      solicitaIngesta: _solicitaIngesta,
      precisaAuxilio: _precisaAuxilio,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarHidratacao(widget.idosoId, avaliacao);
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