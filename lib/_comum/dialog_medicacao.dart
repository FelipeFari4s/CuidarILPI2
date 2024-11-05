import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/models/medicacao_modelo.dart';
import 'package:uuid/uuid.dart';

class DialogMedicacao extends StatefulWidget {
  final String idosoId;
  final MedicacaoModelo? medicacao;

  DialogMedicacao({
    required this.idosoId,
    this.medicacao,
  });

  @override
  _DialogMedicacaoState createState() => _DialogMedicacaoState();
}

class _DialogMedicacaoState extends State<DialogMedicacao> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _doseController = TextEditingController();
  final _viaController = TextEditingController();
  final List<TextEditingController> _horariosControllers = [TextEditingController()];
  final _observacaoController = TextEditingController();
  bool _checagem = false;
  DateTime _dataRegistro = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.medicacao != null) {
      _nomeController.text = widget.medicacao!.nome;
      _doseController.text = widget.medicacao!.dose;
      _viaController.text = widget.medicacao!.via;
      _horariosControllers.clear();
      for (var horario in widget.medicacao!.horarios) {
        _horariosControllers.add(TextEditingController(text: horario));
      }
      _observacaoController.text = widget.medicacao!.observacao;
      _checagem = widget.medicacao!.checagem;
      _dataRegistro = widget.medicacao!.dataRegistro;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.medicacao == null ? 'Nova Medicação' : 'Editar Medicação',
        style: TextStyle(color: AppColors.primary),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome da Medicação',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome da medicação';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _doseController,
                decoration: InputDecoration(
                  labelText: 'Dose',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a dose';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _viaController,
                decoration: InputDecoration(
                  labelText: 'Via de Administração',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a via de administração';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Horários',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              ..._buildHorariosFields(),
              TextButton.icon(
                onPressed: _addHorarioField,
                icon: Icon(Icons.add),
                label: Text('Adicionar Horário'),
              ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status da Administração',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _checagem = !_checagem;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: _checagem ? Colors.green[50] : Colors.orange[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _checagem ? Colors.green : Colors.orange,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _checagem ? Icons.check_circle : Icons.pending,
                              color: _checagem ? Colors.green : Colors.orange,
                            ),
                            SizedBox(width: 12),
                            Text(
                              _checagem ? 'Medicação Administrada' : 'Pendente',
                              style: TextStyle(
                                color: _checagem ? Colors.green : Colors.orange,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _observacaoController,
                      decoration: InputDecoration(
                        labelText: 'Observações',
                        hintText: 'Adicione observações sobre a administração...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.note_add_outlined),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () => _selecionarData(context),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: AppColors.primary),
                      SizedBox(width: 8),
                      Text(
                        'Data: ${_formatarData(_dataRegistro)}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        ElevatedButton.icon(
          onPressed: _salvarMedicacao,
          icon: Icon(Icons.save),
          label: Text('Salvar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildHorariosFields() {
    return _horariosControllers.asMap().entries.map((entry) {
      int idx = entry.key;
      var controller = entry.value;
      return Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Horário ${idx + 1}',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => _selecionarHorario(controller),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione o horário';
                  }
                  return null;
                },
              ),
            ),
            if (idx > 0)
              IconButton(
                icon: Icon(Icons.remove_circle_outline, color: Colors.red),
                onPressed: () => _removerHorario(idx),
              ),
          ],
        ),
      );
    }).toList();
  }

  void _addHorarioField() {
    setState(() {
      _horariosControllers.add(TextEditingController());
    });
  }

  void _removerHorario(int index) {
    setState(() {
      _horariosControllers[index].dispose();
      _horariosControllers.removeAt(index);
    });
  }

  Future<void> _selecionarHorario(TextEditingController controller) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      String formattedTime =
          '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
      controller.text = formattedTime;
    }
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }

  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dataRegistro,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dataRegistro = picked;
      });
    }
  }

  void _salvarMedicacao() {
    if (_formKey.currentState!.validate()) {
      final medicacao = MedicacaoModelo(
        id: widget.medicacao?.id ?? const Uuid().v1(),
        idosoId: widget.idosoId,
        nome: _nomeController.text,
        dose: _doseController.text,
        via: _viaController.text,
        horarios: _horariosControllers.map((c) => c.text).toList(),
        dataRegistro: _dataRegistro,
        checagem: _checagem,
        observacao: _observacaoController.text,
      );

      Navigator.pop(context, medicacao);
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _doseController.dispose();
    _viaController.dispose();
    for (var controller in _horariosControllers) {
      controller.dispose();
    }
    _observacaoController.dispose();
    super.dispose();
  }
} 