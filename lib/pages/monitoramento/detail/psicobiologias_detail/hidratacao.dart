import 'package:flutter/material.dart';

class HidratacaoForm extends StatefulWidget {
  @override
  _HidratacaoFormState createState() => _HidratacaoFormState();
}

class _HidratacaoFormState extends State<HidratacaoForm> {
  String? hidratacao;
  String? turgorElasticidade;
  String? ingestaHidrica;
  String? solicitaIngesta;
  String? precisaAuxilio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hidratação"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Hidratação",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Hidratado / Desidratado
            const Text("Hidratação:"),
            RadioListTile(
              title: const Text("Hidratado"),
              value: "Hidratado",
              groupValue: hidratacao,
              onChanged: (value) {
                setState(() {
                  hidratacao = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Desidratado"),
              value: "Desidratado",
              groupValue: hidratacao,
              onChanged: (value) {
                setState(() {
                  hidratacao = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Turgor e elasticidade da pele
            const Text("Turgor e elasticidade da pele:"),
            RadioListTile(
              title: const Text("+/4+"),
              value: "+/4+",
              groupValue: turgorElasticidade,
              onChanged: (value) {
                setState(() {
                  turgorElasticidade = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("++/4+"),
              value: "++/4+",
              groupValue: turgorElasticidade,
              onChanged: (value) {
                setState(() {
                  turgorElasticidade = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("+++/4+"),
              value: "+++/4+",
              groupValue: turgorElasticidade,
              onChanged: (value) {
                setState(() {
                  turgorElasticidade = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("++++/4+"),
              value: "++++/4+",
              groupValue: turgorElasticidade,
              onChanged: (value) {
                setState(() {
                  turgorElasticidade = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Ingesta hídrica
            const Text("Ingesta hídrica:"),
            RadioListTile(
              title: const Text("Insatisfatória"),
              value: "Insatisfatória",
              groupValue: ingestaHidrica,
              onChanged: (value) {
                setState(() {
                  ingestaHidrica = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Regular"),
              value: "Regular",
              groupValue: ingestaHidrica,
              onChanged: (value) {
                setState(() {
                  ingestaHidrica = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Satisfatória"),
              value: "Satisfatória",
              groupValue: ingestaHidrica,
              onChanged: (value) {
                setState(() {
                  ingestaHidrica = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Solicita ingesta hídrica
            const Text("Solicita ingesta hídrica:"),
            RadioListTile(
              title: const Text("Sim"),
              value: "Sim",
              groupValue: solicitaIngesta,
              onChanged: (value) {
                setState(() {
                  solicitaIngesta = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Não"),
              value: "Não",
              groupValue: solicitaIngesta,
              onChanged: (value) {
                setState(() {
                  solicitaIngesta = value.toString();
                });
              },
            ),

            const SizedBox(height: 20),

            // Precisa de auxílio para ingesta hídrica
            const Text("Precisa de auxílio para ingesta hídrica:"),
            RadioListTile(
              title: const Text("Sim"),
              value: "Sim",
              groupValue: precisaAuxilio,
              onChanged: (value) {
                setState(() {
                  precisaAuxilio = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("Não"),
              value: "Não",
              groupValue: precisaAuxilio,
              onChanged: (value) {
                setState(() {
                  precisaAuxilio = value.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
