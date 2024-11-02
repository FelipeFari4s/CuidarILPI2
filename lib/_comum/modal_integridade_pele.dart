import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/integridade_pele_modelo.dart';
import 'package:uuid/uuid.dart';

void mostrarModalIntegridadePele(BuildContext context, String idosoId,
    {IntegridadePeleModelo? avaliacao}) {
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
      child: ModalIntegridadePele(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ModalIntegridadePele extends StatefulWidget {
  final String idosoId;
  final IntegridadePeleModelo? avaliacaoExistente;

  ModalIntegridadePele({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalIntegridadePeleState createState() => _ModalIntegridadePeleState();
}

class _ModalIntegridadePeleState extends State<ModalIntegridadePele> {
  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;

  String _condicaoPele = 'Íntegra';
  bool _presencaLesao = false;
  final _localLesaoController = TextEditingController();
  String _coloracaoPele = 'Normocorada';
  final _localColoracaoController = TextEditingController();
  String _nivelEdema = '+/4+';
  final _localEdemaController = TextEditingController();

  final List<String> _opcoesCondicaoPele = ['Íntegra', 'Ressecada'];
  final List<String> _opcoesColoracao = ['Normocorada', 'Hiperemiada'];
  final List<String> _opcoesEdema = ['+/4+', '++/4+', '+++/4+', '++++/4+'];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _condicaoPele = widget.avaliacaoExistente!.condicaoPele;
      _presencaLesao = widget.avaliacaoExistente!.presencaLesao;
      _localLesaoController.text = widget.avaliacaoExistente!.localLesao;
      _coloracaoPele = widget.avaliacaoExistente!.coloracaoPele;
      _localColoracaoController.text = widget.avaliacaoExistente!.localColoracao;
      _nivelEdema = widget.avaliacaoExistente!.nivelEdema;
      _localEdemaController.text = widget.avaliacaoExistente!.localEdema;
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
                'Avaliação da Integridade da Pele',
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
                _buildCondicaoPele(),
                SizedBox(height: 24),
                _buildPresencaLesao(),
                SizedBox(height: 24),
                _buildColoracao(),
                SizedBox(height: 24),
                _buildEdema(),
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

  Widget _buildCondicaoPele() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Condições da Pele',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: _opcoesCondicaoPele.map((opcao) => ChoiceChip(
                label: Text(opcao),
                selected: _condicaoPele == opcao,
                onSelected: (selected) {
                  setState(() => _condicaoPele = selected ? opcao : _condicaoPele);
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _condicaoPele == opcao ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPresencaLesao() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Presença de Lesão',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Possui lesão', style: TextStyle(color: Colors.white)),
              value: _presencaLesao,
              onChanged: (value) {
                setState(() => _presencaLesao = value);
              },
            ),
            if (_presencaLesao)
              TextFormField(
                controller: _localLesaoController,
                decoration: InputDecoration(
                  labelText: 'Local da Lesão',
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

  Widget _buildColoracao() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coloração da Pele',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: _opcoesColoracao.map((opcao) => ChoiceChip(
                label: Text(opcao),
                selected: _coloracaoPele == opcao,
                onSelected: (selected) {
                  setState(() => _coloracaoPele = selected ? opcao : _coloracaoPele);
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _coloracaoPele == opcao ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _localColoracaoController,
              decoration: InputDecoration(
                labelText: 'Local',
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

  Widget _buildEdema() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edema',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: _opcoesEdema.map((opcao) => ChoiceChip(
                label: Text(opcao),
                selected: _nivelEdema == opcao,
                onSelected: (selected) {
                  setState(() => _nivelEdema = selected ? opcao : _nivelEdema);
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _nivelEdema == opcao ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _localEdemaController,
              decoration: InputDecoration(
                labelText: 'Local',
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

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = IntegridadePeleModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      condicaoPele: _condicaoPele,
      presencaLesao: _presencaLesao,
      localLesao: _localLesaoController.text,
      coloracaoPele: _coloracaoPele,
      localColoracao: _localColoracaoController.text,
      nivelEdema: _nivelEdema,
      localEdema: _localEdemaController.text,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarIntegridadePele(widget.idosoId, avaliacao);
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
    _localLesaoController.dispose();
    _localColoracaoController.dispose();
    _localEdemaController.dispose();
    super.dispose();
  }
} 