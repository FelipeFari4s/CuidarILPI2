import 'package:flutter/material.dart';

class PsicoespirituaisForm extends StatefulWidget {
  @override
  _PsicoespirituaisFormState createState() => _PsicoespirituaisFormState();
}

class _PsicoespirituaisFormState extends State<PsicoespirituaisForm> {
  // Variáveis para armazenar os estados dos campos
  bool temReligiao = false;
  String religiaoQual = '';
  bool necessidadeCerimonias = false;
  bool participaPraticasComplementares = false;
  String praticasComplementaresQual = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Necessidades Psicoespirituais'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção: Espiritualidade
            Text(
              'Espiritualidade',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            // Religião
            Row(
              children: [
                Expanded(child: Text('Religião:')),
                Checkbox(
                  value: temReligiao,
                  onChanged: (bool? value) {
                    setState(() {
                      temReligiao = value ?? false;
                    });
                  },
                ),
                Text('Sim'),
                Checkbox(
                  value: !temReligiao,
                  onChanged: (bool? value) {
                    setState(() {
                      temReligiao = !(value ?? true);
                    });
                  },
                ),
                Text('Não'),
              ],
            ),
            if (temReligiao)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Qual?'),
                  onChanged: (value) {
                    setState(() {
                      religiaoQual = value;
                    });
                  },
                ),
              ),

            // Necessidade de Participar de Cerimônias Religiosas
            CheckboxListTile(
              title: Text('Necessidade de participar de cerimônias religiosas'),
              value: necessidadeCerimonias,
              onChanged: (bool? value) {
                setState(() {
                  necessidadeCerimonias = value ?? false;
                });
              },
            ),

            // Participação em Práticas Integrativas Complementares
            Row(
              children: [
                Expanded(child: Text('Participa de práticas integrativas complementares:')),
                Checkbox(
                  value: participaPraticasComplementares,
                  onChanged: (bool? value) {
                    setState(() {
                      participaPraticasComplementares = value ?? false;
                    });
                  },
                ),
                Text('Sim'),
                Checkbox(
                  value: !participaPraticasComplementares,
                  onChanged: (bool? value) {
                    setState(() {
                      participaPraticasComplementares = !(value ?? true);
                    });
                  },
                ),
                Text('Não'),
              ],
            ),
            if (participaPraticasComplementares)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Qual?'),
                  onChanged: (value) {
                    setState(() {
                      praticasComplementaresQual = value;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
