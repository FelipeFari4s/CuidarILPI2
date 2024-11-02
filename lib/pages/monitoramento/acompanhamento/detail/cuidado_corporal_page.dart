import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/cuidado_corporal_modelo.dart';
import 'package:cuidar_ilpi/_comum/modal_cuidado_corporal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CuidadoCorporalPage extends StatefulWidget {
  final IdosoModelo idoso;

  CuidadoCorporalPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _CuidadoCorporalPageState createState() => _CuidadoCorporalPageState();
}

class _CuidadoCorporalPageState extends State<CuidadoCorporalPage> {
  final IdosoService _idosoService = IdosoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Cuidado Corporal',
            style: TextStyle(color: AppColors.textLight)),
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
        child: StreamBuilder<DocumentSnapshot>(
          stream: _idosoService.getCuidadoCorporal(widget.idoso.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return _buildEmptyState();
            }

            final dados = snapshot.data!.data() as Map<String, dynamic>;
            final avaliacao = CuidadoCorporalModelo.fromMap(dados);

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(avaliacao),
                  SizedBox(height: 16),
                  _buildHigieneCorporalCard(avaliacao),
                  SizedBox(height: 16),
                  _buildHigieneBucalCard(avaliacao),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.primary.withOpacity(0.1)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.shower, size: 80, color: AppColors.primary),
            SizedBox(height: 16),
            Text(
              'Nenhuma avaliação registrada',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _mostrarModalAvaliacao(context),
              icon: Icon(Icons.add),
              label: Text('Realizar Primeira Avaliação'),
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
      ),
    );
  }

  Widget _buildHeader(CuidadoCorporalModelo avaliacao) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Última Atualização',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  _formatarData(avaliacao.dataRegistro),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.edit, color: AppColors.primary),
              onPressed: () => _mostrarModalAvaliacao(context, avaliacao: avaliacao),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHigieneCorporalCard(CuidadoCorporalModelo avaliacao) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.bath, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Higiene Corporal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildStatusChip('Higiene do Corpo', avaliacao.higieneCorporal),
            SizedBox(height: 8),
            _buildAssistanceRow(
              'Auxílio para o banho',
              avaliacao.auxilioBanho,
              FontAwesomeIcons.handHoldingHeart,
            ),
            SizedBox(height: 8),
            _buildAssistanceRow(
              'Auxílio para trocar a roupa',
              avaliacao.auxilioVestimenta,
              FontAwesomeIcons.shirt,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHigieneBucalCard(CuidadoCorporalModelo avaliacao) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.tooth, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Higiene Bucal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildStatusChip('Condição', avaliacao.higieneBucal),
            SizedBox(height: 8),
            _buildAssistanceRow(
              'Auxílio para higiene bucal',
              avaliacao.auxilioHigieneBucal,
              FontAwesomeIcons.handHoldingMedical,
            ),
            SizedBox(height: 8),
            _buildAssistanceRow(
              'Problemas dentários',
              avaliacao.problemasDentarios,
              FontAwesomeIcons.teeth,
            ),
            SizedBox(height: 8),
            _buildAssistanceRow(
              'Gengivites',
              avaliacao.gengivites,
              FontAwesomeIcons.disease,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String label, String status) {
    final bool isSatisfatorio = status == 'Satisfatória';
    return Row(
      children: [
        FaIcon(
          isSatisfatorio ? FontAwesomeIcons.thumbsUp : FontAwesomeIcons.thumbsDown,
          size: 16,
          color: AppColors.primary,
        ),
        SizedBox(width: 8),
        Text('$label: ', style: TextStyle(fontSize: 16)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSatisfatorio ? Colors.green[100] : Colors.red[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: isSatisfatorio ? Colors.green[700] : Colors.red[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAssistanceRow(String label, bool value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              FaIcon(icon, size: 16, color: AppColors.primary),
              SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: value ? Colors.green[100] : Colors.red[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                value ? FontAwesomeIcons.check : FontAwesomeIcons.xmark,
                size: 14,
                color: value ? Colors.green[700] : Colors.red[700],
              ),
              SizedBox(width: 4),
              Text(
                value ? 'Sim' : 'Não',
                style: TextStyle(
                  color: value ? Colors.green[700] : Colors.red[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }

  void _mostrarModalAvaliacao(BuildContext context, {CuidadoCorporalModelo? avaliacao}) {
    mostrarModalCuidadoCorporal(context, widget.idoso.id, avaliacao: avaliacao);
  }
} 