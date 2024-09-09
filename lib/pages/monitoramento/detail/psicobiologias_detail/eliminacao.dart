import 'package:flutter/material.dart';

class EliminacaoForm extends StatefulWidget {
  @override
  _EliminacaoFormState createState() => _EliminacaoFormState();
}

class _EliminacaoFormState extends State<EliminacaoForm> {
  String? diurese;
  String? eliminacaoIntestinal;
  final TextEditingController aspectoDiureseController = TextEditingController();
  final TextEditingController aspectoFezesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eliminação"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Eliminação",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Diurese
            const Text("Diurese:"),
            RadioListTile(
              title: const Text("Espontânea"),
              value: "Espontânea",
              groupValue: diurese,
              onChanged: (value) {
                setState(() {
                  diurese = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Fralda"),
              value: "Fralda",
              groupValue: diurese,
              onChanged: (value) {
                setState(() {
                  diurese = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Incontinência urinária"),
              value: "Incontinência urinária",
              groupValue: diurese,
              onChanged: (value) {
                setState(() {
                  diurese = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Poliúria"),
              value: "Poliúria",
              groupValue: diurese,
              onChanged: (value) {
                setState(() {
                  diurese = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Oligúria"),
              value: "Oligúria",
              groupValue: diurese,
              onChanged: (value) {
                setState(() {
                  diurese = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Nictúria"),
              value: "Nictúria",
              groupValue: diurese,
              onChanged: (value) {
                setState(() {
                  diurese = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Aspecto da diurese
            const Text("Aspecto da diurese:"),
            TextField(
              controller: aspectoDiureseController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Descreva o aspecto da diurese",
              ),
              maxLines: 2,
            ),

            const SizedBox(height: 20),

            // Eliminação intestinal
            const Text("Eliminação intestinal:"),
            RadioListTile(
              title: const Text("Presente"),
              value: "Presente",
              groupValue: eliminacaoIntestinal,
              onChanged: (value) {
                setState(() {
                  eliminacaoIntestinal = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Ausente"),
              value: "Ausente",
              groupValue: eliminacaoIntestinal,
              onChanged: (value) {
                setState(() {
                  eliminacaoIntestinal = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Incontinência fecal"),
              value: "Incontinência fecal",
              groupValue: eliminacaoIntestinal,
              onChanged: (value) {
                setState(() {
                  eliminacaoIntestinal = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Aspecto das fezes
            const Text("Aspecto das fezes:"),
            TextField(
              controller: aspectoFezesController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Descreva o aspecto das fezes",
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    aspectoDiureseController.dispose();
    aspectoFezesController.dispose();
    super.dispose();
  }
}
