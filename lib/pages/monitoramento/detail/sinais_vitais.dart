import 'package:flutter/material.dart';

class VitalSignsScreen extends StatefulWidget {
  @override
  _VitalSignsScreenState createState() => _VitalSignsScreenState();
}

class _VitalSignsScreenState extends State<VitalSignsScreen> {
  final List<Map<String, dynamic>> sinaisVitais = [];
  Map<String, dynamic>? selectedSinalVital;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinais Vitais do dia'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sinais Vitais do dia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Tabela de Sinais Vitais com scroll horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Temperatura (ºC)')),
                  DataColumn(label: Text('Frequência Cardíaca (bpm)')),
                  DataColumn(label: Text('Respiração (irpm)')),
                  DataColumn(label: Text('Pressão Arterial (mmHg)')),
                ],
                rows: sinaisVitais.map((sinalVital) {
                  return DataRow(
                    cells: [
                      DataCell(Text(sinalVital['temperatura'])),
                      DataCell(Text(sinalVital['frequenciaCardiaca'])),
                      DataCell(Text(sinalVital['respiracao'])),
                      DataCell(Text(sinalVital['pressaoArterial'])),
                    ],
                    selected: sinalVital == selectedSinalVital,
                    onSelectChanged: (selected) {
                      if (selected != null && selected) {
                        setState(() {
                          selectedSinalVital = sinalVital;
                        });
                      }
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _showCadastrarDialog(),
                  child: const Text('Cadastrar Sinais Vitais'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: selectedSinalVital != null
                      ? () => _showEditarDialog()
                      : null,
                  child: const Text('Editar Sinais Vitais'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showCadastrarDialog() {
    final TextEditingController temperaturaController = TextEditingController();
    final TextEditingController frequenciaCardiacaController =
        TextEditingController();
    final TextEditingController respiracaoController = TextEditingController();
    final TextEditingController pressaoArterialController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cadastrar Sinais Vitais'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: temperaturaController,
                decoration:
                    const InputDecoration(labelText: 'Temperatura (ºC)'),
              ),
              TextField(
                controller: frequenciaCardiacaController,
                decoration: const InputDecoration(
                    labelText: 'Frequência Cardíaca (bpm)'),
              ),
              TextField(
                controller: respiracaoController,
                decoration:
                    const InputDecoration(labelText: 'Respiração (irpm)'),
              ),
              TextField(
                controller: pressaoArterialController,
                decoration:
                    const InputDecoration(labelText: 'Pressão Arterial (mmHg)'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sinaisVitais.add({
                    'temperatura': temperaturaController.text,
                    'frequenciaCardiaca': frequenciaCardiacaController.text,
                    'respiracao': respiracaoController.text,
                    'pressaoArterial': pressaoArterialController.text,
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Cadastrar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _showEditarDialog() {
    final TextEditingController temperaturaController =
        TextEditingController(text: selectedSinalVital?['temperatura']);
    final TextEditingController frequenciaCardiacaController =
        TextEditingController(text: selectedSinalVital?['frequenciaCardiaca']);
    final TextEditingController respiracaoController =
        TextEditingController(text: selectedSinalVital?['respiracao']);
    final TextEditingController pressaoArterialController =
        TextEditingController(text: selectedSinalVital?['pressaoArterial']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Sinais Vitais'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: temperaturaController,
                decoration:
                    const InputDecoration(labelText: 'Temperatura (ºC)'),
              ),
              TextField(
                controller: frequenciaCardiacaController,
                decoration: const InputDecoration(
                    labelText: 'Frequência Cardíaca (bpm)'),
              ),
              TextField(
                controller: respiracaoController,
                decoration:
                    const InputDecoration(labelText: 'Respiração (irpm)'),
              ),
              TextField(
                controller: pressaoArterialController,
                decoration:
                    const InputDecoration(labelText: 'Pressão Arterial (mmHg)'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final index = sinaisVitais.indexOf(selectedSinalVital!);
                  sinaisVitais[index] = {
                    'temperatura': temperaturaController.text,
                    'frequenciaCardiaca': frequenciaCardiacaController.text,
                    'respiracao': respiracaoController.text,
                    'pressaoArterial': pressaoArterialController.text,
                  };
                  selectedSinalVital = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sinaisVitais.remove(selectedSinalVital);
                  selectedSinalVital = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Excluir'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
