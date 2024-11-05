import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicoespirituais/espiritualidade_modelo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cuidar_ilpi/_comum/modal_espiritualidade.dart';

class EspiritualidadePage extends StatefulWidget {
  final IdosoModelo idoso;

  EspiritualidadePage({Key? key, required this.idoso}) : super(key: key);

  @override
  _EspiritualidadePageState createState() => _EspiritualidadePageState();
}

class _EspiritualidadePageState extends State<EspiritualidadePage> {
  final IdosoService _idosoService = IdosoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Espiritualidade',
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
          stream: _idosoService.getEspiritualidade(widget.idoso.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return _buildEmptyState();
            }

            final dados = snapshot.data!.data() as Map<String, dynamic>;
            final avaliacao = EspiritualidadeModelo.fromMap(dados);

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(avaliacao),
                  SizedBox(height: 16),
                  _buildReligiaoCard(avaliacao),
                  SizedBox(height: 16),
                  _buildPraticasCard(avaliacao),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.handsPraying,
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
    );
  }

  Widget _buildHeader(EspiritualidadeModelo avaliacao) {
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
                  'Última Avaliação',
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

  Widget _buildReligiaoCard(EspiritualidadeModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.church, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Religião',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildStatusChip(
              'Possui religião',
              avaliacao.possuiReligiao,
              FontAwesomeIcons.pray,
            ),
            if (avaliacao.possuiReligiao) ...[
              SizedBox(height: 8),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.cross,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Religião: ${avaliacao.qualReligiao}',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ],
            SizedBox(height: 8),
            _buildStatusChip(
              'Necessita participar de cerimônias',
              avaliacao.necessitaCerimonias,
              FontAwesomeIcons.personPraying,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPraticasCard(EspiritualidadeModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.spa, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Práticas Integrativas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildStatusChip(
              'Participa de práticas integrativas',
              avaliacao.participaPraticasIntegrativas,
              FontAwesomeIcons.handHoldingHeart,
            ),
            if (avaliacao.participaPraticasIntegrativas) ...[
              SizedBox(height: 8),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.leaf,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Práticas: ${avaliacao.quaisPraticas}',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String label, bool value, IconData icon) {
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
              Icon(
                value ? Icons.check : Icons.close,
                size: 16,
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

  void _mostrarModalAvaliacao(BuildContext context,
      {EspiritualidadeModelo? avaliacao}) {
    mostrarModalEspiritualidade(context, widget.idoso.id, avaliacao: avaliacao);
  }
} 