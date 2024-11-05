import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class AlimentacaoScreen extends StatelessWidget {
  const AlimentacaoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User currentUser = FirebaseAuth.instance.currentUser!;
    
    return Scaffold(
      backgroundColor: const Color(0xFFCAE5D1),
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
                "Orientações para atividades básicas de vida diárias",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500, // Roboto Medium
                  color: Color(0xFF707070), // Cor cinza escuro
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF707070), // Linha cinza escura
              thickness: 1,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Alimentação",
                style: TextStyle(
                  fontSize: 24, // Tamanho do título grande
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF43604C), // Verde escuro
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
                  title: "Alimentação Saudável:",
                  subtitle:
                      "Bem-estar, qualidade de vida e desafios nas instituições de longa permanência para idosos (ILPIS)",
                  content: _buildAlimentacaoContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title: "Gestão da qualidade alimentar nas ILPIS",
                  subtitle: "Detalhes sobre gestão de qualidade.",
                  content: _buildGestaoContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title:
                      "Avaliação nutricional na admissão de pessoas idosas em ILPIS",
                  subtitle: "Detalhes sobre avaliação nutricional.",
                  content: _buildAvaliacaoNutricionalContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title:
                      "Recomendações práticas para o cuidado com a alimentação oral de pessoas idosas em ILPIs",
                  subtitle: "Detalhes sobre alimentação oral.",
                  content: _buildOrientacoesPraticasContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title:
                      "Recomendações para o cuidado com a nutrição enteral (alimentação por sonda)",
                  subtitle: "Detalhes sobre nutrição enteral.",
                  content: _buildNutricaoEnteralContent(),
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
            color: Color(0xFF43604C),
          ),
        ),
        children: [content],
      ),
    );
  }

  Widget _buildAlimentacaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A nutrição e a alimentação saudável no ambiente das ILPIs têm como intuito garantir a melhoria constante dos serviços alimentares e promover cuidados adequados acerca da alimentação das pessoas idosas residentes, para proporcionar bem-estar e qualidade de vida.",
          ),
          const SizedBox(height: 10),
          const Text(
            "A Importância da nutrição no envelhecimento saudável",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "Uma alimentação equilibrada, nutricionalmente adequada e segura tem um impacto direto para as pessoas idosas, no que diz respeito à:",
          ),
          const SizedBox(height: 7),
          const Text("⦁ Bem-estar físico e mental;"),
          const Text("⦁ Equilíbrio emocional;"),
          const Text("⦁ Melhoria da capacidade funcional;"),
          const Text("⦁ Prevenção e tratamento de doenças;"),
          const Text("⦁ Promoção de um envelhecimento saudável."),
          const SizedBox(height: 10),
          const Text(
              "Nas ILPIs, a equipe de saúde e cuidadores desempenham um papel crucial no:"),
          const SizedBox(height: 4),
          const Text("⦁ Planejamento e manejo dos cuidados alimentares;"),
          const Text(
              "⦁ Monitoramento do estado nutricional das pessoas idosas."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_alimentacao_.png"),
          const SizedBox(height: 2),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Desafios nutricionais nas ILPIs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Muitas pessoas idosas institucionalizadas enfrentam diversas condições de saúde, como:",
          ),
          const SizedBox(height: 5),
          const Text("⦁ Desnutrição;"),
          const Text("⦁ Sarcopenia (perda de massa muscular);"),
          const Text("⦁ Fragilidade;"),
          const Text("⦁ Obesidade;"),
          const Text("⦁ Doenças crônicas e degenerativas."),
          const SizedBox(height: 5),
          const Text(
            "Essas condições reforçam a importância de uma alimentação de qualidade, focada nas necessidades nutricionais específicas de cada pessoa idosa residente.",
          ),
          const SizedBox(height: 5),
          const Text(
            "Fatores de risco nutricional",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "A institucionalização pode agravar o risco nutricional devido a fatores como:",
          ),
          const SizedBox(height: 5),
          const Text("⦁ Condições biopsicossociais;"),
          const Text("⦁ Comorbidades;"),
          const Text("⦁ Fragilidade;"),
          const Text("⦁ Incapacidade funcional;"),
          const Text(
              "⦁ Uso de medicamentos que afetam o apetite ou causam restrições alimentares."),
          const SizedBox(height: 5),
          const Text(
            "Impacto das doenças crônicas na alimentação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "Doenças crônicas e degenerativas podem:",
          ),
          const SizedBox(height: 5),
          const Text("⦁ Reduzir a capacidade motora e de mobilidade;"),
          const Text(
              "⦁ Afetar a autonomia e independência para a alimentação."),
          const SizedBox(height: 5),
          const Text(
            "Dificuldades alimentares comuns em pessoas idosas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "Alguns fatores fisiológicos e patológicos podem interferir na alimentação adequada, como:",
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Perda de autonomia e da capacidade cognitiva para se alimentar sozinho;"),
          const Text(
              "⦁ Diminuição do apetite, olfato e percepção de sede e temperatura;"),
          const Text(
              "⦁ Dificuldade para mastigar, devido à perda de dentes ou fraqueza muscular."),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildGestaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A qualidade da alimentação oferecida nas ILPIs é um dos fatores determinantes para a condição de saúde e qualidade de vida das pessoas idosas residentes. A produção das refeições ofertadas às pessoas idosas institucionalizadas é de responsabilidade da própria instituição, que deve levar em consideração os aspectos culturais locais e todas as etapas da cadeia produtiva da Unidade de Alimentação e Nutrição da ILPI (manipulação, preparação, fracionamento, armazenamento e distribuição).",
          ),
          const SizedBox(height: 10),
          const Text(
            "A gestão da qualidade da alimentação na ILPI se inicia desde a recepção, higiene, manipulação, preparação dos alimentos até a entrega da refeição à pessoa idosa residente.",
          ),
          const SizedBox(height: 10),
          const Text(
            "É imprescindível que a equipe de saúde, sobretudo o(a) profissional nutricionista, tenha um olhar atento na elaboração do plano alimentar, o qual deve ser construído com base na avaliação da pessoa idosa, respeitando a individualidade, o estado nutricional, as condições de saúde geral e a história alimentar, cultural e social do(a) residente.",
          ),
          const SizedBox(height: 10),
          const Text(
              "Neste contexto, a presença de um(a) profissional nutricionista na equipe de saúde é fundamental para:"),
          const SizedBox(height: 5),
          const Text(
              "⦁ Realizar exame físico nutricional, triagem e avaliação nutricional de cada pessoa idosa residente;"),
          const SizedBox(height: 3),
          const Text(
              "⦁ Implementar planos alimentares variados e nutritivos, adaptados ao estado nutricional, condições de saúde e contexto cultural e social de cada pessoa idosa residente;"),
          const SizedBox(height: 3),
          const Text("⦁ Garantir a segurança alimentar no ambiente da ILPI."),
          const SizedBox(height: 10),
          const Text(
            "Vale salientar que é de suma importância promover a capacitação de todos os profissionais da instituição envolvidos na cadeia produtiva de alimentos, desde os profissionais de saúde e cuidadores até a equipe de cozinha, visando a melhoria contínua no funcionamento dos serviços de alimentação nas ILPI e também nos cuidados relacionados à alimentação das pessoas idosas residentes.",
          ),
          Image.asset("assets/images/orientacoes/Foto_nutri.png"),
          const SizedBox(height: 2),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }

  Widget _buildAvaliacaoNutricionalContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A avaliação nutricional é um passo crucial no momento da admissão da pessoa idosa residente, pois permite:",
          ),
          const SizedBox(height: 10),
          const Text(
              "⦁ Conhecer o estado nutricional da pessoa idosa ao chegar à instituição;"),
          const SizedBox(height: 3),
          const Text(
            "⦁ Identificar se o(a) residente está em boas condições, desnutrido(a), com sobrepeso/obesidade ou em risco nutricional.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Ferramenta de avaliação: Mini Avaliação Nutricional Reduzida",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "A ferramenta mais utilizada nas ILPIs é a versão reduzida da Mini Avaliação Nutricional. Este instrumento permite:",
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Avaliar fatores que afetam o estado nutricional da pessoa idosa;"),
          const Text(
            "⦁ Mensurar o risco nutricional da pessoa idosa e possibilitar intervenções oportunas e adequadas.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Triagem nutricional e dados antropométricos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "A triagem nutricional e a avaliação dos dados antropométricos (peso, altura, IMC e Circunferência da panturrilha) devem ser realizadas pelo(a) enfermeiro(a) ou pelo(a) nutricionista da ILPI.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Intervenções baseadas no resultado da avaliação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "Após o rastreamento nutricional, as intervenções são feitas conforme a classificação obtida no teste:",
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Escore normal: repetir a avaliação a cada 3 meses ou em casos de situações adversas (ex.: internação)."),
          const Text(
            "⦁ Risco nutricional com antropometria normal: repetir a avaliação a cada 3 meses ou em situações adversas.",
          ),
          const Text(
            "⦁ Risco nutricional ou desnutrição: encaminhar para uma avaliação nutricional completa e intervenção com o(a) nutricionista.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Mini Avaliação Nutricional – versão reduzida:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/images/orientacoes/Foto_tabela_of.png"),
          const SizedBox(height: 8),
          const Text(
            "Classificação de acordo com a pontuação dos escores:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text("⦁ 12 a 14 pontos: estado nutricional normal"),
          const Text("⦁ 8 a 11 pontos: sob risco de desnutrição"),
          const Text("⦁ 0 a 7 pontos: desnutrido"),
          Image.asset("assets/images/orientacoes/Foto_valiacao.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }

  Widget _buildOrientacoesPraticasContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Para garantir uma alimentação adequada e segura às pessoas idosas nas ILPIs, seguem algumas orientações práticas:",
          ),
          const SizedBox(height: 10),
          const Text(
            "Postura e ambiente",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Posição ao se alimentar: a pessoa idosa deve estar sentada confortavelmente. Nunca ofereça alimentos ou líquidos na posição deitada para evitar engasgos."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Estimular a autonomia: se o idoso consegue se alimentar sozinho, o cuidador deve incentivá-lo e ajudar apenas quando necessário, como ao preparar o ambiente ou cortar os alimentos."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Respeitar o tempo: pessoas idosas costumam demorar mais para se alimentar. É importante não as apressar."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_um_recom.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Higiene e manuseio dos alimentos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Utensílios e locais limpos: mantenha os utensílios e os locais de preparo e consumo sempre higienizados. A equipe da cozinha também deve ter cuidado com sua higiene pessoal para evitar a contaminação dos alimentos."),
          const SizedBox(height: 10),
          const Text(
            "Hidratação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Oferecer líquidos regularmente: ofereça aproximadamente entre 6 a 8 copos de líquidos por dia, como água, chá, leite ou suco de frutas, de preferência nos intervalos das refeições."),
          const SizedBox(height: 1),
          Image.asset("assets/images/orientacoes/Foto_dois_recom.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
          const Text(
            "Dieta balanceada",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Variedade de alimentos: a dieta da pessoa idosa deve ser variada, incluindo carnes e leguminosas (ricos em ferro), além de frutas ricas em vitamina C, que ajudam na absorção do ferro vegetal (laranja, limão, caju, goiaba, abacaxi)."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Controle de açúcar e gorduras: o consumo de doces e gorduras pelas pessoas idosas deve ser desencorajado ou então moderado para manter o peso adequado e prevenir doenças cardiovasculares, obesidade e diabetes."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_tres_recom.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Falta de apetite",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Alimentos preferidos: em caso de falta de apetite, ofereça alimentos saudáveis e do agrado da pessoa idosa, incentivando-a a comer."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Texturas adequadas: para as pessoas idosas com dificuldade de mastigar, alimentos líquidos e pastosos, como sopas, purês e vitaminas, são mais bem aceitos."),
          const SizedBox(height: 10),
          const Text(
            "Estimulação dos sentidos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Refeições atrativas: estimule o apetite com refeições saborosas, cheirosas e visualmente atrativas. Varie os temperos e modos de preparo dos alimentos."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Temperos naturais: utilize temperos naturais como alho, cebola, cheiro-verde, manjericão, louro, orégano, hortelã, etc., para dar sabor aos alimentos."),
          const SizedBox(height: 1),
          Image.asset("assets/images/orientacoes/Foto_quatro_recom.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 8),
          const Text(
            "Consistência dos alimentos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Textura dos alimentos: se a pessoa idosa consegue mastigar bem, mantenha os alimentos em pedaços. Se houver dificuldades (ex.: ausência de dentes), ofereça alimentos picados, desfiados, ralados ou batidos no liquidificador."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados específicos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Constipação intestinal: ofereça alimentos ricos em fibras (frutas, hortaliças cruas, cereais integrais) e mantenha a pessoa idosa bem hidratada. Estimule caminhadas leves e alongamentos."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Náuseas, vômitos e diarreia: aumente a ingestão de líquidos em pequenas quantidades ao longo do dia, evite alimentos muito temperados e mantenha a pessoa idosa sentada após as refeições."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Dificuldade para engolir (disfagia): sirva refeições menores de 6 a 7 vezes ao dia, ofereça líquidos nos intervalos e evite alimentos duros, farinhentos e secos."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Gases (flatulência): ofereça mais líquidos e uma alimentação saudável, evitando alimentos como feijão, couve-flor, cebola crua e bebidas gasosas. Estimule a movimentação e exercícios físicos, se possível."),
        ],
      ),
    );
  }

  Widget _buildNutricaoEnteralContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "O que é nutrição enteral?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "A nutrição enteral é uma forma de alimentação indicada para as pessoas idosas que não conseguem ingerir alimentos oralmente de forma adequada, seja por dor, desconforto ou condições clínicas, como:"),
          const SizedBox(height: 5),
          const Text("⦁ Acidente Vascular Encefálico (AVE);"),
          const Text("⦁ Neoplasias;"),
          const Text("⦁ Lesões orais;"),
          const Text("⦁ Depressão grave;"),
          const Text("⦁ Demências;"),
          const Text("⦁ Doença de Crohn;"),
          const Text("⦁ Pancreatite."),
          const SizedBox(height: 5),
          const Text(
              "A dieta enteral é fornecida na forma líquida através de uma sonda, que é inserida pelo nariz ou boca e vai até o estômago ou intestino, garantindo que a pessoa idosa receba os nutrientes necessários sem depender de sua cooperação ou vontade de comer."),
          const SizedBox(height: 10),
          const Text(
            "Tipos de dieta enteral",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Dieta caseira: preparada com alimentos naturais, cozidos, processados no liquidificador e coados para obter consistência líquida. Tem validade de 12 horas."),
          const Text(
              "⦁ Dieta industrializada: já vem pronta para o consumo, pode ser utilizada por até 24 horas após aberta, mas tem custo mais elevado."),
          const SizedBox(height: 10),
          const Text(
            "Prescrição, instalação da sonda e administração da dieta enteral",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Prescrição da dieta enteral: a alimentação enteral deve ser sempre prescrita por um médico ou nutricionista."),
          const Text(
              "⦁ Instalação da sonda: a sonda deve ser inserida por um(a) enfermeiro(a). A fixação externa pode ser trocada pelo cuidador ou pela equipe de enfermagem, desde que feita com cuidado para evitar lesões na pele e o deslocamento da sonda."),
          const Text(
              "⦁ Administração da dieta enteral: a alimentação enteral deve ser administrada pela equipe de enfermagem e cuidadores."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados com as pessoas idosas que recebem nutrição enteral",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            " Posição adequada para receber a dieta",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ A pessoa idosa deve estar sentada na cama ou cadeira, com as costas bem apoiadas."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Após a alimentação, mantenha a pessoa idosa sentada por 30 minutos para evitar que restos de alimentos entrem nos pulmões em caso de vômitos ou regurgitação."),
          const SizedBox(height: 5),
          const Text(
            " Administração da dieta",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ O frasco da dieta deve estar pendurado em um suporte, bem mais alto que a pessoa idosa, para facilitar a descida do líquido."),
          const SizedBox(height: 3),
          const Text(
              "⦁ A dieta deve ser administrada lentamente, gota a gota, para prevenir problemas como diarreia, gases, estufamento e vômitos, além de garantir a melhor absorção dos nutrientes."),
          const SizedBox(height: 20),
          Image.asset("assets/images/orientacoes/Foto_enteral.png"),
          const Text("Fonte: Guia prático do cuidador / Ministério da Saúde"),
          const SizedBox(height: 10),
          const Text(
            "Quantidade e frequência",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Administre no máximo 350 ml de dieta por vez, conforme a prescrição médica, várias vezes ao dia."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Ao finalizar, injete 20 ml de água filtrada ou fervida, em temperatura ambiente, para limpar a sonda e evitar que ela entupa."),
          const SizedBox(height: 10),
          const Text(
            "Hidratação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
              "⦁ Para pessoas idosas que não podem tomar água pela boca, ofereça água entre as refeições pela sonda, por meio de uma seringa ou frasco, sempre seguindo a quantidade indicada pela equipe de saúde."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados com a sonda",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          const Text(
              "⦁ A sonda deve permanecer fechada quando não estiver em uso."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Se a sonda deslocar ou for retirada acidentalmente, o(a) enfermeiro(a) deve ser contactado imediatamente para recolocá-la."),
          const SizedBox(height: 10),
          const Text(
            "Temperatura e armazenamento da dieta",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text("⦁ A dieta deve ser oferecida em temperatura ambiente."),
          const Text(
              "⦁ Se a dieta for caseira, guarde na geladeira e retire apenas a porção a ser utilizada, 30 minutos antes de servir."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados com a higiene",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text("⦁ Lave o local de preparo com água e sabão."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Higienize as mãos antes de preparar e/ou manipular a dieta."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Pese e meça todos os ingredientes conforme prescrição."),
          const SizedBox(height: 3),
          const Text("⦁ Use sempre água filtrada ou fervida."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Lave todos os utensílios com água corrente e sabão; enxágue com água quente para evitar contaminação."),
        ],
      ),
    );
  }
}
