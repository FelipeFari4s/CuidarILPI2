import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/atencao_aceitacao_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/comunicacao_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/interacao_social_lazer_page.dart';
class NecessidadesPsicossociaisPage extends StatelessWidget {
  final IdosoModelo idoso;

  NecessidadesPsicossociaisPage({Key? key, required this.idoso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Necessidades Psicossociais',
            style: TextStyle(color: AppColors.textLight)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(
              context,
              'Atenção e Aceitação',
              //'Analise a capacidade de atenção e aceitação',
              Icons.psychology,
              Colors.purple[600]!,
              'assets/images/atencao.png', // Adicione uma imagem ilustrativa
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AtencaoAceitacaoPage(idoso: idoso),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            _buildCard(
              context,
              'Comunicação',
              //'Analise a capacidade de expressão e compreensão',
              Icons.chat,
              Colors.blue[600]!,
              'assets/images/comunicacao.png', // Adicione uma imagem ilustrativa
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComunicacaoPage(idoso: idoso),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            _buildCard(
              context,
              'Interação Social e Lazer',
              //'Avalie participação em atividades e relacionamentos',
              Icons.groups,
              Colors.orange[600]!,
              'assets/images/social.png', // Adicione uma imagem ilustrativa
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InteracaoSocialLazerPage(idoso: idoso),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    //String subtitle,
    IconData icon,
    Color color,
    String imagePath,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 160,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.8),
                color,
              ],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: Colors.white, size: 40),
                    SizedBox(height: 12),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    /*Text(
                      //subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),*/
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 