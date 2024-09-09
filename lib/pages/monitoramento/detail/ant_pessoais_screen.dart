import 'package:flutter/material.dart';

class AntecedentesPessoaisScreen extends StatefulWidget {
  @override
  _AntecedentesPessoaisScreenState createState() => _AntecedentesPessoaisScreenState();
}

class _AntecedentesPessoaisScreenState extends State<AntecedentesPessoaisScreen> {
  final Map<String, bool> comorbidades = {
    'Diabetes': false,
    'Hipertensão': false,
    'Depressão': false,
    'Hipotireoidismo': false,
    'Demência': false,
    'DPOC': false,
    'Doença Renal Crônica': false,
    'Insuficiência Cardíaca': false,
  };

  bool? internacaoHospitalar;
  bool? foiEtilista;
  bool? foiTabagista;

  final TextEditingController outrasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Antecedentes Pessoais'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Antecedentes Pessoais',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text('Comorbidades:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Lista de comorbidades
            ...comorbidades.keys.map((key) {
              return CheckboxListTile(
                title: Text(key),
                value: comorbidades[key],
                onChanged: (bool? value) {
                  setState(() {
                    comorbidades[key] = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              );
            }).toList(),

            // Campo para "Outras comorbidades"
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextField(
                controller: outrasController,
                decoration: const InputDecoration(
                  labelText: 'Outras comorbidades',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text('Internação hospitalar nos últimos 6 meses:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Sim'),
                    value: true,
                    groupValue: internacaoHospitalar,
                    onChanged: (value) {
                      setState(() {
                        internacaoHospitalar = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Não'),
                    value: false,
                    groupValue: internacaoHospitalar,
                    onChanged: (value) {
                      setState(() {
                        internacaoHospitalar = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const Text('Já foi etilista:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Sim'),
                    value: true,
                    groupValue: foiEtilista,
                    onChanged: (value) {
                      setState(() {
                        foiEtilista = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Não'),
                    value: false,
                    groupValue: foiEtilista,
                    onChanged: (value) {
                      setState(() {
                        foiEtilista = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const Text('Já foi tabagista:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Sim'),
                    value: true,
                    groupValue: foiTabagista,
                    onChanged: (value) {
                      setState(() {
                        foiTabagista = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Não'),
                    value: false,
                    groupValue: foiTabagista,
                    onChanged: (value) {
                      setState(() {
                        foiTabagista = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
