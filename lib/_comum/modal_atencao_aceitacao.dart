import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicossociais/atencao_aceitacao_modelo.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

void mostrarModalAtencaoAceitacao(BuildContext context, String idosoId, {AtencaoAceitacaoModelo? avaliacao}) {
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
      child: AtencaoAceitacaoModal(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class AtencaoAceitacaoModal extends StatefulWidget {
  final String idosoId;
  final AtencaoAceitacaoModelo? avaliacaoExistente;

  AtencaoAceitacaoModal({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _AtencaoAceitacaoModalState createState() => _AtencaoAceitacaoModalState();
}

class _AtencaoAceitacaoModalState extends State<AtencaoAceitacaoModal> {
  final _formKey = GlobalKey<FormState>();
  final _idosoService = IdosoService();
  bool isLoad = false;
  
  bool _solicitaAtencao = false;
  final _comoSolicitaController = TextEditingController();
  bool _necessidadeAtencao = false;
  
  final List<String> _sentimentosDisponiveis = [
    'Tristeza',
    'Solidão',
    'Felicidade'
  ];
  
  final List<String> _manifestacoesDisponiveis = [
    'Choro',
    'Deprimido',
    'Isolamento',
    'Irritado',
    'Agressivo',
    'Inquieto',
    'Pensamento negativo'
  ];
  
  List<String> _sentimentosSelecionados = [];
  List<String> _manifestacoesSelecionadas = [];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _solicitaAtencao = widget.avaliacaoExistente!.solicitaAtencao;
      _comoSolicitaController.text = widget.avaliacaoExistente!.comoSolicitaAtencao;
      _necessidadeAtencao = widget.avaliacaoExistente!.necessidadeAtencao;
      _sentimentosSelecionados = List.from(widget.avaliacaoExistente!.sentimentos);
      _manifestacoesSelecionadas = List.from(widget.avaliacaoExistente!.manifestacoes);
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
                  'Avaliação de Atenção e Aceitação',
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
                _buildAtencaoSection(),
                SizedBox(height: 24),
                _buildSentimentosSection(),
                SizedBox(height: 24),
                _buildManifestacoesSection(),
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

  Widget _buildAtencaoSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Necessidades de Atenção',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Solicita atenção', style: TextStyle(color: Colors.white)),
              value: _solicitaAtencao,
              onChanged: (value) => setState(() => _solicitaAtencao = value),
            ),
            if (_solicitaAtencao)
              TextFormField(
                controller: _comoSolicitaController,
                decoration: InputDecoration(
                  labelText: 'Como solicita atenção?',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (_solicitaAtencao && (value == null || value.isEmpty)) {
                    return 'Por favor, descreva como solicita atenção';
                  }
                  return null;
                },
              ),
            SwitchListTile(
              title: Text('Necessita de atenção', style: TextStyle(color: Colors.white)),
              value: _necessidadeAtencao,
              onChanged: (value) => setState(() => _necessidadeAtencao = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSentimentosSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sentimentos',
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
              children: _sentimentosDisponiveis.map((sentimento) {
                final isSelected = _sentimentosSelecionados.contains(sentimento);
                return FilterChip(
                  label: Text(sentimento),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _sentimentosSelecionados.add(sentimento);
                      } else {
                        _sentimentosSelecionados.remove(sentimento);
                      }
                    });
                  },
                  selectedColor: AppColors.card3,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManifestacoesSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manifestações',
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
              children: _manifestacoesDisponiveis.map((manifestacao) {
                final isSelected = _manifestacoesSelecionadas.contains(manifestacao);
                return FilterChip(
                  label: Text(manifestacao),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _manifestacoesSelecionadas.add(manifestacao);
                      } else {
                        _manifestacoesSelecionadas.remove(manifestacao);
                      }
                    });
                  },
                  selectedColor: AppColors.card3,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = AtencaoAceitacaoModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      solicitaAtencao: _solicitaAtencao,
      comoSolicitaAtencao: _comoSolicitaController.text,
      necessidadeAtencao: _necessidadeAtencao,
      sentimentos: _sentimentosSelecionados,
      manifestacoes: _manifestacoesSelecionadas,
      dataRegistro: DateTime.now(),
    );

    try {
      await _idosoService.salvarAtencaoAceitacao(widget.idosoId, avaliacao);
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
    _comoSolicitaController.dispose();
    super.dispose();
  }
} 