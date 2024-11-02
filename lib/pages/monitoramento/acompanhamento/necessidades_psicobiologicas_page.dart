import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/regulacao_neurologica_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/nutricao_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/hidratacao_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/eliminacao_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/sensopercepcao_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/integridade_pele_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/sono_repouso_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/cuidado_corporal_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/locomocao_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/sexualidade_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/detail/seguranca_fisica_page.dart';

class NecessidadesPsicobiologicasPage extends StatelessWidget {
  final IdosoModelo idoso;

  NecessidadesPsicobiologicasPage({Key? key, required this.idoso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Necessidades Psicobiológicas',
            style: TextStyle(color: AppColors.textLight)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildButton(
              context,
              'Regulação\nNeurológica',
              Icons.psychology_alt,
              Colors.blue[700]!,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegulacaoNeurologicaPage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Nutrição',
              Icons.restaurant,
              Colors.green[600]!,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NutricaoPage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Hidratação',
              Icons.water_drop,
              Colors.lightBlue,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HidratacaoPage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Eliminação',
              Icons.recycling,
              Colors.brown,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EliminacaoPage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Sensopercepção',
              Icons.visibility,
              Colors.purple,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SensopercepcaoPage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Integridade\nda Pele',
              Icons.healing,
              Colors.pink[300]!,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IntegridadePelePage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Sono e\nRepouso',
              Icons.bedtime,
              Colors.indigo,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SonoRepousoPage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Cuidado\nCorporal',
              Icons.shower,
              Colors.teal,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CuidadoCorporalPage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Locomoção e\nAtividade Física',
              Icons.directions_walk,
              Colors.orange[700]!,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocomocaoPage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Sexualidade',
              Icons.favorite,
              Colors.red,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SexualidadePage(idoso: idoso),
                  ),
                );
              },
            ),
            _buildButton(
              context,
              'Segurança Física e\nMeio Ambiente',
              Icons.security,
              Colors.green[800]!,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SegurancaFisicaPage(idoso: idoso),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.8),
                color,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 