import 'package:flutter/material.dart';

class SensopercepcaoForm extends StatefulWidget {
  @override
  _SensopercepcaoFormState createState() => _SensopercepcaoFormState();
}

class _SensopercepcaoFormState extends State<SensopercepcaoForm> {
  bool? acuidadeVisualDiminuida;
  bool? usoDeLentes;
  String? condicaoAudicao;
  String? usoDeProteseAudicao;
  bool? dorEstimuloTatil;
  String? expressaoDor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sensopercepção"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Sensopercepção",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Acuidade visual diminuída
            const Text("Acuidade visual diminuída:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: acuidadeVisualDiminuida == true,
              onChanged: (bool? value) {
                setState(() {
                  acuidadeVisualDiminuida = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: acuidadeVisualDiminuida == false,
              onChanged: (bool? value) {
                setState(() {
                  acuidadeVisualDiminuida = value == false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Uso de lentes corretivas"),
              value: usoDeLentes ?? false,
              onChanged: (bool? value) {
                setState(() {
                  usoDeLentes = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Condição da audição
            const Text("Condição da audição:"),
            RadioListTile(
              title: const Text("Normal"),
              value: "Normal",
              groupValue: condicaoAudicao,
              onChanged: (value) {
                setState(() {
                  condicaoAudicao = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Diminuída"),
              value: "Diminuída",
              groupValue: condicaoAudicao,
              onChanged: (value) {
                setState(() {
                  condicaoAudicao = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Uso de prótese auditiva
            const Text("Uso de prótese auditiva:"),
            RadioListTile(
              title: const Text("Unilateral"),
              value: "Unilateral",
              groupValue: usoDeProteseAudicao,
              onChanged: (value) {
                setState(() {
                  usoDeProteseAudicao = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Bilateral"),
              value: "Bilateral",
              groupValue: usoDeProteseAudicao,
              onChanged: (value) {
                setState(() {
                  usoDeProteseAudicao = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Dor a estimulação tátil
            const Text("Dor à estimulação tátil:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: dorEstimuloTatil == true,
              onChanged: (bool? value) {
                setState(() {
                  dorEstimuloTatil = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: dorEstimuloTatil == false,
              onChanged: (bool? value) {
                setState(() {
                  dorEstimuloTatil = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Como expressa a dor
            const Text("Como expressa a dor:"),
            RadioListTile(
              title: const Text("Localiza a dor"),
              value: "Localiza a dor",
              groupValue: expressaoDor,
              onChanged: (value) {
                setState(() {
                  expressaoDor = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Não sabe localizar a dor"),
              value: "Não sabe localizar a dor",
              groupValue: expressaoDor,
              onChanged: (value) {
                setState(() {
                  expressaoDor = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Gemente"),
              value: "Gemente",
              groupValue: expressaoDor,
              onChanged: (value) {
                setState(() {
                  expressaoDor = value.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
