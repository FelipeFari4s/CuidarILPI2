import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/_comum/modal_antecedentes_pessoais.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/antecedentes_pessoais_modelo.dart';

class AntecedentesPessoaisPage extends StatefulWidget {
  final IdosoModelo idoso;

  AntecedentesPessoaisPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _AntecedentesPessoaisPageState createState() =>
      _AntecedentesPessoaisPageState();
}

class _AntecedentesPessoaisPageState extends State<AntecedentesPessoaisPage> {
  final IdosoService _idosoService = IdosoService();
  AntecedentesPessoaisModelo? antecedente;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Antecedentes Pessoais',
            style: TextStyle(color: AppColors.textLight)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _idosoService.conectarStreamAntecedentesPessoais(widget.idoso.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return _buildErrorState();
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildEmptyState();
          }

          var antecedenteData = snapshot.data!.docs.first.data() as Map<String, dynamic>;
          antecedente = AntecedentesPessoaisModelo.fromMap(antecedenteData);

          return _buildContent(antecedente!);
        },
      ),
    );
  }

  Widget _buildErrorState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.red),
          SizedBox(height: 16),
          Text(
            'Erro ao carregar dados',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
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
            Icon(Icons.history_edu_outlined, 
                size: 80, color: AppColors.primary),
            SizedBox(height: 16),
            Text(
              'Nenhum antecedente registrado',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => mostrarModalAntecedentesPessoais(
                context, 
                widget.idoso.id,
              ),
              icon: Icon(Icons.add),
              label: Text('Registrar Antecedentes'),
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

  Widget _buildContent(AntecedentesPessoaisModelo antecedente) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.primary.withOpacity(0.1)],
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 24),
            _buildComorbidadesCard(antecedente),
            SizedBox(height: 16),
            if (antecedente.outrasComorbidades.isNotEmpty)
              _buildOutrasComorbidadesCard(antecedente),
            SizedBox(height: 16),
            _buildHistoricoCard(antecedente),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Antecedentes Pessoais',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Informações de saúde',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.edit, color: AppColors.primary),
            onPressed: () => mostrarModalAntecedentesPessoais(
              context, 
              widget.idoso.id,
              antecedentes: antecedente,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComorbidadesCard(AntecedentesPessoaisModelo antecedente) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.medical_information, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                'Comorbidades',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          Divider(height: 24),
          ...antecedente.comorbidades.entries
              .map((entry) => Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: entry.value 
                          ? AppColors.primary.withOpacity(0.1)
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            entry.key,
                            style: TextStyle(
                              fontSize: 16,
                              color: entry.value 
                                  ? AppColors.primary
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                        Icon(
                          entry.value
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: entry.value
                              ? AppColors.primary
                              : Colors.grey,
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildOutrasComorbidadesCard(AntecedentesPessoaisModelo antecedente) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.note_add, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                'Outras Comorbidades',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              antecedente.outrasComorbidades,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoricoCard(AntecedentesPessoaisModelo antecedente) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.history, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                'Histórico',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          Divider(height: 24),
          _buildHistoricoItem(
            'Internação nos últimos 6 meses',
            antecedente.internacaoUltimosSeisMeses,
            Icons.local_hospital,
          ),
          SizedBox(height: 8),
          _buildHistoricoItem(
            'Histórico de Etilismo',
            antecedente.etilista,
            Icons.local_bar,
          ),
          SizedBox(height: 8),
          _buildHistoricoItem(
            'Histórico de Tabagismo',
            antecedente.tabagista,
            Icons.smoking_rooms,
          ),
        ],
      ),
    );
  }

  Widget _buildHistoricoItem(String title, bool value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: value ? AppColors.primary.withOpacity(0.1) : Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: value ? AppColors.primary : Colors.grey,
            size: 20,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: value ? AppColors.primary : Colors.grey[600],
              ),
            ),
          ),
          Icon(
            value ? Icons.check_circle : Icons.circle_outlined,
            color: value ? AppColors.primary : Colors.grey,
          ),
        ],
      ),
    );
  }
}
