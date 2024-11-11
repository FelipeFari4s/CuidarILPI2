import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/locomocao_modelo.dart';
import 'package:uuid/uuid.dart';

void mostrarModalLocomocao(BuildContext context, String idosoId,
    {LocomocaoModelo? avaliacao}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(24),
      child: ModalLocomocao(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ModalLocomocao extends StatefulWidget {
  final String idosoId;
  final LocomocaoModelo? avaliacaoExistente;

  ModalLocomocao({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalLocomocaoState createState() => _ModalLocomocaoState();
}

class _ModalLocomocaoState extends State<ModalLocomocao> {
  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;

  bool _deambula = false;
  String _condicaoMobilidade = 'Normal';
  bool _auxilioDeambular = false;
  List<String> _usoOrtese = [];
  bool _equilibrioPreservado = false;
  bool _exercicioFisicoRegular = false;
  String _tipoExercicio = '';
  bool _limitacaoFisica = false;
  String _tipoLimitacao = '';
  bool _auxilioMovimentacao = false;
  bool _rigidezPescoco = false;

  final List<String> _opcoesCondicaoMobilidade = ['Normal', 'Acamado', 'Cadeirante'];
  final List<String> _opcoesOrtese = ['Andador', 'Cadeira de rodas', 'Bengala'];

  TextEditingController _tipoExercicioController = TextEditingController();
  TextEditingController _tipoLimitacaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _deambula = widget.avaliacaoExistente!.deambula;
      _condicaoMobilidade = widget.avaliacaoExistente!.condicaoMobilidade;
      _auxilioDeambular = widget.avaliacaoExistente!.auxilioDeambular;
      _usoOrtese = List.from(widget.avaliacaoExistente!.usoOrtese);
      _equilibrioPreservado = widget.avaliacaoExistente!.equilibrioPreservado;
      _exercicioFisicoRegular = widget.avaliacaoExistente!.exercicioFisicoRegular;
      _tipoExercicio = widget.avaliacaoExistente!.tipoExercicio;
      _limitacaoFisica = widget.avaliacaoExistente!.limitacaoFisica;
      _tipoLimitacao = widget.avaliacaoExistente!.tipoLimitacao;
      _auxilioMovimentacao = widget.avaliacaoExistente!.auxilioMovimentacao;
      _rigidezPescoco = widget.avaliacaoExistente!.rigidezPescoco;
      
      _tipoExercicioController.text = _tipoExercicio;
      _tipoLimitacaoController.text = _tipoLimitacao;
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
                  'Avaliação de Locomoção',
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
                _buildDeambulacaoSection(),
                SizedBox(height: 24),
                _buildOrteseSection(),
                SizedBox(height: 24),
                _buildEquilibrioSection(),
                SizedBox(height: 24),
                _buildExercicioSection(),
                SizedBox(height: 24),
                _buildLimitacaoSection(),
                SizedBox(height: 24),
                _buildAuxilioSection(),
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

  Widget _buildDeambulacaoSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deambulação',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Deambula', style: TextStyle(color: Colors.white)),
              value: _deambula,
              onChanged: (value) {
                setState(() => _deambula = value);
              },
            ),
            if (!_deambula) ...[
              Text(
                'Condição de Mobilidade',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _opcoesCondicaoMobilidade.map((opcao) => ChoiceChip(
                  label: Text(opcao),
                  selected: _condicaoMobilidade == opcao,
                  onSelected: (selected) {
                    setState(() => _condicaoMobilidade = selected ? opcao : _condicaoMobilidade);
                  },
                  selectedColor: AppColors.card3,
                  labelStyle: TextStyle(
                    color: _condicaoMobilidade == opcao ? Colors.white : Colors.black,
                  ),
                )).toList(),
              ),
            ],
            SwitchListTile(
              title: Text('Necessita auxílio para deambular',
                  style: TextStyle(color: Colors.white)),
              value: _auxilioDeambular,
              onChanged: (value) {
                setState(() => _auxilioDeambular = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrteseSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uso de Órtese',
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
              children: _opcoesOrtese.map((opcao) => FilterChip(
                label: Text(opcao),
                selected: _usoOrtese.contains(opcao),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _usoOrtese.add(opcao);
                    } else {
                      _usoOrtese.remove(opcao);
                    }
                  });
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _usoOrtese.contains(opcao) ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEquilibrioSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Equilíbrio',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Equilíbrio preservado',
                  style: TextStyle(color: Colors.white)),
              value: _equilibrioPreservado,
              onChanged: (value) {
                setState(() => _equilibrioPreservado = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExercicioSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercício Físico',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Realiza exercício físico regular',
                  style: TextStyle(color: Colors.white)),
              value: _exercicioFisicoRegular,
              onChanged: (value) {
                setState(() => _exercicioFisicoRegular = value);
              },
            ),
            if (_exercicioFisicoRegular)
              TextFormField(
                controller: _tipoExercicioController,
                decoration: InputDecoration(
                  labelText: 'Tipo de exercício',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLimitacaoSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Limitação Física',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Possui limitação física',
                  style: TextStyle(color: Colors.white)),
              value: _limitacaoFisica,
              onChanged: (value) {
                setState(() => _limitacaoFisica = value);
              },
            ),
            if (_limitacaoFisica)
              TextFormField(
                controller: _tipoLimitacaoController,
                decoration: InputDecoration(
                  labelText: 'Tipo de limitação',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuxilioSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Auxílio e Rigidez',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Necessita auxílio para se movimentar',
                  style: TextStyle(color: Colors.white)),
              value: _auxilioMovimentacao,
              onChanged: (value) {
                setState(() => _auxilioMovimentacao = value);
              },
            ),
            SwitchListTile(
              title: Text('Apresenta rigidez de pescoço',
                  style: TextStyle(color: Colors.white)),
              value: _rigidezPescoco,
              onChanged: (value) {
                setState(() => _rigidezPescoco = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = LocomocaoModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      deambula: _deambula,
      condicaoMobilidade: _condicaoMobilidade,
      auxilioDeambular: _auxilioDeambular,
      usoOrtese: _usoOrtese,
      equilibrioPreservado: _equilibrioPreservado,
      exercicioFisicoRegular: _exercicioFisicoRegular,
      tipoExercicio: _tipoExercicioController.text,
      limitacaoFisica: _limitacaoFisica,
      tipoLimitacao: _tipoLimitacaoController.text,
      auxilioMovimentacao: _auxilioMovimentacao,
      rigidezPescoco: _rigidezPescoco,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarLocomocao(widget.idosoId, avaliacao);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar a avaliação')),
      );
    } finally {
      setState(() => isLoad = false);
    }
  }

  @override
  void dispose() {
    _tipoExercicioController.dispose();
    _tipoLimitacaoController.dispose();
    super.dispose();
  }
} 