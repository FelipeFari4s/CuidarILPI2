import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class ComunScreen extends StatelessWidget {
  const ComunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User currentUser = FirebaseAuth.instance.currentUser!;
    
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E1),
      endDrawer: AppDrawer(user: currentUser),
      body: Column(
        children: [
          CustomAppBar(user: currentUser),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Segurança do Cuidado à Pessoa Idosa",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7C6439),
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF7C6439),
              thickness: 1,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Comunicação Efetiva",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF7C6439),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildExpansionTile(
                  title:
                      "COMUNICAÇÃO EFETIVA NAS INSTITUIÇÕES DE LONGA PERMANÊNCIA PARA IDOSOS (ILPIs)",
                  subtitle: "",
                  content: _buildComunicacaoEstrategiasContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Image.asset(
              "assets/images/orientacoes/logo_orientacoes_.png",
              height: 50,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF707070)),
              onPressed: () {
                print("Menu aberto!");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required String subtitle,
    required Widget content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Color(0xFF7C6439),
          ),
        ),
        children: [content],
      ),
    );
  }

  Widget _buildComunicacaoEstrategiasContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "A comunicação efetiva é uma das metas do Programa Nacional de Segurança do Paciente, do Ministério da Saúde, e é fundamental para a qualidade da assistência e a segurança dos residentes em Instituições de Longa Permanência para Idosos (ILPIs). A comunicação é considerada efetiva quando as informações são compartilhadas de forma precisa, completa, registrada e revisada entre os profissionais sempre que necessário, garantindo a exatidão dos dados. "),
          const SizedBox(height: 10),
          const Text(
            "Importância da comunicação efetiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "A comunicação efetiva é essencial para a segurança e o bem-estar das pessoas idosas em ILPIs. O uso de estratégias adequadas pode reduzir incidentes, promover um ambiente mais seguro e melhorar a qualidade do cuidado. Além disso, um diálogo respeitoso e claro fortalece a confiança entre profissionais e residentes, garantindo uma assistência humanizada. "),
          Image.asset("assets/images/seguranca/Foto_vintequatro_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 15),
          const Text(
            "Impacto da comunicação nas ILPIs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "Nas ILPIs, a comunicação efetiva entre os profissionais que atuam no cuidado direto ou indireto é essencial para garantir a segurança do residente. Quando há falhas na comunicação, surgem sérios problemas à saúde das pessoas idosas, principalmente devido à sua maior vulnerabilidade. A comunicação clara e precisa reduz erros e incidentes no ambiente da ILPIs. "),
          Image.asset("assets/images/seguranca/Foto_vintecinco_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 15),
          const Text(
            "Causas das falhas na comunicação:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Algumas causas comuns de falhas na comunicação nas ILPIs incluem:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Ausência de protocolos de comunicação padronizados.\n"
            "• Falta de educação permanente entre os profissionais.\n"
            "• Desconhecimento da importância da comunicação efetiva como fator de qualidade da assistência.\n"
            "• Limitações físicas, psíquicas e cognitivas das pessoas idosas, dificultando o diálogo.\n"
            "• Diversidade cultural e experiências de vida variadas entre as pessoas idosas e os profissionais.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Consequências das falhas de comunicação:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Falhas na comunicação podem resultar em eventos adversos, como:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Administração incorreta de medicamentos.\n"
            "• Quedas ou acidentes com os residentes.\n"
            "• Acidentes com equipamentos médicos.\n"
            "• Surgimento de infecções.\n\n"
            "A maioria desses eventos adversos é evitável com a adoção de medidas como a comunicação efetiva, o que leva a melhorias na assistência prestada às pessoas idosas.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Prevenção das falhas de comunicação:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Para prevenir falhas na comunicação, é necessário:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Implementar protocolos que reduzam os incidentes e erros.\n"
            "• Promover treinamento contínuo da equipe multiprofissional.\n"
            "• Sensibilizar os profissionais quanto à importância de uma comunicação clara, seja ela verbal ou não verbal.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Estratégias para manter uma comunicação efetiva com pessoas idosas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Para garantir uma boa comunicação com as pessoas idosas, as seguintes estratégias são recomendadas:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Elimine ruídos do ambiente que possam prejudicar a audição da pessoa idosa.\n\n"
            "• Converse de forma adulta, evitando infantilizar a pessoa idosa.\n\n"
            "• Seja paciente e evite demonstrar frustração.\n\n"
            "• Fale devagar, ao invés de aumentar o volume.\n\n"
            "• Use palavras positivas e frases curtas e objetivas, facilitando a compreensão.\n\n"
            "• Faça uma pergunta por vez, evitando questionamentos em sequência.\n\n"
            "• Repita a mensagem de forma simplificada quando necessário.\n\n"
            "• Nunca apresse a pessoa idosa para responder ou complete suas frases.\n\n"
            "• Evite questões abertas; prefira perguntas de resposta 'sim' ou 'não'.\n\n"
            "• Mantenha contato visual.\n\n"
            "• Evite conflitos e discussões.\n\n"
            "• Quando solicitar que a pessoa idosa realize uma tarefa, dê instruções claras e simples.\n\n"
            "• Utilize a comunicação escrita se a pessoa idosa puder compreendê-la.\n\n"
            "• Se possível, segure as mãos da pessoa idosa para transmitir calma.\n\n"
            "• Lembre-se que toques físicos, como um aperto de mão ou abraço, podem ser formas de comunicação afetiva, sendo necessários para um atendimento mais humanizado.",
          ),
          const SizedBox(height: 5),
          Image.asset("assets/images/seguranca/Foto_vinteseis_segun.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }
}
