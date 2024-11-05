import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/models/medicacao_modelo.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/_comum/dialog_medicacao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicacoesPage extends StatefulWidget {
  final IdosoModelo idoso;

  MedicacoesPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _MedicacoesPageState createState() => _MedicacoesPageState();
}

class _MedicacoesPageState extends State<MedicacoesPage> {
  final IdosoService _idosoService = IdosoService();
  final ScrollController _horizontalScrollController = ScrollController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Medicações', style: TextStyle(color: AppColors.textLight)),
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
                stream: _idosoService.getMedicacoes(widget.idoso.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return _buildEmptyState();
                  }

                  List<MedicacaoModelo> medicacoes = snapshot.data!.docs
                      .map((doc) =>
                          MedicacaoModelo.fromMap(doc.data() as Map<String, dynamic>))
                      .toList();

                  medicacoes = _filtrarMedicacoesPorData(medicacoes);

                  if (medicacoes.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.medication_outlined, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Nenhuma medicação registrada para ${_formatarData(_selectedDate)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(),
                            SizedBox(height: 16),
                            constraints.maxWidth < 800
                                ? _buildMedicacoesCardList(medicacoes)
                                : _buildMedicacoesTable(medicacoes),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMedicacaoDialog(),
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
          FaIcon(FontAwesomeIcons.pills,
              size: 80, color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            'Nenhuma medicação cadastrada',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showMedicacaoDialog(),
            icon: Icon(Icons.add),
            label: Text('Cadastrar Medicação'),
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

  Widget _buildHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            FaIcon(FontAwesomeIcons.pills, color: AppColors.primary),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medicações do dia',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  _formatarData(_selectedDate),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicacoesCardList(List<MedicacaoModelo> medicacoes) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: medicacoes.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        final medicacao = medicacoes[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        medicacao.nome,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: AppColors.primary),
                          onPressed: () => _showMedicacaoDialog(medicacao: medicacao),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _confirmarExclusao(medicacao),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoContainer(
                        icon: Icons.medication,
                        label: 'Dose',
                        value: medicacao.dose,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildInfoContainer(
                        icon: Icons.route,
                        label: 'Via',
                        value: medicacao.via,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                _buildInfoContainer(
                  icon: Icons.access_time,
                  label: 'Horários',
                  value: medicacao.horarios.join(', '),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: medicacao.checagem ? Colors.green[50] : Colors.orange[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: medicacao.checagem ? Colors.green : Colors.orange,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              medicacao.checagem ? Icons.check_circle : Icons.pending,
                              color: medicacao.checagem ? Colors.green : Colors.orange,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              medicacao.checagem ? 'Medicação Administrada' : 'Pendente',
                              style: TextStyle(
                                color: medicacao.checagem ? Colors.green[700] : Colors.orange[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (medicacao.observacao.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.note_outlined, 
                                size: 18, 
                                color: AppColors.primary),
                            SizedBox(width: 8),
                            Text(
                              'Observações',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          medicacao.observacao,
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoContainer({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildMedicacoesTable(List<MedicacaoModelo> medicacoes) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Scrollbar(
        controller: _horizontalScrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _horizontalScrollController,
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 20,
            horizontalMargin: 16,
            columns: [
              DataColumn(
                label: Text('Medicação',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Dose', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Via', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Horários',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Status',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Observação',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Ações', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
            rows: medicacoes.map((medicacao) {
              return DataRow(
                cells: [
                  DataCell(Container(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: Text(medicacao.nome, overflow: TextOverflow.ellipsis),
                  )),
                  DataCell(Text(medicacao.dose)),
                  DataCell(Text(medicacao.via)),
                  DataCell(Container(
                    constraints: BoxConstraints(maxWidth: 120),
                    child: Text(medicacao.horarios.join(', '),
                        overflow: TextOverflow.ellipsis),
                  )),
                  DataCell(
                    Chip(
                      label: Text(
                        medicacao.checagem ? 'Administrado' : 'Pendente',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: medicacao.checagem ? Colors.green : Colors.orange,
                    ),
                  ),
                  DataCell(Text(medicacao.observacao)),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: AppColors.primary),
                          onPressed: () => _showMedicacaoDialog(medicacao: medicacao),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _confirmarExclusao(medicacao),
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
    );
  }

  Future<void> _showMedicacaoDialog({MedicacaoModelo? medicacao}) async {
    final result = await showDialog<MedicacaoModelo>(
      context: context,
      builder: (context) => DialogMedicacao(
        idosoId: widget.idoso.id,
        medicacao: medicacao,
      ),
    );

    if (result != null) {
      await _idosoService.salvarMedicacao(widget.idoso.id, result);
    }
  }

  Future<void> _confirmarExclusao(MedicacaoModelo medicacao) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar Exclusão'),
        content: Text('Deseja realmente excluir esta medicação?'),
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
      await _idosoService.deletarMedicacao(widget.idoso.id, medicacao.id);
    }
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }

  List<MedicacaoModelo> _filtrarMedicacoesPorData(List<MedicacaoModelo> medicacoes) {
    return medicacoes.where((medicacao) {
      return medicacao.dataRegistro.year == _selectedDate.year &&
             medicacao.dataRegistro.month == _selectedDate.month &&
             medicacao.dataRegistro.day == _selectedDate.day;
    }).toList();
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
                  Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
                  SizedBox(width: 8),
                  Text(
                    _formatarData(_selectedDate),
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

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }
}
