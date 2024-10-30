import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/models/medicacao_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:cuidar_ilpi/widgets/medicacao_form_dialog.dart';

class MedicacoesPage extends StatefulWidget {
  final IdosoModelo idoso;

  const MedicacoesPage({Key? key, required this.idoso}) : super(key: key);

  @override
  State<MedicacoesPage> createState() => _MedicacoesPageState();
}

class _MedicacoesPageState extends State<MedicacoesPage> {
  late List<MedicacaoModelo> medicacoes;
  final dateFormat = DateFormat('dd/MM/yyyy');
  final Map<String, TextEditingController> _controllers = {};
  
  @override
  void initState() {
    super.initState();
    // Aqui você deve carregar as medicações do banco de dados
    // Por enquanto, vamos usar dados mockados
    medicacoes = [
      MedicacaoModelo(
        id: '1',
        idIdoso: widget.idoso.id,
        nome: 'Dipirona',
        dosagem: '1000mg',
        via: 'Oral',
        horario: '08:00',
        data: DateTime.now(),
      ),
      MedicacaoModelo(
        id: '2',
        idIdoso: widget.idoso.id,
        nome: 'Rivotril',
        dosagem: '1000mg',
        via: 'Oral',
        horario: '08:00',
        data: DateTime.now(),
      ),
      MedicacaoModelo(
        id: '1',
        idIdoso: widget.idoso.id,
        nome: 'Dipirona',
        dosagem: '1000mg',
        via: 'Oral',
        horario: '08:00',
        data: DateTime.now(),
      ),
      // Adicione mais medicações de exemplo conforme necessário
    ];
    // Inicialize os controllers para cada medicação
    for (var medicacao in medicacoes) {
      _controllers[medicacao.id] = TextEditingController(text: medicacao.observacao);
    }
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _showMedicacaoFormDialog([MedicacaoModelo? medicacao]) async {
    final result = await showDialog<dynamic>(
      context: context,
      builder: (context) => MedicacaoFormDialog(
        medicacao: medicacao,
        idIdoso: widget.idoso.id,
      ),
    );

    if (result != null) {
      setState(() {
        if (result == 'DELETE') {
          medicacoes.removeWhere((m) => m.id == medicacao!.id);
        } else if (result is MedicacaoModelo) {
          if (medicacao != null) {
            // Edição
            final index = medicacoes.indexWhere((m) => m.id == medicacao.id);
            medicacoes[index] = result;
          } else {
            // Novo cadastro
            medicacoes.add(result);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Medicações - ${widget.idoso.nome}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Data: ${dateFormat.format(DateTime.now())}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(AppColors.primary.withOpacity(0.1)),
                columns: const [
                  DataColumn(label: Text('Medicamento')),
                  DataColumn(label: Text('Dosagem')),
                  DataColumn(label: Text('Via')),
                  DataColumn(label: Text('Horário')),
                  DataColumn(label: Text('Checagem')),
                  DataColumn(label: Text('Observação')),
                ],
                rows: medicacoes.map((medicacao) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            Text(medicacao.nome),
                            IconButton(
                              icon: Icon(Icons.edit, size: 20),
                              onPressed: () => _showMedicacaoFormDialog(medicacao),
                            ),
                          ],
                        ),
                      ),
                      DataCell(Text(medicacao.dosagem)),
                      DataCell(Text(medicacao.via)),
                      DataCell(Text(medicacao.horario)),
                      DataCell(
                        Checkbox(
                          value: medicacao.checado,
                          onChanged: (bool? value) {
                            setState(() {
                              medicacao.checado = value ?? false;
                            });
                          },
                        ),
                      ),
                      DataCell(
                        TextField(
                          controller: _controllers[medicacao.id],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Digite uma observação...',
                          ),
                          onChanged: (value) {
                            medicacao.observacao = value;
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMedicacaoFormDialog(),
        child: Icon(Icons.add),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}