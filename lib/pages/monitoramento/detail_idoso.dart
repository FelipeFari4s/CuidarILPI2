import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/antecedentes_pessoais_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/medicacoes_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/acompanhamento/necessidades_psicobiologicas_page.dart';

class IdosoDetailPage extends StatelessWidget {
  final IdosoModelo idosoModelo;

  IdosoDetailPage({Key? key, required this.idosoModelo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(idosoModelo.nome,
            style: TextStyle(color: AppColors.textLight)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cabeçalho com informações principais
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Text(
                      idosoModelo.nome.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    idosoModelo.nome,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textLight,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${idosoModelo.idade} anos - ${idosoModelo.sexo}',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),

            // Informações pessoais em cards
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informações Pessoais',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildInfoCard([
                    _buildInfoItem(Icons.cake, 'Data de Nascimento',
                        idosoModelo.nascimento),
                    _buildInfoItem(
                        Icons.church, 'Religião', idosoModelo.religiao),
                    _buildInfoItem(
                        Icons.school, 'Escolaridade', idosoModelo.escolaridade),
                    _buildInfoItem(Icons.work, 'Ocupação Anterior',
                        idosoModelo.ocupacaoAnterior),
                    _buildInfoItem(Icons.attach_money, 'Aposentado',
                        idosoModelo.aposentado),
                    _buildInfoItem(
                        Icons.calendar_today,
                        'Data de Institucionalização',
                        idosoModelo.dataInstitucionalizacao),
                    _buildInfoItem(Icons.info_outline, 'Motivo',
                        idosoModelo.motivoInstitucionalizacao),
                    _buildInfoItem(Icons.family_restroom, 'Possui Familiares',
                        idosoModelo.possuiFamiliares),
                  ], color: AppColors.card1),

                  SizedBox(height: 24),
                  Text(
                    'Acompanhamento',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Grid de botões
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.5,
                    children: [
                      _buildNavigationButton(
                        context,
                        'ANTECEDENTES\nPESSOAIS',
                        Icons.history,
                        Colors.blue,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AntecedentesPessoaisPage(idoso: idosoModelo),
                            ),
                          );
                        },
                      ),
                      _buildNavigationButton(
                        context,
                        'MEDICAÇÕES',
                        Icons.medical_services,
                        Colors.green,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MedicacoesPage(idoso: idosoModelo),
                            ),
                          );
                        },
                      ),
                      _buildNavigationButton(
                        context,
                        'SINAIS\nVITAIS',
                        Icons.favorite,
                        Colors.red,
                        () {},
                      ),
                      _buildNavigationButton(
                        context,
                        'NECESSIDADES\nPSICOBIOLÓGICAS',
                        Icons.psychology,
                        Colors.purple,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NecessidadesPsicobiologicasPage(idoso: idosoModelo),
                            ),
                          );
                        },
                      ),
                      _buildNavigationButton(
                        context,
                        'NECESSIDADES\nPSICOSSOCIAIS',
                        Icons.people,
                        Colors.orange,
                        () {},
                      ),
                      _buildNavigationButton(
                        context,
                        'NECESSIDADES\nPSICOESPIRITUAIS',
                        Icons.self_improvement,
                        Colors.teal,
                        () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children, {Color color = Colors.white}) {
    return Card(
      elevation: 4,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: children
              .map((child) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: child,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textDark, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 14,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(
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
