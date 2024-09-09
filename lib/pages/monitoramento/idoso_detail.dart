import 'package:cuidar_ilpi/pages/longinEsingUp_screen/widgets/custom_button.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicoespirituais.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicossociais.dart';
import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/ant_pessoais_screen.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/medicacao_screen.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/sinais_vitais.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologicas_screen.dart';

class HealthMonitoringDetailScreen extends StatefulWidget {
  final int id; // Identificador do idoso para passar as informações

  const HealthMonitoringDetailScreen({Key? key, required this.id})
      : super(key: key);

  @override
  _HealthMonitoringDetailScreenState createState() =>
      _HealthMonitoringDetailScreenState();
}

class _HealthMonitoringDetailScreenState
    extends State<HealthMonitoringDetailScreen> {
  // Dados fictícios para o exemplo
  final Map<String, String> elderlyData = {
    'Nome': 'João da Silva',
    'Data de Nascimento': '15/08/1945',
    'Idade': '78',
    'Sexo': 'M',
    'Religião': 'Católica',
    'Escolaridade': 'Ensino Médio Completo',
    'Ocupação Anterior': 'Professor',
    'Aposentado': 'Sim',
    'Data da Institucionalização': '01/01/2023',
    'Motivo da Institucionalização': 'Cuidados especiais',
    'Possui Familiares': 'Sim',
  };

  final Map<String, bool> comorbidades = {
    'Diabetes': false,
    'Hipertensão': false,
    'Depressão': false,
    'Hipotireoidismo': false,
    'Demência': false,
    'DPOC': false,
    'Doença Renal Crônica': false,
    'Insuficiência Cardíaca': false,
  };

  bool? internacaoHospitalar;
  bool? foiEtilista;
  bool? foiTabagista;

  final TextEditingController outrasController = TextEditingController();

  final List<Map<String, dynamic>> medicamentos = [];
  Map<String, dynamic>? selectedMedicamento;

  final List<Map<String, dynamic>> sinaisVitais = [];
  Map<String, dynamic>? selectedSinalVital;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoramento de Saúde'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Identificação da Pessoa Idosa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...elderlyData.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        '${entry.key}:',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(entry.value),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 20),

            // Botões para navegação, dispostos verticalmente

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "AntecedentesPessoais",
                           image: Image.asset(
                              "assets/icons/monitoramento/ant.png"),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AntecedentesPessoaisScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Expanded(
                        child: CustomButton(
                          text: "Medicações",
                          color: Colors.blue,
                          image: Image.asset(
                              "assets/icons/monitoramento/Medicações.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedicationScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "Sinais Vitais",
                          image: Image.asset(
                              "assets/icons/monitoramento/Sinais Vitais.png"),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VitalSignsScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Expanded(
                        child: CustomButton(
                          text: "Necessidades Psicobiológicas",
                          color: Colors.blue,
                          image: Image.asset(
                              "assets/icons/monitoramento/Psicicobiologicas.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NecessidadesPsicobiologicasScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "Necessidades Psicossociais",
                          image: Image.asset(
                              "assets/icons/monitoramento/Psicicosociais.png"),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PsicossociaisForm(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Expanded(
                        child: CustomButton(
                          text: "Necessidades Psicoespirituais",
                          color: Colors.blue,
                          image: Image.asset(
                              "assets/icons/monitoramento/Espiritual.png"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PsicoespirituaisForm(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
