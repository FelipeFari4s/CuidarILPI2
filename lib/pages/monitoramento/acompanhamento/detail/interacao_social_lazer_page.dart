import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicossociais/interacao_social_lazer_modelo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cuidar_ilpi/_comum/modal_interacao_social_lazer.dart';

class InteracaoSocialLazerPage extends StatefulWidget {
  final IdosoModelo idoso;

  InteracaoSocialLazerPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _InteracaoSocialLazerPageState createState() => _InteracaoSocialLazerPageState();
}

class _InteracaoSocialLazerPageState extends State<InteracaoSocialLazerPage> {
  final IdosoService _idosoService = IdosoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Interação Social e Lazer',
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
          stream: _idosoService.getInteracaoSocialLazer(widget.idoso.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return _buildEmptyState();
            }

            final dados = snapshot.data!.data() as Map<String, dynamic>;
            final avaliacao = InteracaoSocialLazerModelo.fromMap(dados);

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(avaliacao),
                  SizedBox(height: 16),
                  _buildParticipacaoCard(avaliacao),
                  SizedBox(height: 16),
                  _buildVisitasCard(avaliacao),
                  SizedBox(height: 16),
                  _buildInteracoesCard(avaliacao),
                  SizedBox(height: 16),
                  _buildAtividadesCard(avaliacao),
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
          FaIcon(FontAwesomeIcons.peopleGroup,
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

  Widget _buildHeader(InteracaoSocialLazerModelo avaliacao) {
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

  Widget _buildParticipacaoCard(InteracaoSocialLazerModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.userGroup, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Participação em Atividades',
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
              'Participa de atividades em grupo',
              avaliacao.participaAtividadesGrupo,
              FontAwesomeIcons.peopleGroup,
            ),
            SizedBox(height: 8),
            _buildStatusChip(
              'Realiza passeios',
              avaliacao.realizaPasseios,
              FontAwesomeIcons.personWalking,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitasCard(InteracaoSocialLazerModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.handshake, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Visitas',
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
              'Recebe visitas',
              avaliacao.recebeVisita,
              FontAwesomeIcons.doorOpen,
            ),
            if (avaliacao.recebeVisita) ...[
              SizedBox(height: 8),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.userFriends,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Visitantes: ${avaliacao.visitantes}',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ],
            SizedBox(height: 8),
            _buildStatusChip(
              'Solicita visitas',
              avaliacao.solicitaVisita,
              FontAwesomeIcons.handHoldingHeart,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteracoesCard(InteracaoSocialLazerModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.userFriends, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Interações com Residentes',
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
              'Interage com outros residentes',
              avaliacao.interageResidentes,
              FontAwesomeIcons.handshakeAngle,
            ),
            SizedBox(height: 8),
            _buildStatusChip(
              'Agride residentes',
              avaliacao.agrideResidentes,
              FontAwesomeIcons.handFist,
            ),
            SizedBox(height: 8),
            _buildStatusChip(
              'Sofre agressão',
              avaliacao.sofreAgressao,
              FontAwesomeIcons.shieldHeart,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAtividadesCard(InteracaoSocialLazerModelo avaliacao) {
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
                FaIcon(FontAwesomeIcons.gamepad, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Atividades Preferidas',
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
              children: avaliacao.atividadesPreferidas.map((atividade) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.card3.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        _getAtividadeIcon(atividade),
                        size: 16,
                        color: AppColors.card3,
                      ),
                      SizedBox(width: 4),
                      Text(
                        atividade,
                        style: TextStyle(
                          color: AppColors.card3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            if (avaliacao.outrasAtividades.isNotEmpty) ...[
              SizedBox(height: 8),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.plus,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Outras: ${avaliacao.outrasAtividades}',
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

  IconData _getAtividadeIcon(String atividade) {
    switch (atividade) {
      case 'Jogos':
        return FontAwesomeIcons.chess;
      case 'Música':
        return FontAwesomeIcons.music;
      case 'Dança':
        return FontAwesomeIcons.personRunning;
      case 'Artesanato':
        return FontAwesomeIcons.paintBrush;
      case 'Leitura':
        return FontAwesomeIcons.book;
      case 'Ações Educativas':
        return FontAwesomeIcons.graduationCap;
      default:
        return FontAwesomeIcons.star;
    }
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }

  void _mostrarModalAvaliacao(BuildContext context, {InteracaoSocialLazerModelo? avaliacao}) {
    mostrarModalInteracaoSocialLazer(context, widget.idoso.id, avaliacao: avaliacao);
  }
} 
