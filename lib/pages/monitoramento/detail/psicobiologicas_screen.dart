import 'package:flutter/material.dart';

// Importar as telas que você já criou para cada categoria
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/nutricao.dart'; 
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/regulacao_neurologica.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/hidratacao.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/cuidado_corpora.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/eliminacao.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/integridade_pele.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/LocomocaoAtividadeMotilidade.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/seguranca.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/sensopercepcao.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/sexualidade.dart';
import 'package:cuidar_ilpi/pages/monitoramento/detail/psicobiologias_detail/sono_repouso.dart';

class NecessidadesPsicobiologicasScreen extends StatefulWidget {
  @override
  _NecessidadesPsicobiologicasScreenState createState() => _NecessidadesPsicobiologicasScreenState();
}

class _NecessidadesPsicobiologicasScreenState extends State<NecessidadesPsicobiologicasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Necessidades Psicobiológicas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal, // Cor de fundo da AppBar
        elevation: 0, // Remove sombra da AppBar
        centerTitle: true, // Centraliza o título
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(  // Adicionado para rolagem
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Column(  // Substituído por Column para incluir todos os botões
                children: [
                  courseButton(
                    context,
                    "Regulação Neurológica",
                    "assets/images/monitoramento/Regulacao_Neurologica.png",
                    RegulacaoNeuroForm(),
                  ),
                  courseButton(
                    context,
                    "Nutrição",
                    "assets/images/monitoramento/Nutricao.png",
                    NutricaoForm(),
                  ),
                  courseButton(
                    context,
                    "Hidratação",
                    "assets/images/monitoramento/Regulacao_Neurologica.png",
                    HidratacaoForm(),
                  ),
                  courseButton(
                    context,
                    "Eliminação",
                    "assets/images/monitoramento/Eliminacao.png",
                    EliminacaoForm(),
                  ),
                  courseButton(
                    context,
                    "Sensopercepção (visual, auditiva, tátil e dolorosa)",
                    "assets/images/monitoramento/Sensopercepcao.png",
                    SensopercepcaoForm(),
                  ),
                  courseButton(
                    context,
                    "Integridade da Pele",
                    "assets/images/monitoramento/Integridade_da_pele_.png",
                    IntegridadePeleForm(),
                  ),
                  courseButton(
                    context,
                    "Sono e Repouso",
                    "assets/images/monitoramento/Sono_e_Repouso.png",
                    SonoRepousoForm(),
                  ),
                  courseButton(
                    context,
                    "Cuidado Corporal",
                    "assets/images/monitoramento/Cuidado_Corporal.png",
                    CuidadoCorporalForm(),
                  ),
                  courseButton(
                    context,
                    "Locomoção, Atividade Física e Motilidade",
                    "assets/images/monitoramento/Locomocao_Atividade_Fisica_e_Motilidade.png",
                    LocomocaoAtividadeMotilidadeForm(),
                  ),
                  courseButton(
                    context,
                    "Sexualidade",
                    "assets/images/monitoramento/Sexualidade.png",
                    SexualidadeForm(),
                  ),
                  courseButton(
                    context,
                    "Seguranca Fisica e Meio Ambiente",
                    "assets/images/monitoramento/Seguranca_fisica_e_Meio_Ambiente.png",
                    SegurancaFisicaMeioAmbienteForm(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector courseButton(BuildContext context, String title, String imagePath, Widget targetScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2, // Limita o texto a 2 linhas
                overflow: TextOverflow.ellipsis, // Adiciona reticências se o texto for muito longo
              ),
            ),
          ],
        ),
      ),
    );
  }
}
