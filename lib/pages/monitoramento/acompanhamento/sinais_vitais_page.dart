import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/models/sinais_vitais_modelo.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:cuidar_ilpi/_comum/dialog_sinais_vitais.dart';

class SinaisVitaisPage extends StatefulWidget {
  final IdosoModelo idoso;

  SinaisVitaisPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _SinaisVitaisPageState createState() => _SinaisVitaisPageState();
}

class _SinaisVitaisPageState extends State<SinaisVitaisPage> {
  final IdosoService _idosoService = IdosoService();
  final ScrollController _horizontalScrollController = ScrollController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Sinais Vitais', style: TextStyle(color: AppColors.textLight)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, AppColors.primary.withOpacity(0.1)],
          ),
        ),
        child: Column(
          children: [
            _buildDateSelector(),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _idosoService.getSinaisVitais(widget.idoso.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return _buildEmptyState();
                  }

                  List<SinaisVitaisModelo> sinaisVitais = snapshot.data!.docs
                      .map((doc) => SinaisVitaisModelo.fromMap(
                          doc.data() as Map<String, dynamic>))
                      .where((sv) =>
                          sv.dataRegistro.year == _selectedDate.year &&
                          sv.dataRegistro.month == _selectedDate.month &&
                          sv.dataRegistro.day == _selectedDate.day)
                      .toList();

                  if (sinaisVitais.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.monitor_heart_outlined,
                              size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Nenhum registro para ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: _horizontalScrollController,
                              child: DataTable(
                                columnSpacing: 20,
                                headingRowColor: MaterialStateProperty.all(
                                    AppColors.primary.withOpacity(0.1)),
                                columns: [
                                  DataColumn(
                                    label: Text('Horário',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Temperatura (ºC)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Freq. Cardíaca (bpm)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Respiração (irpm)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Pressão Arterial (mmHg)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  DataColumn(
                                    label: Text('Ações',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                                rows: sinaisVitais.map((sv) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(DateFormat('HH:mm').format(
                                          sv.dataRegistro))),
                                      DataCell(Text(sv.temperatura)),
                                      DataCell(Text(sv.frequenciaCardiaca)),
                                      DataCell(Text(sv.respiracao)),
                                      DataCell(Text(sv.pressaoArterial)),
                                      DataCell(
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.edit,
                                                  color: AppColors.primary),
                                              onPressed: () =>
                                                  _showSinaisVitaisDialog(
                                                      sinaisVitais: sv),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.delete,
                                                  color: Colors.red),
                                              onPressed: () =>
                                                  _confirmarExclusao(sv),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        if (sinaisVitais.isNotEmpty) ...[
                          SizedBox(height: 16),
                          _buildObservacoes(sinaisVitais),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSinaisVitaisDialog(),
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.monitor_heart_outlined,
              size: 80, color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            'Nenhum registro de sinais vitais',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showSinaisVitaisDialog(),
            icon: Icon(Icons.add),
            label: Text('Novo Registro'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                _selectedDate = _selectedDate.subtract(Duration(days: 1));
              });
            },
          ),
          InkWell(
            onTap: () => _selectDate(context),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primary),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_today,
                      color: AppColors.primary, size: 20),
                  SizedBox(width: 8),
                  Text(
                    DateFormat('dd/MM/yyyy').format(_selectedDate),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              setState(() {
                _selectedDate = _selectedDate.add(Duration(days: 1));
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildObservacoes(List<SinaisVitaisModelo> sinaisVitais) {
    final observacoes = sinaisVitais
        .where((sv) => sv.observacao.isNotEmpty)
        .map((sv) => {
              'horario': DateFormat('HH:mm').format(sv.dataRegistro),
              'observacao': sv.observacao
            })
        .toList();

    if (observacoes.isEmpty) return SizedBox();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Observações do Dia',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16),
            ...observacoes.map((obs) => Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${obs['horario']}:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(obs['observacao']!),
                      Divider(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _confirmarExclusao(SinaisVitaisModelo sinaisVitais) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar Exclusão'),
        content: Text('Deseja realmente excluir este registro?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Excluir'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
    );

    if (confirmar == true) {
      await _idosoService.deletarSinaisVitais(
          widget.idoso.id, sinaisVitais.id);
    }
  }

  Future<void> _showSinaisVitaisDialog({SinaisVitaisModelo? sinaisVitais}) async {
    final resultado = await showDialog<SinaisVitaisModelo>(
      context: context,
      builder: (context) => DialogSinaisVitais(
        idosoId: widget.idoso.id,
        sinaisVitais: sinaisVitais,
      ),
    );

    if (resultado != null) {
      await _idosoService.salvarSinaisVitais(widget.idoso.id, resultado);
    }
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }
} 