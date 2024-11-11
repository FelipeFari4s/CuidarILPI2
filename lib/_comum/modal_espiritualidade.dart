import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicoespirituais/espiritualidade_modelo.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:uuid/uuid.dart';

void mostrarModalEspiritualidade(BuildContext context, String idosoId,
    {EspiritualidadeModelo? avaliacao}) {
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
      child: EspiritualidadeModal(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class EspiritualidadeModal extends StatefulWidget {
  final String idosoId;
  final EspiritualidadeModelo? avaliacaoExistente;

  EspiritualidadeModal({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _EspiritualidadeModalState createState() => _EspiritualidadeModalState();
}

class _EspiritualidadeModalState extends State<EspiritualidadeModal> {
  final _formKey = GlobalKey<FormState>();
  final _idosoService = IdosoService();
  bool isLoad = false;

  bool _possuiReligiao = false;
  final _qualReligiaoController = TextEditingController();
  bool _necessitaCerimonias = false;
  bool _participaPraticasIntegrativas = false;
  final _quaisPraticasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _possuiReligiao = widget.avaliacaoExistente!.possuiReligiao;
      _qualReligiaoController.text = widget.avaliacaoExistente!.qualReligiao;
      _necessitaCerimonias = widget.avaliacaoExistente!.necessitaCerimonias;
      _participaPraticasIntegrativas =
          widget.avaliacaoExistente!.participaPraticasIntegrativas;
      _quaisPraticasController.text = widget.avaliacaoExistente!.quaisPraticas;
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
                  'Avaliação de Espiritualidade',
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
                Card(
                  color: Colors.white.withOpacity(0.1),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Religião e Práticas Espirituais',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SwitchListTile(
                          title: Text(
                            'Possui religião',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _possuiReligiao,
                          onChanged: (value) =>
                              setState(() => _possuiReligiao = value),
                        ),
                        if (_possuiReligiao)
                          TextFormField(
                            controller: _qualReligiaoController,
                            decoration: InputDecoration(
                              labelText: 'Qual religião?',
                              labelStyle: TextStyle(color: Colors.white70),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (_possuiReligiao &&
                                  (value == null || value.isEmpty)) {
                                return 'Por favor, informe a religião';
                              }
                              return null;
                            },
                          ),
                        SwitchListTile(
                          title: Text(
                            'Necessita participar de cerimônias religiosas',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _necessitaCerimonias,
                          onChanged: (value) =>
                              setState(() => _necessitaCerimonias = value),
                        ),
                        SwitchListTile(
                          title: Text(
                            'Participa de práticas integrativas complementares',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _participaPraticasIntegrativas,
                          onChanged: (value) => setState(
                              () => _participaPraticasIntegrativas = value),
                        ),
                        if (_participaPraticasIntegrativas)
                          TextFormField(
                            controller: _quaisPraticasController,
                            decoration: InputDecoration(
                              labelText: 'Quais práticas?',
                              labelStyle: TextStyle(color: Colors.white70),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (_participaPraticasIntegrativas &&
                                  (value == null || value.isEmpty)) {
                                return 'Por favor, informe as práticas';
                              }
                              return null;
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.card3,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: isLoad ? null : _salvarAvaliacao,
            child: isLoad
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    'Salvar Avaliação',
                    style: TextStyle(fontSize: 16),
                  ),
          ),
        ],
      ),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoad = true);

    final avaliacao = EspiritualidadeModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      possuiReligiao: _possuiReligiao,
      qualReligiao: _qualReligiaoController.text,
      necessitaCerimonias: _necessitaCerimonias,
      participaPraticasIntegrativas: _participaPraticasIntegrativas,
      quaisPraticas: _quaisPraticasController.text,
      dataRegistro: DateTime.now(),
    );

    try {
      await _idosoService.salvarEspiritualidade(widget.idosoId, avaliacao);
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
    _qualReligiaoController.dispose();
    _quaisPraticasController.dispose();
    super.dispose();
  }
} 