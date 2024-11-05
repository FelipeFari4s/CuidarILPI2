import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cuidar_ilpi/models/sinais_vitais_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:uuid/uuid.dart';

class DialogSinaisVitais extends StatefulWidget {
  final String idosoId;
  final SinaisVitaisModelo? sinaisVitais;

  DialogSinaisVitais({
    required this.idosoId,
    this.sinaisVitais,
  });

  @override
  _DialogSinaisVitaisState createState() => _DialogSinaisVitaisState();
}

class _DialogSinaisVitaisState extends State<DialogSinaisVitais> {
  final _formKey = GlobalKey<FormState>();
  final _temperaturaController = TextEditingController();
  final _frequenciaCardiacaController = TextEditingController();
  final _respiracaoController = TextEditingController();
  final _pressaoArterialController = TextEditingController();
  final _observacaoController = TextEditingController();
  DateTime _dataRegistro = DateTime.now();
  TimeOfDay _horarioRegistro = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    if (widget.sinaisVitais != null) {
      _temperaturaController.text = widget.sinaisVitais!.temperatura;
      _frequenciaCardiacaController.text = widget.sinaisVitais!.frequenciaCardiaca;
      _respiracaoController.text = widget.sinaisVitais!.respiracao;
      _pressaoArterialController.text = widget.sinaisVitais!.pressaoArterial;
      _observacaoController.text = widget.sinaisVitais!.observacao;
      _dataRegistro = widget.sinaisVitais!.dataRegistro;
      _horarioRegistro = TimeOfDay.fromDateTime(widget.sinaisVitais!.dataRegistro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.sinaisVitais == null
            ? 'Novo Registro'
            : 'Editar Registro',
        style: TextStyle(color: AppColors.primary),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTimeField(),
              SizedBox(height: 16),
              TextFormField(
                controller: _temperaturaController,
                decoration: InputDecoration(
                  labelText: 'Temperatura (ºC)',
                  border: OutlineInputBorder(),
                  suffixText: 'ºC',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,1}$')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _frequenciaCardiacaController,
                decoration: InputDecoration(
                  labelText: 'Frequência Cardíaca',
                  border: OutlineInputBorder(),
                  suffixText: 'bpm',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _respiracaoController,
                decoration: InputDecoration(
                  labelText: 'Respiração',
                  border: OutlineInputBorder(),
                  suffixText: 'irpm',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _pressaoArterialController,
                decoration: InputDecoration(
                  labelText: 'Pressão Arterial (ex: 120/80)',
                  border: OutlineInputBorder(),
                  suffixText: 'mmHg',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (!RegExp(r'^\d{2,3}\/\d{2,3}$').hasMatch(value)) {
                    return 'Formato inválido (use: __/__)';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _observacaoController,
                decoration: InputDecoration(
                  labelText: 'Observações',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
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
        ElevatedButton(
          onPressed: _salvar,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
          ),
          child: Text('Salvar'),
        ),
      ],
    );
  }

  Widget _buildTimeField() {
    return InkWell(
      onTap: () => _selectTime(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Horário',
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_horarioRegistro.hour.toString().padLeft(2, '0')}:${_horarioRegistro.minute.toString().padLeft(2, '0')}',
            ),
            Icon(Icons.access_time),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _horarioRegistro,
    );
    if (picked != null && picked != _horarioRegistro) {
      setState(() {
        _horarioRegistro = picked;
      });
    }
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final dataHoraRegistro = DateTime(
        _dataRegistro.year,
        _dataRegistro.month,
        _dataRegistro.day,
        _horarioRegistro.hour,
        _horarioRegistro.minute,
      );

      final sinaisVitais = SinaisVitaisModelo(
        id: widget.sinaisVitais?.id ?? const Uuid().v1(),
        idosoId: widget.idosoId,
        dataRegistro: dataHoraRegistro,
        temperatura: _temperaturaController.text,
        frequenciaCardiaca: _frequenciaCardiacaController.text,
        respiracao: _respiracaoController.text,
        pressaoArterial: _pressaoArterialController.text,
        observacao: _observacaoController.text,
      );

      Navigator.pop(context, sinaisVitais);
    }
  }

  @override
  void dispose() {
    _temperaturaController.dispose();
    _frequenciaCardiacaController.dispose();
    _respiracaoController.dispose();
    _pressaoArterialController.dispose();
    _observacaoController.dispose();
    super.dispose();
  }
} 