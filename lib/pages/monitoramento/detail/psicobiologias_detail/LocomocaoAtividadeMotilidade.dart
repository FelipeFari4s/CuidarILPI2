import 'package:flutter/material.dart';

class LocomocaoAtividadeMotilidadeForm extends StatefulWidget {
  @override
  _LocomocaoAtividadeMotilidadeFormState createState() => _LocomocaoAtividadeMotilidadeFormState();
}

class _LocomocaoAtividadeMotilidadeFormState extends State<LocomocaoAtividadeMotilidadeForm> {
  bool? deambula;
  bool? auxilioDeambular;
  String? usoOrtese;
  bool? equilibrioPreservado;
  bool? exercicioFisicoRegular;
  String? tipoExercicio;
  bool? limitacaoFisica;
  String? qualLimitacao;
  bool? auxilioMovimentar;
  bool? rigidezPescoco;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locomoção, Atividade Física e Motilidade"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Locomoção, Atividade Física e Motilidade",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Deambula
            const Text("Deambula:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: deambula == true,
              onChanged: (bool? value) {
                setState(() {
                  deambula = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: deambula == false,
              onChanged: (bool? value) {
                setState(() {
                  deambula = value == false;
                });
              },
            ),
            if (deambula == false) ...[
              const Text("Se não:"),
              CheckboxListTile(
                title: const Text("Acamado"),
                value: usoOrtese == "Acamado",
                onChanged: (bool? value) {
                  setState(() {
                    usoOrtese = value == true ? "Acamado" : null;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("Cadeirante"),
                value: usoOrtese == "Cadeirante",
                onChanged: (bool? value) {
                  setState(() {
                    usoOrtese = value == true ? "Cadeirante" : null;
                  });
                },
              ),
            ],

            const SizedBox(height: 20),

            // Auxílio para deambular
            const Text("Auxílio para deambular:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: auxilioDeambular == true,
              onChanged: (bool? value) {
                setState(() {
                  auxilioDeambular = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: auxilioDeambular == false,
              onChanged: (bool? value) {
                setState(() {
                  auxilioDeambular = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Uso de Órtese
            const Text("Uso de Órtese:"),
            CheckboxListTile(
              title: const Text("Andador"),
              value: usoOrtese == "Andador",
              onChanged: (bool? value) {
                setState(() {
                  usoOrtese = value == true ? "Andador" : null;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Cadeira de rodas"),
              value: usoOrtese == "Cadeira de rodas",
              onChanged: (bool? value) {
                setState(() {
                  usoOrtese = value == true ? "Cadeira de rodas" : null;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Bengala"),
              value: usoOrtese == "Bengala",
              onChanged: (bool? value) {
                setState(() {
                  usoOrtese = value == true ? "Bengala" : null;
                });
              },
            ),

            const SizedBox(height: 20),

            // Equilíbrio Preservado
            const Text("Equilíbrio Preservado:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: equilibrioPreservado == true,
              onChanged: (bool? value) {
                setState(() {
                  equilibrioPreservado = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: equilibrioPreservado == false,
              onChanged: (bool? value) {
                setState(() {
                  equilibrioPreservado = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Exercício Físico regular
            const Text("Exercício Físico regular:"),
            CheckboxListTile(
              title: const Text("Não"),
              value: exercicioFisicoRegular == false,
              onChanged: (bool? value) {
                setState(() {
                  exercicioFisicoRegular = value == false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Sim"),
              value: exercicioFisicoRegular == true,
              onChanged: (bool? value) {
                setState(() {
                  exercicioFisicoRegular = value == true;
                });
              },
            ),
            if (exercicioFisicoRegular == true) ...[
              const Text("Tipo de exercício:"),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite o tipo de exercício',
                ),
                onChanged: (value) {
                  setState(() {
                    tipoExercicio = value;
                  });
                },
              ),
            ],

            const SizedBox(height: 20),

            // Limitação física
            const Text("Limitação física:"),
            CheckboxListTile(
              title: const Text("Não"),
              value: limitacaoFisica == false,
              onChanged: (bool? value) {
                setState(() {
                  limitacaoFisica = value == false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Sim"),
              value: limitacaoFisica == true,
              onChanged: (bool? value) {
                setState(() {
                  limitacaoFisica = value == true;
                });
              },
            ),
            if (limitacaoFisica == true) ...[
              const Text("Qual:"),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite a limitação física',
                ),
                onChanged: (value) {
                  setState(() {
                    qualLimitacao = value;
                  });
                },
              ),
            ],

            const SizedBox(height: 20),

            // Auxílio para se movimentar
            const Text("Auxílio para se movimentar:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: auxilioMovimentar == true,
              onChanged: (bool? value) {
                setState(() {
                  auxilioMovimentar = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: auxilioMovimentar == false,
              onChanged: (bool? value) {
                setState(() {
                  auxilioMovimentar = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Rigidez de pescoço
            const Text("Rigidez de pescoço:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: rigidezPescoco == true,
              onChanged: (bool? value) {
                setState(() {
                  rigidezPescoco = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: rigidezPescoco == false,
              onChanged: (bool? value) {
                setState(() {
                  rigidezPescoco = value == false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
