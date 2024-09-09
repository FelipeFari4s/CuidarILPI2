import 'package:flutter/material.dart';

class MedicationScreen extends StatefulWidget {
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  final List<Map<String, dynamic>> medicamentos = [];
  Map<String, dynamic>? selectedMedicamento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicações do dia'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Medicações do dia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Tabela de Medicações com scroll horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Medicação')),
                  DataColumn(label: Text('Dose')),
                  DataColumn(label: Text('Via')),
                  DataColumn(label: Text('Horários')),
                  DataColumn(label: Text('Checagem')),
                  DataColumn(label: Text('Observação')),
                ],
                rows: medicamentos.map((medicamento) {
                  return DataRow(
                    cells: [
                      DataCell(Text(medicamento['medicacao'])),
                      DataCell(Text(medicamento['dose'])),
                      DataCell(Text(medicamento['via'])),
                      DataCell(Text(medicamento['horarios'])),
                      DataCell(
                        Checkbox(
                          value: medicamento['checagem'],
                          onChanged: (value) {
                            setState(() {
                              medicamento['checagem'] = value;
                            });
                          },
                        ),
                      ),
                      DataCell(
                        TextField(
                          controller: TextEditingController(
                              text: medicamento['observacao']),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              medicamento['observacao'] = value;
                            });
                          },
                        ),
                      ),
                    ],
                    selected: medicamento == selectedMedicamento,
                    onSelectChanged: (selected) {
                      if (selected != null && selected) {
                        setState(() {
                          selectedMedicamento = medicamento;
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
                  child: const Text('Cadastrar Medicação'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: selectedMedicamento != null
                      ? () => _showEditarDialog()
                      : null,
                  child: const Text('Editar Medicação'),
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
    final TextEditingController medicacaoController = TextEditingController();
    final TextEditingController doseController = TextEditingController();
    final TextEditingController viaController = TextEditingController();
    final TextEditingController horariosController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cadastrar Medicação'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: medicacaoController,
                decoration: const InputDecoration(labelText: 'Medicação'),
              ),
              TextField(
                controller: doseController,
                decoration: const InputDecoration(labelText: 'Dose'),
              ),
              TextField(
                controller: viaController,
                decoration: const InputDecoration(labelText: 'Via'),
              ),
              TextField(
                controller: horariosController,
                decoration: const InputDecoration(labelText: 'Horários'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  medicamentos.add({
                    'medicacao': medicacaoController.text,
                    'dose': doseController.text,
                    'via': viaController.text,
                    'horarios': horariosController.text,
                    'checagem': false,
                    'observacao': '',
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
    final TextEditingController medicacaoController =
        TextEditingController(text: selectedMedicamento?['medicacao']);
    final TextEditingController doseController =
        TextEditingController(text: selectedMedicamento?['dose']);
    final TextEditingController viaController =
        TextEditingController(text: selectedMedicamento?['via']);
    final TextEditingController horariosController =
        TextEditingController(text: selectedMedicamento?['horarios']);
    final TextEditingController observacaoController =
        TextEditingController(text: selectedMedicamento?['observacao']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Medicação'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: medicacaoController,
                decoration: const InputDecoration(labelText: 'Medicação'),
              ),
              TextField(
                controller: doseController,
                decoration: const InputDecoration(labelText: 'Dose'),
              ),
              TextField(
                controller: viaController,
                decoration: const InputDecoration(labelText: 'Via'),
              ),
              TextField(
                controller: horariosController,
                decoration: const InputDecoration(labelText: 'Horários'),
              ),
              TextField(
                controller: observacaoController,
                decoration: const InputDecoration(labelText: 'Observação'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final index = medicamentos.indexOf(selectedMedicamento!);
                  medicamentos[index] = {
                    'medicacao': medicacaoController.text,
                    'dose': doseController.text,
                    'via': viaController.text,
                    'horarios': horariosController.text,
                    'checagem': selectedMedicamento!['checagem'],
                    'observacao': observacaoController.text,
                  };
                  selectedMedicamento = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  medicamentos.remove(selectedMedicamento);
                  selectedMedicamento = null;
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
