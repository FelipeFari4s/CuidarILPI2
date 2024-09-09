import 'package:flutter/material.dart';

class SonoRepousoForm extends StatefulWidget {
  @override
  _SonoRepousoFormState createState() => _SonoRepousoFormState();
}

class _SonoRepousoFormState extends State<SonoRepousoForm> {
  bool? sonoPreservado;
  String? horarioSono;
  List<String> caracteristicasSono = [];
  bool usaMedicamento = false;
  String? medicamento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sono e Repouso"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Sono e Repouso",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Sono preservado
            const Text("Sono preservado:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: sonoPreservado == true,
              onChanged: (bool? value) {
                setState(() {
                  sonoPreservado = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: sonoPreservado == false,
              onChanged: (bool? value) {
                setState(() {
                  sonoPreservado = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Horário do sono
            const Text("Horário do sono:"),
            RadioListTile(
              title: const Text("Matutino"),
              value: "Matutino",
              groupValue: horarioSono,
              onChanged: (value) {
                setState(() {
                  horarioSono = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Vespertino"),
              value: "Vespertino",
              groupValue: horarioSono,
              onChanged: (value) {
                setState(() {
                  horarioSono = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Noturno"),
              value: "Noturno",
              groupValue: horarioSono,
              onChanged: (value) {
                setState(() {
                  horarioSono = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Características do sono
            const Text("Características do sono:"),
            CheckboxListTile(
              title: const Text("Insônia"),
              value: caracteristicasSono.contains("Insônia"),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    caracteristicasSono.add("Insônia");
                  } else {
                    caracteristicasSono.remove("Insônia");
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Acorda durante à noite"),
              value: caracteristicasSono.contains("Acorda durante à noite"),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    caracteristicasSono.add("Acorda durante à noite");
                  } else {
                    caracteristicasSono.remove("Acorda durante à noite");
                  }
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Sonolência diurna"),
              value: caracteristicasSono.contains("Sonolência diurna"),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    caracteristicasSono.add("Sonolência diurna");
                  } else {
                    caracteristicasSono.remove("Sonolência diurna");
                  }
                });
              },
            ),

            const SizedBox(height: 20),

            // Usa medicamento para dormir
            const Text("Usa medicamento para dormir:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: usaMedicamento,
              onChanged: (bool? value) {
                setState(() {
                  usaMedicamento = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: !usaMedicamento,
              onChanged: (bool? value) {
                setState(() {
                  usaMedicamento = !(value ?? false);
                });
              },
            ),
            if (usaMedicamento)
              TextFormField(
                decoration: const InputDecoration(labelText: "Qual medicamento?"),
                onChanged: (value) {
                  setState(() {
                    medicamento = value;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
