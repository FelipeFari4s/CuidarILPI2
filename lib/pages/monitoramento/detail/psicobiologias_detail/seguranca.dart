import 'package:flutter/material.dart';

class SegurancaFisicaMeioAmbienteForm extends StatefulWidget {
  @override
  _SegurancaFisicaMeioAmbienteFormState createState() => _SegurancaFisicaMeioAmbienteFormState();
}

class _SegurancaFisicaMeioAmbienteFormState extends State<SegurancaFisicaMeioAmbienteForm> {
  bool? usoCorrimao;
  bool? gradesNaCama;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segurança Física e Meio Ambiente"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Segurança Física e Meio Ambiente",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Uso de Corrimão
            const Text("Uso de Corrimão:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: usoCorrimao == true,
              onChanged: (bool? value) {
                setState(() {
                  usoCorrimao = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: usoCorrimao == false,
              onChanged: (bool? value) {
                setState(() {
                  usoCorrimao = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Grades na Cama
            const Text("Grades na Cama:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: gradesNaCama == true,
              onChanged: (bool? value) {
                setState(() {
                  gradesNaCama = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: gradesNaCama == false,
              onChanged: (bool? value) {
                setState(() {
                  gradesNaCama = value == false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
