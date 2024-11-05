import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicossociais/atencao_aceitacao_modelo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cuidar_ilpi/_comum/modal_atencao_aceitacao.dart';

class AtencaoAceitacaoPage extends StatefulWidget {
  final IdosoModelo idoso;

  AtencaoAceitacaoPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _AtencaoAceitacaoPageState createState() => _AtencaoAceitacaoPageState();
}

class _AtencaoAceitacaoPageState extends State<AtencaoAceitacaoPage> {
  final IdosoService _idosoService = IdosoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Atenção e Aceitação',
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
          stream: _idosoService.getAtencaoAceitacao(widget.idoso.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return _buildEmptyState();
            }

            final dados = snapshot.data!.data() as Map<String, dynamic>;
            final avaliacao = AtencaoAceitacaoModelo.fromMap(dados);

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(avaliacao),
                  SizedBox(height: 16),
                  _buildAtencaoCard(avaliacao),
                  SizedBox(height: 16),
                  _buildSentimentosCard(avaliacao),
                  SizedBox(height: 16),
                  _buildManifestacoesCard(avaliacao),
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
          FaIcon(FontAwesomeIcons.heartPulse,
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

  Widget _buildHeader(AtencaoAceitacaoModelo avaliacao) {
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

  Widget _buildAtencaoCard(AtencaoAceitacaoModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.handHoldingHeart, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Necessidades de Atenção',
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
              'Solicita atenção',
              avaliacao.solicitaAtencao,
              FontAwesomeIcons.bell,
            ),
            if (avaliacao.solicitaAtencao && avaliacao.comoSolicitaAtencao.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.comment,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Como: ${avaliacao.comoSolicitaAtencao}',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            _buildStatusChip(
              'Necessita de atenção',
              avaliacao.necessidadeAtencao,
              FontAwesomeIcons.userNurse,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSentimentosCard(AtencaoAceitacaoModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.faceMeh, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Sentimentos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: avaliacao.sentimentos.map((sentimento) => Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getSentimentoColor(sentimento),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      _getSentimentoIcon(sentimento),
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      sentimento,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManifestacoesCard(AtencaoAceitacaoModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.faceAngry, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Manifestações',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: avaliacao.manifestacoes.map((manifestacao) => Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      _getManifestacaoIcon(manifestacao),
                      size: 16,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      manifestacao,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
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

  Color _getSentimentoColor(String sentimento) {
    switch (sentimento) {
      case 'Tristeza':
        return Colors.blue;
      case 'Solidão':
        return Colors.purple;
      case 'Felicidade':
        return Colors.orange;
      default:
        return AppColors.primary;
    }
  }

  IconData _getSentimentoIcon(String sentimento) {
    switch (sentimento) {
      case 'Tristeza':
        return FontAwesomeIcons.faceSadTear;
      case 'Solidão':
        return FontAwesomeIcons.userXmark;
      case 'Felicidade':
        return FontAwesomeIcons.faceSmile;
      default:
        return FontAwesomeIcons.faceMeh;
    }
  }

  IconData _getManifestacaoIcon(String manifestacao) {
    switch (manifestacao) {
      case 'Choro':
        return FontAwesomeIcons.faceSadCry;
      case 'Deprimido':
        return FontAwesomeIcons.faceFrown;
      case 'Isolamento':
        return FontAwesomeIcons.personWalkingArrowLoopLeft;
      case 'Irritado':
        return FontAwesomeIcons.faceAngry;
      case 'Agressivo':
        return FontAwesomeIcons.handFist;
      case 'Inquieto':
        return FontAwesomeIcons.personRunning;
      case 'Pensamento negativo':
        return FontAwesomeIcons.cloudRain;
      default:
        return FontAwesomeIcons.question;
    }
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }

  void _mostrarModalAvaliacao(BuildContext context, {AtencaoAceitacaoModelo? avaliacao}) {
    // Implementar o modal de avaliação
    mostrarModalAtencaoAceitacao(context, widget.idoso.id, avaliacao: avaliacao);
  }
}