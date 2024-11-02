import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/nutricao_modelo.dart';
import 'package:cuidar_ilpi/_comum/modal_nutricao.dart';

class NutricaoPage extends StatefulWidget {
  final IdosoModelo idoso;

  NutricaoPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _NutricaoPageState createState() => _NutricaoPageState();
}

class _NutricaoPageState extends State<NutricaoPage> {
  final IdosoService _idosoService = IdosoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Nutrição',
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
          stream: _idosoService.getNutricao(widget.idoso.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return _buildErrorState();
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return _buildEmptyState();
            }

            final dados = snapshot.data!.data() as Map<String, dynamic>;
            final avaliacao = NutricaoModelo.fromMap(dados);

            return SafeArea(
              child: _buildContent(avaliacao),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
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
            Icon(Icons.restaurant_outlined, 
                size: 80, color: AppColors.primary),
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

  Widget _buildContent(NutricaoModelo avaliacao) {
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
            _buildHeader(avaliacao),
            SizedBox(height: 24),
            _buildDadosAntropometricos(avaliacao),
            SizedBox(height: 16),
            _buildStatusCard('Aceitação Alimentar', avaliacao.aceitacaoAlimentar),
            SizedBox(height: 16),
            _buildDegluticaoCard(avaliacao),
            SizedBox(height: 16),
            _buildAlimentacaoCard(avaliacao),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(NutricaoModelo avaliacao) {
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
                  fontSize: 18,
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
    );
  }

  Widget _buildDadosAntropometricos(NutricaoModelo avaliacao) {
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
              Icon(Icons.straighten, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                'Dados Antropométricos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMedida('Altura', '${avaliacao.altura} cm'),
              _buildMedida('Peso', '${avaliacao.peso} kg'),
              _buildMedida('IMC', avaliacao.imc.toStringAsFixed(1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedida(String label, String valor) {
    IconData icon;
    switch (label) {
      case 'Altura':
        icon = Icons.height;
        break;
      case 'Peso':
        icon = Icons.monitor_weight_outlined;
        break;
      case 'IMC':
        icon = Icons.analytics_outlined;
        break;
      default:
        icon = Icons.info_outline;
    }

    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        SizedBox(height: 4),
        Text(
          valor,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildDegluticaoCard(NutricaoModelo avaliacao) {
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
          Text(
            'Deglutição',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _buildStatusChip('Disfagia', avaliacao.disfagia),
              SizedBox(width: 16),
              _buildStatusChip('Engasgo', avaliacao.engasgo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAlimentacaoCard(NutricaoModelo avaliacao) {
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
          Text(
            'Alimentação',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 16),
          _buildInfoRow('Via de administração', avaliacao.viaAdministracao),
          if (avaliacao.dispositivoAlimentacao.isNotEmpty)
            _buildInfoRow('Dispositivo', avaliacao.dispositivoAlimentacao.join(', ')),
          _buildInfoRow('Auxílio para alimentação', 
              avaliacao.auxilioAlimentacao ? 'Sim' : 'Não'),
          _buildInfoRow('Dieta enteral', 
              avaliacao.dietaEnteral ? 'Sim' : 'Não'),
          _buildInfoRow('Uso de prótese', 
              avaliacao.usoProtese ? 'Sim' : 'Não'),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, bool value) {
    return Chip(
      backgroundColor: value ? AppColors.primary.withOpacity(0.1) : Colors.grey[200],
      label: Text(
        label,
        style: TextStyle(
          color: value ? AppColors.primary : Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }

  void _mostrarModalAvaliacao(BuildContext context, {NutricaoModelo? avaliacao}) {
    mostrarModalNutricao(context, widget.idoso.id, avaliacao: avaliacao);
  }

  Widget _buildStatusCard(String title, String value) {
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
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
} 