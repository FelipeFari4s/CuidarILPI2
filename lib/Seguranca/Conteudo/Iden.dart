import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class IdenScreen extends StatelessWidget {
  const IdenScreen({Key? key}) : super(key: key);

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
                  fontWeight: FontWeight.w500, // Roboto Medium
                  color: Color(0xFF7C6439), // Cor cinza escuro
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
                "Identificação",
                style: TextStyle(
                  fontSize: 24, // Tamanho do título grande
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
                      "A IMPORTÂNCIA DA IDENTIFICAÇÃO CORRETA DA PESSOA IDOSA EM INSTITUIÇÕES DE LONGA PERMANÊNCIA PARA IDOSOS (ILPIs)",
                  subtitle: "",
                  content: _buildIdentificacaoContent(),
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Color(0xFF7C6439),
          ),
        ),
        children: [content],
      ),
    );
  }

  Widget _buildIdentificacaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "A identificação correta é um processo essencial para associar adequadamente a pessoa idosa às intervenções esperadas e garantir que informações sobre sua identidade sejam comunicadas de maneira precisa e confiável ao longo de todo o cuidado. Isso é crucial para evitar erros e danos durante a prestação de serviços nas Instituições de Longa Permanência para Idosos (ILPIs)."),
          const SizedBox(height: 8),
          const Text(
              "Garantir a identificação correta dos residentes é fundamental para oferecer um cuidado seguro, humanizado e eficaz nas ILPIs, promovendo uma melhor qualidade de vida e segurança para as pessoas idosas."),
          const SizedBox(height: 10),
          const Text(
            "Por que a identificação correta é essencial?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "A correta identificação de um residente em uma ILPI é fundamental em todas as etapas do atendimento, como:"),
          const SizedBox(height: 8),
          const Text("⦁ Prescrição e administração de medicamentos;"),
          const Text("⦁ Acompanhamento da alimentação e dietas específicas;"),
          const Text("⦁ Realização de exames;"),
          const Text(
              "⦁ Participação em atividades dentro e fora da instituição."),
          const SizedBox(height: 10),
          const Text(
              "A responsabilidade pela confirmação da identidade é de todos os profissionais envolvidos direta ou indiretamente no cuidado. Erros na identificação podem levar a graves consequências, como:"),
          const SizedBox(height: 8),
          const Text("⦁ Intervenções erradas;"),
          const Text("⦁ Danos graves à saúde da pessoa idosa;"),
          const Text(
              "⦁ Aumento de custos em saúde e demandas por cuidados adicionais;"),
          const Text("⦁ Em casos extremos, pode até resultar em morte."),
          Image.asset("assets/images/seguranca/Foto_um_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 15),
          const Text(
            "Principais fatores que contribuem para erros de identificação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "Alguns fatores comuns que podem levar à identificação incorreta das pessoas idosas nas ILPIs incluem:"),
          const SizedBox(height: 10),
          const Text("⦁ Identificação incompleta do residente;"),
          const Text("⦁ Falta de padronização nos processos de identificação;"),
          const Text(
              "⦁ Semelhanças em nomes, datas de nascimento ou nomes das mães;"),
          const Text("⦁ Duplicidade de prontuários;"),
          const Text("⦁ Confirmação baseada apenas em informações verbais."),
          Image.asset("assets/images/seguranca/Foto_dois_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Estratégias para garantir a identificação correta das pessoas idosas nas ILPIs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "Para minimizar o risco de erros, as ILPIs podem adotar as seguintes estratégias:"),
          const SizedBox(height: 10),
          const Text(
              "⦁ Elaboração de protocolos claros para a identificação correta dos residentes;"),
          const Text("⦁ Verificação regular dos documentos de identificação;"),
          const Text("⦁ Atualização constante de fotos nos prontuários;"),
          const Text(
              "⦁ Uso de tecnologias como reconhecimento facial e biometria, especialmente para residentes com comprometimento cognitivo;"),
          const Text(
              "⦁ Inclusão da própria pessoa idosa no processo de identificação, sempre que possível, para promover sua autonomia."),
          Image.asset("assets/images/seguranca/Foto_tres_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Identificadores aceitáveis nas ILPIs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "É recomendado o uso de dois identificadores ao realizar qualquer atendimento. Eles podem ser classificados como tecnológicos e não tecnológicos, divididos entre aceitáveis e não aceitáveis."),
          const SizedBox(height: 8),
          const Text(" - Identificadores Não Tecnológicos:"),
          const SizedBox(height: 10),
          const Text("⦁ Nome completo da pessoa idosa;"),
          const Text("⦁ Data de nascimento;"),
          const Text("⦁ Nome completo da mãe;"),
          const Text("⦁ Foto atualizada no prontuário;"),
          const Text(
              "⦁ Diagnóstico clínico e intervenção nutricional individualizada."),
          const SizedBox(height: 10),
          const Text(" - Identificadores Tecnológicos:"),
          const SizedBox(height: 10),
          const Text("⦁ Reconhecimento facial;"),
          const Text("⦁ Biometria;"),
          const Text("⦁ Prontuário eletrônico."),
          Image.asset("assets/images/seguranca/Foto_quatro_segun.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }
}
