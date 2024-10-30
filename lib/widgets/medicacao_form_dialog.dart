import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/medicacao_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';

class MedicacaoFormDialog extends StatefulWidget {
  final MedicacaoModelo? medicacao;
  final String idIdoso;

  const MedicacaoFormDialog({
    Key? key, 
    this.medicacao,
    required this.idIdoso,
  }) : super(key: key);

  @override
  State<MedicacaoFormDialog> createState() => _MedicacaoFormDialogState();
}

class _MedicacaoFormDialogState extends State<MedicacaoFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _dosagemController;
  late TextEditingController _viaController;
  late TextEditingController _horarioController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.medicacao?.nome ?? '');
    _dosagemController = TextEditingController(text: widget.medicacao?.dosagem ?? '');
    _viaController = TextEditingController(text: widget.medicacao?.via ?? '');
    _horarioController = TextEditingController(text: widget.medicacao?.horario ?? '');
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _dosagemController.dispose();
    _viaController.dispose();
    _horarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.medicacao == null ? 'Nova Medicação' : 'Editar Medicação'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Medicação',
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
                controller: _dosagemController,
                decoration: InputDecoration(
                  labelText: 'Dosagem',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a dosagem';
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
              TextFormField(
                controller: _horarioController,
                decoration: InputDecoration(
                  labelText: 'Horário',
                  border: OutlineInputBorder(),
                  hintText: 'Ex: 08:00',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o horário';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (widget.medicacao != null)
          TextButton(
            onPressed: () {
              // Confirmar exclusão
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Confirmar Exclusão'),
                  content: Text('Deseja realmente excluir esta medicação?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Fecha o dialog de confirmação
                        Navigator.pop(context, 'DELETE'); // Fecha o form com resultado DELETE
                      },
                      child: Text('Excluir', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            },
            child: Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final medicacao = MedicacaoModelo(
                id: widget.medicacao?.id ?? DateTime.now().toString(),
                idIdoso: widget.idIdoso,
                nome: _nomeController.text,
                dosagem: _dosagemController.text,
                via: _viaController.text,
                horario: _horarioController.text,
                data: DateTime.now(),
              );
              Navigator.pop(context, medicacao);
            }
          },
          child: Text('Salvar'),
        ),
      ],
    );
  }
}