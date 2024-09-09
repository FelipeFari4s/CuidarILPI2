import 'package:flutter/material.dart';

class RegulacaoNeuroForm extends StatefulWidget {
  @override
  _RegulacaoNeuroFormState createState() => _RegulacaoNeuroFormState();
}

class _RegulacaoNeuroFormState extends State<RegulacaoNeuroForm> {
  // Variáveis para o nível de consciência
  String? nivelConsciencia;
  bool memoriaPreservada = false;
  bool memoriaPrejudicada = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Necessidades Psicobiológicas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Regulação Neurológica',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Nível de Consciência
            Text('Nível de Consciência:'),
            RadioListTile<String>(
              title: const Text('Consciente'),
              value: 'Consciente',
              groupValue: nivelConsciencia,
              onChanged: (value) {
                setState(() {
                  nivelConsciencia = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Sonolento'),
              value: 'Sonolento',
              groupValue: nivelConsciencia,
              onChanged: (value) {
                setState(() {
                  nivelConsciencia = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Torporoso'),
              value: 'Torporoso',
              groupValue: nivelConsciencia,
              onChanged: (value) {
                setState(() {
                  nivelConsciencia = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Orientado'),
              value: 'Orientado',
              groupValue: nivelConsciencia,
              onChanged: (value) {
                setState(() {
                  nivelConsciencia = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Desorientado'),
              value: 'Desorientado',
              groupValue: nivelConsciencia,
              onChanged: (value) {
                setState(() {
                  nivelConsciencia = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Confuso'),
              value: 'Confuso',
              groupValue: nivelConsciencia,
              onChanged: (value) {
                setState(() {
                  nivelConsciencia = value;
                });
              },
            ),

            SizedBox(height: 20),

            // Memória
            Text('Memória:'),
            CheckboxListTile(
              title: const Text('Preservada'),
              value: memoriaPreservada,
              onChanged: (value) {
                setState(() {
                  memoriaPreservada = value!;
                  if (memoriaPreservada) memoriaPrejudicada = false; // desmarca o outro
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Prejudicada'),
              value: memoriaPrejudicada,
              onChanged: (value) {
                setState(() {
                  memoriaPrejudicada = value!;
                  if (memoriaPrejudicada) memoriaPreservada = false; // desmarca o outro
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
