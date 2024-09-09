import 'package:flutter/material.dart';

class IntegridadePeleForm extends StatefulWidget {
  @override
  _IntegridadePeleFormState createState() => _IntegridadePeleFormState();
}

class _IntegridadePeleFormState extends State<IntegridadePeleForm> {
  bool? peleIntegra;
  bool? peleRessecada;
  bool? presencaLesao;
  String? localLesao;
  String? coloracaoPele;
  String? localColoracao;
  String? edema;
  String? localEdema;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Integridade da Pele"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Integridade da Pele",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Condições da pele
            const Text("Condições da pele:"),
            CheckboxListTile(
              title: const Text("Íntegra"),
              value: peleIntegra == true,
              onChanged: (bool? value) {
                setState(() {
                  peleIntegra = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Ressecada"),
              value: peleRessecada == true,
              onChanged: (bool? value) {
                setState(() {
                  peleRessecada = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Presença de lesão
            const Text("Presença de lesão:"),
            CheckboxListTile(
              title: const Text("Não"),
              value: presencaLesao == false,
              onChanged: (bool? value) {
                setState(() {
                  presencaLesao = value == false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Sim"),
              value: presencaLesao == true,
              onChanged: (bool? value) {
                setState(() {
                  presencaLesao = value;
                });
              },
            ),
            if (presencaLesao == true)
              TextFormField(
                decoration: const InputDecoration(labelText: "Local da lesão"),
                onChanged: (value) {
                  setState(() {
                    localLesao = value;
                  });
                },
              ),

            const SizedBox(height: 20),

            // Coloração da pele
            const Text("Coloração da pele:"),
            RadioListTile(
              title: const Text("Normocorada"),
              value: "Normocorada",
              groupValue: coloracaoPele,
              onChanged: (value) {
                setState(() {
                  coloracaoPele = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Hiperemiada"),
              value: "Hiperemiada",
              groupValue: coloracaoPele,
              onChanged: (value) {
                setState(() {
                  coloracaoPele = value.toString();
                });
              },
            ),
            if (coloracaoPele == "Hiperemiada")
              TextFormField(
                decoration: const InputDecoration(labelText: "Local da coloração"),
                onChanged: (value) {
                  setState(() {
                    localColoracao = value;
                  });
                },
              ),

            const SizedBox(height: 20),

            // Edema
            const Text("Edema:"),
            RadioListTile(
              title: const Text("+/4+"),
              value: "+/4+",
              groupValue: edema,
              onChanged: (value) {
                setState(() {
                  edema = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("++/4+"),
              value: "++/4+",
              groupValue: edema,
              onChanged: (value) {
                setState(() {
                  edema = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("+++/4+"),
              value: "+++/4+",
              groupValue: edema,
              onChanged: (value) {
                setState(() {
                  edema = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("++++/4+"),
              value: "++++/4+",
              groupValue: edema,
              onChanged: (value) {
                setState(() {
                  edema = value.toString();
                });
              },
            ),
            if (edema != null)
              TextFormField(
                decoration: const InputDecoration(labelText: "Local do edema"),
                onChanged: (value) {
                  setState(() {
                    localEdema = value;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
