import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/sensopercepcao_modelo.dart';
import 'package:uuid/uuid.dart';

void mostrarModalSensopercepcao(BuildContext context, String idosoId,
    {SensopercepcaoModelo? avaliacao}) {
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
      child: ModalSensopercepcao(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ModalSensopercepcao extends StatefulWidget {
  final String idosoId;
  final SensopercepcaoModelo? avaliacaoExistente;

  ModalSensopercepcao({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalSensopercepcaoState createState() => _ModalSensopercepcaoState();
}

class _ModalSensopercepcaoState extends State<ModalSensopercepcao> {
  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;

  bool _acuidadeVisualDiminuida = false;
  bool _usoLentesCorretivas = false;
  String _condicaoAudicao = 'Normal';
  String _usoProtese = 'Não usa';
  bool _dorEstimulacaoTatil = false;
  List<String> _expressaoDor = [];

  final List<String> _opcoesCondicaoAudicao = ['Normal', 'Diminuída'];
  final List<String> _opcoesProtese = ['Não usa', 'Unilateral', 'Bilateral'];
  final List<String> _opcoesExpressaoDor = [
    'Localiza a dor',
    'Não sabe localizar a dor',
    'Gemente'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _acuidadeVisualDiminuida = widget.avaliacaoExistente!.acuidadeVisualDiminuida;
      _usoLentesCorretivas = widget.avaliacaoExistente!.usoLentesCorretivas;
      _condicaoAudicao = widget.avaliacaoExistente!.condicaoAudicao;
      _usoProtese = widget.avaliacaoExistente!.usoProtese;
      _dorEstimulacaoTatil = widget.avaliacaoExistente!.dorEstimulacaoTatil;
      _expressaoDor = List.from(widget.avaliacaoExistente!.expressaoDor);
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
                  'Avaliação de Sensopercepção',
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
                _buildAcuidadeVisual(),
                SizedBox(height: 24),
                _buildCondicaoAuditiva(),
                SizedBox(height: 24),
                _buildDorTatil(),
                SizedBox(height: 24),
                _buildExpressaoDor(),
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

  Widget _buildAcuidadeVisual() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Acuidade Visual',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Acuidade visual diminuída',
                  style: TextStyle(color: Colors.white)),
              value: _acuidadeVisualDiminuida,
              onChanged: (value) {
                setState(() => _acuidadeVisualDiminuida = value);
              },
            ),
            SwitchListTile(
              title: Text('Uso de lentes corretivas',
                  style: TextStyle(color: Colors.white)),
              value: _usoLentesCorretivas,
              onChanged: (value) {
                setState(() => _usoLentesCorretivas = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCondicaoAuditiva() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Condição Auditiva',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: _opcoesCondicaoAudicao.map((opcao) => ChoiceChip(
                label: Text(opcao),
                selected: _condicaoAudicao == opcao,
                onSelected: (selected) {
                  setState(() => _condicaoAudicao = selected ? opcao : _condicaoAudicao);
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _condicaoAudicao == opcao ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Uso de Prótese',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _opcoesProtese.map((opcao) => ChoiceChip(
                label: Text(opcao),
                selected: _usoProtese == opcao,
                onSelected: (selected) {
                  setState(() => _usoProtese = selected ? opcao : _usoProtese);
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _usoProtese == opcao ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDorTatil() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sensibilidade Tátil',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Dor a estimulação tátil',
                  style: TextStyle(color: Colors.white)),
              value: _dorEstimulacaoTatil,
              onChanged: (value) {
                setState(() => _dorEstimulacaoTatil = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpressaoDor() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expressão da Dor',
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
              children: _opcoesExpressaoDor.map((opcao) => FilterChip(
                label: Text(opcao),
                selected: _expressaoDor.contains(opcao),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _expressaoDor.add(opcao);
                    } else {
                      _expressaoDor.remove(opcao);
                    }
                  });
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _expressaoDor.contains(opcao) ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = SensopercepcaoModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      acuidadeVisualDiminuida: _acuidadeVisualDiminuida,
      usoLentesCorretivas: _usoLentesCorretivas,
      condicaoAudicao: _condicaoAudicao,
      usoProtese: _usoProtese,
      dorEstimulacaoTatil: _dorEstimulacaoTatil,
      expressaoDor: _expressaoDor,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarSensopercepcao(widget.idosoId, avaliacao);
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