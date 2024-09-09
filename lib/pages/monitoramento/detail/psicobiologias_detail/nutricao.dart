import 'package:flutter/material.dart';

class NutricaoForm extends StatefulWidget {
  @override
  _NutricaoFormState createState() => _NutricaoFormState();
}

class _NutricaoFormState extends State<NutricaoForm> {
  // Variáveis para os campos
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController imcController = TextEditingController();
  
  String? aceitacaoAlimentar;
  String? degluticao;
  bool auxilioAlimentar = false;
  String? viaAlimentacao;
  String? dispositivoAlimentacao;
  bool dietaEnteral = false;
  bool usoProtese = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrição'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Dados antropométricos
            Text('Dados Antropométricos:'),
            TextFormField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (cm)'),
            ),
            TextFormField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (Kg)'),
            ),
            TextFormField(
              controller: imcController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'IMC'),
            ),
            SizedBox(height: 20),

            // Aceitação alimentar
            Text('Aceitação Alimentar:'),
            RadioListTile<String>(
              title: const Text('Boa'),
              value: 'Boa',
              groupValue: aceitacaoAlimentar,
              onChanged: (value) {
                setState(() {
                  aceitacaoAlimentar = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Regular'),
              value: 'Regular',
              groupValue: aceitacaoAlimentar,
              onChanged: (value) {
                setState(() {
                  aceitacaoAlimentar = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Insuficiente'),
              value: 'Insuficiente',
              groupValue: aceitacaoAlimentar,
              onChanged: (value) {
                setState(() {
                  aceitacaoAlimentar = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Deglutição
            Text('Deglutição:'),
            RadioListTile<String>(
              title: const Text('Disfagia'),
              value: 'Disfagia',
              groupValue: degluticao,
              onChanged: (value) {
                setState(() {
                  degluticao = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Engasgo'),
              value: 'Engasgo',
              groupValue: degluticao,
              onChanged: (value) {
                setState(() {
                  degluticao = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Auxílio para se alimentar
            Text('Auxílio para se alimentar:'),
            CheckboxListTile(
              title: const Text('Sim'),
              value: auxilioAlimentar,
              onChanged: (value) {
                setState(() {
                  auxilioAlimentar = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Não'),
              value: !auxilioAlimentar,
              onChanged: (value) {
                setState(() {
                  auxilioAlimentar = !value!;
                });
              },
            ),
            SizedBox(height: 20),

            // Via de administração do alimento
            Text('Via de administração do alimento:'),
            RadioListTile<String>(
              title: const Text('Oral'),
              value: 'Oral',
              groupValue: viaAlimentacao,
              onChanged: (value) {
                setState(() {
                  viaAlimentacao = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Gástrica'),
              value: 'Gástrica',
              groupValue: viaAlimentacao,
              onChanged: (value) {
                setState(() {
                  viaAlimentacao = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Enteral'),
              value: 'Enteral',
              groupValue: viaAlimentacao,
              onChanged: (value) {
                setState(() {
                  viaAlimentacao = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Dispositivo para alimentação
            Text('Dispositivo para alimentação:'),
            RadioListTile<String>(
              title: const Text('SNG'),
              value: 'SNG',
              groupValue: dispositivoAlimentacao,
              onChanged: (value) {
                setState(() {
                  dispositivoAlimentacao = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('SNE'),
              value: 'SNE',
              groupValue: dispositivoAlimentacao,
              onChanged: (value) {
                setState(() {
                  dispositivoAlimentacao = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Gastrostomia'),
              value: 'Gastrostomia',
              groupValue: dispositivoAlimentacao,
              onChanged: (value) {
                setState(() {
                  dispositivoAlimentacao = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Dieta enteral
            Text('Dieta enteral:'),
            CheckboxListTile(
              title: const Text('Sim'),
              value: dietaEnteral,
              onChanged: (value) {
                setState(() {
                  dietaEnteral = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Não'),
              value: !dietaEnteral,
              onChanged: (value) {
                setState(() {
                  dietaEnteral = !value!;
                });
              },
            ),
            SizedBox(height: 20),

            // Uso de Prótese
            Text('Uso de Prótese:'),
            CheckboxListTile(
              title: const Text('Sim'),
              value: usoProtese,
              onChanged: (value) {
                setState(() {
                  usoProtese = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Não'),
              value: !usoProtese,
              onChanged: (value) {
                setState(() {
                  usoProtese = !value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
