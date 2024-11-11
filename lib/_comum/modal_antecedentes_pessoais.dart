import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/antecedentes_pessoais_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:uuid/uuid.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';

mostrarModalAntecedentesPessoais(BuildContext context, String idosoId,
    {AntecedentesPessoaisModelo? antecedentes}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primary,
    isDismissible: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) {
      return ModalAntecedentesPessoais(
        idosoId: idosoId,
        antecedentes: antecedentes,
      );
    },
  );
}

class ModalAntecedentesPessoais extends StatefulWidget {
  final String idosoId;
  final AntecedentesPessoaisModelo? antecedentes;

  const ModalAntecedentesPessoais({
    Key? key,
    required this.idosoId,
    this.antecedentes,
  }) : super(key: key);

  @override
  State<ModalAntecedentesPessoais> createState() =>
      _ModalAntecedentesPessoaisState();
}

class _ModalAntecedentesPessoaisState extends State<ModalAntecedentesPessoais> {
  final Map<String, bool> allcomorbidades = {
    'Diabetes': false,
    'Hipertensão': false,
    'Depressão': false,
    'Hipotireoidismo': false,
    'Demência': false,
    'DPOC': false,
    'Doença Renal Crônica': false,
    'Insuficiência Cardíaca': false,
  };

  TextEditingController outrasComorbidadesController = TextEditingController();
  bool internacaoUltimosSeisMesesBool = false;
  bool etilistaBool = false;
  bool tabagistaBool = false;
  bool isLoad = false;

  final IdosoService _idosoService = IdosoService();

  @override
  void initState() {
    if (widget.antecedentes != null) {
      allcomorbidades.addAll(widget.antecedentes!.comorbidades);
      outrasComorbidadesController.text =
          widget.antecedentes!.outrasComorbidades;
      internacaoUltimosSeisMesesBool =
          widget.antecedentes!.internacaoUltimosSeisMeses;
      etilistaBool = widget.antecedentes!.etilista;
      tabagistaBool = widget.antecedentes!.tabagista;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.antecedentes != null
                      ? 'Editar Antecedentes Pessoais'
                      : 'Antecedentes Pessoais',
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
          Divider(color: Colors.white.withOpacity(0.5)),
          Expanded(
            child: ListView(
              children: [
                _buildSection(
                  'Comorbidades',
                  Column(
                    children: [
                      ...allcomorbidades.entries
                          .map((entry) => CheckboxListTile(
                                title: Text(
                                  entry.key,
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: entry.value,
                                onChanged: (value) {
                                  setState(() {
                                    allcomorbidades[entry.key] = value ?? false;
                                  });
                                },
                                checkColor: AppColors.primary,
                                fillColor: MaterialStateProperty.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.selected)
                                          ? Colors.white
                                          : Colors.white70,
                                ),
                              ))
                          .toList(),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: TextField(
                          controller: outrasComorbidadesController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Outras comorbidades',
                            labelStyle: TextStyle(color: Colors.white70),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildSection(
                  'Histórico',
                  Column(
                    children: [
                      SwitchListTile(
                        title: Text(
                          'Internação hospitalar nos últimos 6 meses',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: internacaoUltimosSeisMesesBool,
                        onChanged: (value) {
                          setState(() {
                            internacaoUltimosSeisMesesBool = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text(
                          'Já foi etilista',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: etilistaBool,
                        onChanged: (value) {
                          setState(() {
                            etilistaBool = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: Text(
                          'Já foi tabagista',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: tabagistaBool,
                        onChanged: (value) {
                          setState(() {
                            tabagistaBool = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.card3,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: isLoad ? null : _salvarAntecedentes,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoad)
                  Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.only(right: 8),
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                else ...[
                  Icon(Icons.save, color: Colors.white),
                  SizedBox(width: 8),
                ],
                Text(
                  isLoad
                      ? 'Salvando...'
                      : (widget.antecedentes != null ? 'Atualizar' : 'Salvar'),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Card(
      color: AppColors.primary.withOpacity(0.8),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }

  void _salvarAntecedentes() {
    setState(() {
      isLoad = true;
    });

    Map<String, bool> comorbidades = Map<String, bool>.from(allcomorbidades);
    String outrasComorbidades = outrasComorbidadesController.text;
    bool internacaoUltimosSeisMeses = internacaoUltimosSeisMesesBool;
    bool etilista = etilistaBool;
    bool tabagista = tabagistaBool;

    AntecedentesPessoaisModelo antecedentes = AntecedentesPessoaisModelo(
      id: widget.antecedentes?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      comorbidades: comorbidades,
      outrasComorbidades: outrasComorbidades,
      internacaoUltimosSeisMeses: internacaoUltimosSeisMeses,
      etilista: etilista,
      tabagista: tabagista,
    );

    if (widget.antecedentes != null) {
      antecedentes.id = widget.antecedentes!.id;
    }

    _idosoService
        .addAntecedentesPessoais(widget.idosoId, antecedentes)
        .then((value) {
      setState(() {
        isLoad = false;
      });
      Navigator.pop(context);
    });

    // TODO: Implementar a lógica de salvamento no Firebase
    // Exemplo:
    // IdosoService().salvarAntecedentesPessoais(antecedentes).then((_) {
    //   setState(() {
    //     isLoad = false;
    //   });
    //   Navigator.pop(context);
    // });
  }
}
