import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicossociais/comunicacao_modelo.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:uuid/uuid.dart';

void mostrarModalComunicacao(BuildContext context, String idosoId, {ComunicacaoModelo? avaliacao}) {
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
      child: ComunicacaoModal(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ComunicacaoModal extends StatefulWidget {
  final String idosoId;
  final ComunicacaoModelo? avaliacaoExistente;

  ComunicacaoModal({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ComunicacaoModalState createState() => _ComunicacaoModalState();
}

class _ComunicacaoModalState extends State<ComunicacaoModal> {
  final _formKey = GlobalKey<FormState>();
  final _idosoService = IdosoService();
  bool isLoad = false;

  bool _comunicacaoVerbalNormal = true;
  final _causaPrejuizoController = TextEditingController();
  
  final List<String> _comunicacaoNaoVerbalOpcoes = [
    'Expressões Faciais',
    'Gesto',
    'Expressão Corporal'
  ];
  
  List<String> _comunicacaoNaoVerbalSelecionada = [];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _comunicacaoVerbalNormal = widget.avaliacaoExistente!.comunicacaoVerbalNormal;
      _causaPrejuizoController.text = widget.avaliacaoExistente!.causaPrejuizo;
      _comunicacaoNaoVerbalSelecionada = List.from(widget.avaliacaoExistente!.comunicacaoNaoVerbal);
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
              Text(
                'Avaliação de Comunicação',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
          Divider(color: Colors.white),
          Expanded(
            child: ListView(
              children: [
                _buildComunicacaoVerbalSection(),
                SizedBox(height: 24),
                _buildComunicacaoNaoVerbalSection(),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.card3,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: isLoad ? null : _salvarAvaliacao,
            child: isLoad
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    'Salvar Avaliação',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildComunicacaoVerbalSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comunicação Verbal',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text(
                'Comunicação Verbal Normal',
                style: TextStyle(color: Colors.white),
              ),
              value: _comunicacaoVerbalNormal,
              onChanged: (value) {
                setState(() => _comunicacaoVerbalNormal = value);
              },
            ),
            if (!_comunicacaoVerbalNormal)
              TextFormField(
                controller: _causaPrejuizoController,
                decoration: InputDecoration(
                  labelText: 'Causa do Prejuízo',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (!_comunicacaoVerbalNormal && (value == null || value.isEmpty)) {
                    return 'Por favor, informe a causa do prejuízo';
                  }
                  return null;
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildComunicacaoNaoVerbalSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comunicação Não Verbal',
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
              children: _comunicacaoNaoVerbalOpcoes.map((opcao) {
                final isSelected = _comunicacaoNaoVerbalSelecionada.contains(opcao);
                return FilterChip(
                  label: Text(opcao),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _comunicacaoNaoVerbalSelecionada.add(opcao);
                      } else {
                        _comunicacaoNaoVerbalSelecionada.remove(opcao);
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

    final avaliacao = ComunicacaoModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      comunicacaoVerbalNormal: _comunicacaoVerbalNormal,
      causaPrejuizo: _causaPrejuizoController.text,
      comunicacaoNaoVerbal: _comunicacaoNaoVerbalSelecionada,
      dataRegistro: DateTime.now(),
    );

    try {
      await _idosoService.salvarComunicacao(widget.idosoId, avaliacao);
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
    _causaPrejuizoController.dispose();
    super.dispose();
  }
} 