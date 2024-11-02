import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/eliminacao_modelo.dart';
import 'package:uuid/uuid.dart';

void mostrarModalEliminacao(BuildContext context, String idosoId,
    {EliminacaoModelo? avaliacao}) {
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
      child: ModalEliminacao(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ModalEliminacao extends StatefulWidget {
  final String idosoId;
  final EliminacaoModelo? avaliacaoExistente;

  ModalEliminacao({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalEliminacaoState createState() => _ModalEliminacaoState();
}

class _ModalEliminacaoState extends State<ModalEliminacao> {
  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;

  List<String> _tiposDiurese = [];
  final TextEditingController _aspectoDiureseController = TextEditingController();
  String? _eliminacaoIntestinal;
  final TextEditingController _aspectoFezesController = TextEditingController();

  final List<String> _opcoesDiurese = [
    'Espontânea',
    'Fralda',
    'Incontinência urinária',
    'Poliúria',
    'Oligúria',
    'Nictúria'
  ];

  final List<String> _opcoesEliminacao = [
    'Presente',
    'Ausente',
    'Incontinência fecal'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _tiposDiurese = List.from(widget.avaliacaoExistente!.tiposDiurese);
      _aspectoDiureseController.text = widget.avaliacaoExistente!.aspectoDiurese;
      _eliminacaoIntestinal = widget.avaliacaoExistente!.eliminacaoIntestinal;
      _aspectoFezesController.text = widget.avaliacaoExistente!.aspectoFezes;
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
                'Avaliação de Eliminação',
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
                _buildTiposDiurese(),
                SizedBox(height: 24),
                _buildAspectoDiurese(),
                SizedBox(height: 24),
                _buildEliminacaoIntestinal(),
                SizedBox(height: 24),
                _buildAspectoFezes(),
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

  Widget _buildTiposDiurese() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tipos de Diurese',
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
          children: _opcoesDiurese.map((tipo) => FilterChip(
            label: Text(tipo),
            selected: _tiposDiurese.contains(tipo),
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _tiposDiurese.add(tipo);
                } else {
                  _tiposDiurese.remove(tipo);
                }
              });
            },
            selectedColor: AppColors.card3,
            labelStyle: TextStyle(
              color: _tiposDiurese.contains(tipo) ? Colors.white : Colors.black,
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildAspectoDiurese() {
    return TextFormField(
      controller: _aspectoDiureseController,
      decoration: InputDecoration(
        labelText: 'Aspecto da Diurese',
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildEliminacaoIntestinal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Eliminação Intestinal',
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
          children: _opcoesEliminacao.map((opcao) => ChoiceChip(
            label: Text(opcao),
            selected: _eliminacaoIntestinal == opcao,
            onSelected: (selected) {
              setState(() {
                _eliminacaoIntestinal = selected ? opcao : null;
              });
            },
            selectedColor: AppColors.card3,
            labelStyle: TextStyle(
              color: _eliminacaoIntestinal == opcao ? Colors.white : Colors.black,
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildAspectoFezes() {
    return TextFormField(
      controller: _aspectoFezesController,
      decoration: InputDecoration(
        labelText: 'Aspecto das Fezes',
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = EliminacaoModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      tiposDiurese: _tiposDiurese,
      aspectoDiurese: _aspectoDiureseController.text,
      eliminacaoIntestinal: _eliminacaoIntestinal ?? '',
      aspectoFezes: _aspectoFezesController.text,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarEliminacao(widget.idosoId, avaliacao);
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