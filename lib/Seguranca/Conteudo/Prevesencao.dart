import 'package:flutter/material.dart';

class PrevensaoScreen extends StatelessWidget {
  const PrevensaoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E1),
      body: Column(
        children: [
          _buildAppBar(), // AppBar personalizada
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
                "Prevenção e controle de infecção",
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
                      "PRINCIPAIS INFECÇÕES EM INSTITUIÇÕES DE LONGA PERMANÊNCIA PARA IDOSOS (ILPIs) E OS FATORES DE RISCO",
                  subtitle: "",
                  content: _buildInfeccoesContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title:
                      "MANIFESTAÇÕES CLÍNICAS, PREVENÇÃO E CONTROLE DE INFECÇÕES EM PESSOAS IDOSAS INSTITUCIONALIZADAS",
                  subtitle: "",
                  content: _buildInfeccoesDetalhadasContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title:
                      "HIGIENIZAÇÃO DAS MÃOS: UMA PRÁTICA ESSENCIAL NAS ILPIS",
                  subtitle: "Detalhes sobre avaliação nutricional.",
                  content: _buildHigienizacaoContent(),
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

  Widget _buildInfeccoesContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "As infecções em Instituições de Longa Permanência para Idosos (ILPIs) representam uma grande preocupação, sendo responsáveis por cerca de 1/3 das mortes em pessoas idosas. Além disso, contribuem para o agravamento de outras condições de saúde. Em um período de um mês, cerca de 10% dos residentes em ILPIs podem desenvolver alguma infecção."),
          const SizedBox(height: 10),
          const Text(
            "As infecções mais comuns entre as pessoas idosas residentes são:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("⦁ Infecção do trato urinário (ITU);"),
          const Text("⦁ Pneumonia;"),
          const Text("⦁ Gastroenterite;"),
          const Text("⦁ Infecções de pele e partes moles."),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_cinco_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Fatores que aumentam o risco de infecção nas ILPIs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(" Fatores relacionados às pessoas idosas:"),
          const Text("o Idade avançada;"),
          const Text("o Desnutrição;"),
          const Text(
              "o Doenças crônicas que causam distúrbios cognitivos ou incapacidades funcionais;"),
          const Text("o Polifarmácia (uso de múltiplos medicamentos);"),
          const Text("o Incontinência urinária ou fecal;"),
          const Text(
              "o Dispositivos invasivos (como cateteres urinários ou sondas nasogástricas)."),
          const SizedBox(height: 10),
          const Text(" Fatores relacionados ao ambiente institucional:"),
          const Text("o Contato próximo entre residentes e profissionais;"),
          const Text("o Instalações com pouca ventilação;"),
          const Text("o Limpeza inadequada de alimentos, objetos e ambientes."),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildInfeccoesDetalhadasContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "As infecções em pessoas idosas muitas vezes se manifestam de maneira atípica, com sintomas que diferem dos padrões comuns. Alguns sinais de alerta incluem:"),
          const Text("⦁ Alterações na função cognitiva;"),
          const Text(
              "⦁ Declínio na capacidade funcional e nas condições físicas;"),
          const Text(
              "⦁ Descompensação de doenças crônicas, como diabetes ou insuficiência cardíaca;"),
          const Text("⦁ Aumento da confusão mental;"),
          const Text("⦁ Aparecimento de incontinência urinária;"),
          const Text("⦁ Quedas;"),
          const Text("⦁ Piora da mobilidade e do equilíbrio;"),
          const Text(
              "⦁ Falta de cooperação com a reabilitação ou tratamentos."),
          const SizedBox(height: 10),
          const Text(
            "Temperatura corporal e infecção",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Em pessoas idosas, a febre pode não se manifestar da forma usual. É importante medir a temperatura basal na admissão ou em momentos de estabilidade clínica, pois a febre em pessoas idosas frágeis pode ser diagnosticada com um aumento de apenas 1,1°C em relação à sua temperatura basal. Por exemplo, se a temperatura basal for 35°C, uma elevação para 36,1°C já pode indicar febre."),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_seis_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Prevenção e controle de infecções nas ILPIs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Prevenir e controlar infecções nas ILPIs é fundamental para garantir uma melhor assistência às pessoas idosas residentes. Esse processo deve envolver:"),
          const Text(
              "⦁ Profissionais de saúde, especialmente aqueles que prestam cuidado direto;"),
          const Text("⦁ Pessoas idosas residentes;"),
          const Text(
              "⦁ Visitantes, que também desempenham um papel na prevenção."),
          const Text(
              "Cada ILPI deve seguir um protocolo de precauções e manter registros e monitoramento mensal das infecções."),
          const Text(
              "A vacinação tanto dos residentes quanto dos profissionais, conforme o Plano Nacional de Imunização, também é crucial."),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_sete_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Objetivos do controle e prevenção de infecções",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("⦁ Reduzir a morbimortalidade causada por infecções;"),
          const Text("⦁ Prevenir surtos dentro da ILPI;"),
          const Text("⦁ Proteger os profissionais da instituição;"),
          const Text(
              "⦁ Reduzir os custos associados às infecções e ao uso de antimicrobianos."),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildHigienizacaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "A higienização das mãos é uma das práticas mais simples e eficazes para reduzir infecções em Instituições de Longa Permanência para Idosos (ILPIs). As mãos são a principal via de transmissão de microrganismos durante o cuidado às pessoas idosas, tornando essa ação crucial para a segurança e saúde dos residentes."),
          const SizedBox(height: 10),
          const Text(
            "Importância da higienização das mãos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "A prática correta de lavar as mãos é a medida mais eficiente para prevenir Infecções Relacionadas à Assistência à Saúde (IRAS). A equipe multiprofissional que trabalha nas ILPIs tem a responsabilidade direta de garantir a segurança das pessoas idosas, principalmente no combate a essas infecções, que podem ter graves consequências. Vale salientar que, assim como os profissionais de saúde e os cuidadores, as próprias pessoas idosas residentes também devem ser encorajadas a manter sempre as mãos higienizadas."),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_oito_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Quatro momentos fundamentais para higienizar as mãos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "De acordo com a Organização Mundial da Saúde (OMS), os profissionais de saúde e cuidadores que atuam em ILPIs devem higienizar as mãos em quatro momentos-chave:"),
          const Text(
              "1. Antes de tocar a pessoa idosa – Isso ajuda a evitar a transmissão de microrganismos do cuidador para o residente."),
          const Text(
              "2. Antes de realizar procedimentos limpos/assépticos – Garante que as mãos estejam livres de microrganismos prejudiciais antes de procedimentos que requerem limpeza rigorosa."),
          const Text(
              "3. Após o risco de exposição a fluidos corporais – Impede a transmissão de patógenos após o contato com fluidos corporais, como sangue ou secreções."),
          const Text(
              "4. Após tocar a pessoa idosa – Previne que microrganismos da pele da pessoa idosa sejam levados a outros locais ou pessoas."),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_novo_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Garantia de Segurança",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Adotar essas práticas de forma regular e consciente é essencial para manter a segurança das pessoas idosas institucionalizadas, reduzindo o risco de infecções e contribuindo para um ambiente mais seguro e saudável nas ILPIs. A higienização correta das mãos é, portanto, uma responsabilidade compartilhada entre todos os profissionais de saúde e cuidadores."),
          const Text(
              "A prática diária da higienização das mãos é um dos pilares da prevenção de infecções e deve ser continuamente reforçada para garantir o bem-estar e a saúde dos idosos em ILPIs."),
          const SizedBox(height: 10),
          const Text(
              "Abaixo, segue o passo a passo de como higienizar corretamente as mãos:"),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_vinteseis_segun (1).png"),
          const Text("Fonte: ANVISA. Disponível em:"),
          const Text(
            "http://antigo.anvisa.gov.br/documents/33852/450443/Cartaz+Higieniza%C3%A7%C3%A3o+Simples+ds+M%C3%A3os/be3e4206-0dfd-4f0d-a563-71cf9ebccd91",
            style: TextStyle(
                color: Colors.blue, decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
