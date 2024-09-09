import 'package:flutter/material.dart';

class SexualidadeForm extends StatefulWidget {
  @override
  _SexualidadeFormState createState() => _SexualidadeFormState();
}

class _SexualidadeFormState extends State<SexualidadeForm> {
  bool? refereDesejoSexual;
  bool? presencaMasturbacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sexualidade"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Sexualidade",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Refere desejo sexual
            const Text("Refere desejo sexual:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: refereDesejoSexual == true,
              onChanged: (bool? value) {
                setState(() {
                  refereDesejoSexual = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: refereDesejoSexual == false,
              onChanged: (bool? value) {
                setState(() {
                  refereDesejoSexual = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Presença de masturbação
            const Text("Presença de masturbação:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: presencaMasturbacao == true,
              onChanged: (bool? value) {
                setState(() {
                  presencaMasturbacao = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: presencaMasturbacao == false,
              onChanged: (bool? value) {
                setState(() {
                  presencaMasturbacao = value == false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
