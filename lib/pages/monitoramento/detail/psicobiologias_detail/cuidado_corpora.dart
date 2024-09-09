import 'package:flutter/material.dart';

class CuidadoCorporalForm extends StatefulWidget {
  @override
  _CuidadoCorporalFormState createState() => _CuidadoCorporalFormState();
}

class _CuidadoCorporalFormState extends State<CuidadoCorporalForm> {
  bool? higieneCorporalSatisfatoria;
  bool? auxilioBanho;
  bool? auxilioTrocaRoupa;
  bool? higieneBucalSatisfatoria;
  bool? auxilioHigieneBucal;
  bool? problemasDentarios;
  bool? gengivites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuidado Corporal"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Cuidado Corporal",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Higiene do corpo
            const Text("Higiene do corpo:"),
            CheckboxListTile(
              title: const Text("Satisfatória"),
              value: higieneCorporalSatisfatoria == true,
              onChanged: (bool? value) {
                setState(() {
                  higieneCorporalSatisfatoria = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Insatisfatória"),
              value: higieneCorporalSatisfatoria == false,
              onChanged: (bool? value) {
                setState(() {
                  higieneCorporalSatisfatoria = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Auxílio para o banho
            const Text("Auxílio para o banho:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: auxilioBanho == true,
              onChanged: (bool? value) {
                setState(() {
                  auxilioBanho = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: auxilioBanho == false,
              onChanged: (bool? value) {
                setState(() {
                  auxilioBanho = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Auxílio para trocar a roupa
            const Text("Auxílio para trocar a roupa:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: auxilioTrocaRoupa == true,
              onChanged: (bool? value) {
                setState(() {
                  auxilioTrocaRoupa = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: auxilioTrocaRoupa == false,
              onChanged: (bool? value) {
                setState(() {
                  auxilioTrocaRoupa = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Higiene bucal
            const Text("Higiene bucal:"),
            CheckboxListTile(
              title: const Text("Satisfatória"),
              value: higieneBucalSatisfatoria == true,
              onChanged: (bool? value) {
                setState(() {
                  higieneBucalSatisfatoria = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Insatisfatória"),
              value: higieneBucalSatisfatoria == false,
              onChanged: (bool? value) {
                setState(() {
                  higieneBucalSatisfatoria = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Auxílio para realizar a higiene bucal
            const Text("Auxílio para realizar a higiene bucal:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: auxilioHigieneBucal == true,
              onChanged: (bool? value) {
                setState(() {
                  auxilioHigieneBucal = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: auxilioHigieneBucal == false,
              onChanged: (bool? value) {
                setState(() {
                  auxilioHigieneBucal = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Problemas dentários
            const Text("Problemas dentários:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: problemasDentarios == true,
              onChanged: (bool? value) {
                setState(() {
                  problemasDentarios = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: problemasDentarios == false,
              onChanged: (bool? value) {
                setState(() {
                  problemasDentarios = value == false;
                });
              },
            ),

            const SizedBox(height: 20),

            // Gengivites
            const Text("Gengivites:"),
            CheckboxListTile(
              title: const Text("Sim"),
              value: gengivites == true,
              onChanged: (bool? value) {
                setState(() {
                  gengivites = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Não"),
              value: gengivites == false,
              onChanged: (bool? value) {
                setState(() {
                  gengivites = value == false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
