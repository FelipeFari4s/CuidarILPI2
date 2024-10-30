import 'package:flutter/material.dart';

class PrevenLesaoScreen extends StatelessWidget {
  const PrevenLesaoScreen({Key? key}) : super(key: key);

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
                "Prevensão de lesão por pressão",
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
                      "LESÕES POR PRESSÃO NO CONTEXTO DAS INSTITUIÇÕES DE LONGA PERMANÊNCIA PARA IDOSOS (ILPIs)",
                  subtitle: "",
                  content: _buildLesoesPeleContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title:
                      "AVALIAÇÃO DO RISCO DE LESÃO POR PRESSÃO E A ESCALA DE BRADEN",
                  subtitle: "",
                  content: _buildImportanciaAvaliacaoContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title:
                      "CUIDADOS PARA PREVENIR LESÕES POR PRESSÃO NAS INSTITUIÇÕES DE LONGA PERMANÊNCIA PARA IDOSOS (ILPIs)",
                  subtitle: "",
                  content: _buildPrevencaoLesoesPressaoContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title: "MANEJO TERAPÊUTICO DAS LESÕES POR PRESSÃO",
                  subtitle: "",
                  content: _buildManejoLesoesPressaoContent(),
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

  Widget _buildLesoesPeleContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Nas Instituições de Longa Permanência para Idosos (ILPI), a vulnerabilidade da pessoa idosa às lesões de pele é agravada devido à imobilidade ou restrição de mobilidade dos residentes. "
            "Esse cenário aumenta o risco de lesões por pressão, que são resultantes de fatores externos, como:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Pressão prolongada em regiões vulneráveis da pele.\n"
            "• Umidade, principalmente devido a incontinência.\n"
            "• Cisalhamento, causado pelo atrito da pele com superfícies (camas, cadeiras, sofás etc).",
          ),
          const Text(
            "As lesões por pressão são, portanto, um indicador importante da qualidade da assistência e segurança oferecida nas ILPIs.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Características da pele da pessoa idosa:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "A pele da pessoa idosa é mais frágil e apresenta menor capacidade de atuar como barreira protetora contra fatores externos. Entre as alterações fisiológicas mais comuns da pele em idosos, destacam-se:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Termorregulação deficiente: resposta inadequada ao calor e diminuição da sudorese.\n"
            "• Pele mais seca e rugosa: menor produção de óleo pela redução das glândulas sebáceas.\n"
            "• Menor estímulo sensitivo: redução da capacidade dos receptores sensoriais.\n"
            "• Diminuição da elasticidade e flacidez: redução de colágeno e elastina.\n"
            "• Alteração da resposta imunológica celular.\n"
            "• Pele mais fina: diminuição da espessura da derme e epiderme.\n"
            "• Redução de melanócitos: menor proteção contra raios ultravioleta.",
          ),
          const Text(
            "Essas alterações tornam a pele da pessoa idosa mais suscetível a lesões causadas por fatores externos, como pressão, umidade e cisalhamento (atrito ou fricção entre a pele e superfícies).",
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_dezenovo_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
          const Text(
            "Fatores e condições de risco para lesões por pressão:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Diversos fatores contribuem para o desenvolvimento de lesões por pressão nas pessoas idosas institucionalizadas, incluindo:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Redução do reflexo da sede: aumenta o risco de desidratação e reduz a elasticidade da pele.\n"
            "• Uso de medicamentos: alguns medicamentos afetam a circulação sanguínea da pele.\n"
            "• Incontinências urinária e/ou fecal: a umidade excessiva torna a pele alcalinizada e propensa a infecções.\n"
            "• Desnutrição: compromete a imunidade e dificulta a cicatrização.\n"
            "• Obesidade: dificulta a mobilidade e agrava a pressão sobre a pele.\n"
            "• Imobilidade: permanência prolongada na cama ou cadeira favorece o surgimento de pontos de pressão na pele.",
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildImportanciaAvaliacaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A Importância da avaliação diária\n"
            "Em Instituições de Longa Permanência para Idosos (ILPI), a avaliação diária da pele das pessoas idosas é fundamental. Todos os profissionais de saúde devem realizar essa avaliação rotineiramente, para:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Identificar riscos e lesões primárias;\n"
            "• Garantir intervenções sistematizadas, integralizadas e individualizadas.",
          ),
          const Text(
            "A avaliação deve ser constante e a identificação das pessoas idosas em risco deve incluir:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Inspeção visual e palpação da pele (especialmente em áreas de vermelhidão);\n"
            "• Utilização de escalas preditivas para avaliação de riscos.",
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_vinte_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
          const Text(
            "Escala de Braden:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "A Escala de Braden é amplamente utilizada, tanto no Brasil quanto mundialmente, para avaliar os fatores que aumentam o risco de lesão por pressão. A avaliação de risco utilizando a Escala de Braden permite que as ILPIs realizem ações preventivas adequadas de forma proativa, ajustando as intervenções conforme a necessidade individual da pessoa idosa e a gravidade do risco de lesão por pressão. "
            "A avaliação de risco utilizando a Escala de Braden permite que as ILPIs realizem ações preventivas adequadas de forma proativa, ajustando as intervenções conforme a necessidade individual da pessoa idosa e a gravidade do risco de lesão por pressão.",
          ),
          const SizedBox(height: 10),
          const Text(
            "A avaliação é baseada em quatro áreas principais:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Mobilidade.\n"
            "• Incontinência.\n"
            "• Déficit sensitivo.\n"
            "• Estado nutricional (incluindo a hidratação).",
          ),
          const SizedBox(height: 10),
          const Text(
            "Escala de Braden:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Image.asset("assets/images/seguranca/escala_braden.png"),
          const SizedBox(height: 5),
          const Text(
            "Classificação de risco pela Escala de Braden e medidas preventivas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "Com base na pontuação da Escala de Braden é possível identificar a pessoa idosa sem risco para lesão por pressão (escores de 19 a 23 pontos) e também diferentes níveis de risco são identificados, cada um com medidas preventivas recomendadas:",
          ),
          const SizedBox(height: 3),
          const Text(
            "Risco Baixo (15 a 18 pontos):\n"
            "• Cronograma de mudança de decúbito: alterações regulares de posição.\n"
            "• Otimização da mobilização: estímulo à movimentação da pessoa idosa.\n"
            "• Proteção do calcanhar: uso de dispositivos que protejam os calcanhares da pressão.\n"
            "• Manejo da umidade: controle da umidade para evitar irritação e ressecamento.\n"
            "• Nutrição adequada: garantir uma dieta que previna desidratação e desnutrição.\n"
            "• Controle de fricção e cisalhamento: reduzir atritos com o uso de superfícies de redistribuição de pressão.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Risco Moderado (13 a 14 pontos):\n"
            "• Continuar as intervenções do risco baixo.\n"
            "• Mudança de decúbito com posicionamento a 30°: ajuste para uma posição lateral confortável e segura.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Risco Alto (10 a 12 pontos):\n"
            "• Continuar as intervenções do risco moderado.\n"
            "• Mudança de decúbito frequente: alterações mais regulares da posição para aliviar a pressão.\n"
            "• Uso de coxins de espuma: auxiliar na lateralização a 30º, protegendo as áreas mais vulneráveis.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Risco Muito Alto (≤ 9 pontos):\n"
            "• Continuar as intervenções do risco alto.\n"
            "• Superfícies de apoio dinâmico: utilizar superfícies de apoio com pequena perda de ar para redistribuir a pressão, se disponível.\n"
            "• Manejo da dor: implementar estratégias de controle da dor associada à lesão por pressão.",
          ),
        ],
      ),
    );
  }

  Widget _buildPrevencaoLesoesPressaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Nas Instituições de Longa Permanência para Idosos (ILPIs), a principal estratégia no cuidado com lesões por pressão é a prevenção. "
            "Medidas preventivas, baseadas em evidências científicas, são essenciais para evitar o desenvolvimento de lesões por pressão. "
            "A seguir, estão listadas estratégias fundamentais para a prevenção desse problema:",
          ),
          const SizedBox(height: 10),
          const Text(
            "Estratégias essenciais para prevenção:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Avaliação integral na admissão: realizar uma análise do risco de desenvolvimento de lesões e inspecionar a pele para identificar possíveis lesões preexistentes.\n"
            "• Reavaliação diária do risco: monitorar diariamente o risco de desenvolvimento de lesões, garantindo que as estratégias de prevenção sejam ajustadas conforme as necessidades individuais.\n"
            "• Inspeção diária da pele: examinar o corpo da pessoa idosa diariamente, dando atenção especial às áreas onde as lesões por pressão são mais frequentes.\n"
            "• Manejo da umidade: manter a pele limpa e hidratada, utilizando produtos que minimizem a irritação e o ressecamento.\n"
            "• Otimização da nutrição e hidratação: fornecer líquidos, proteínas e suplementos nutricionais de acordo com as necessidades individuais, sob orientação do(a) nutricionista.\n"
            "• Minimização da pressão: reposicionar a pessoa idosa com restrição de mobilidade regularmente e utilizar superfícies especiais (colchões, travesseiros) para redistribuir a pressão nas áreas vulneráveis.",
          ),
          const SizedBox(height: 5),
          Image.asset("assets/images/seguranca/Foto_vinteum_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
          const Text(
            "Intervenções práticas para prevenir lesões por pressão nas ILPIs:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "As seguintes práticas são recomendadas para minimizar o risco de lesões por pressão no ambiente institucional:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Reposicionamento regular: reduzir a duração e a intensidade da pressão nas áreas vulneráveis do corpo da pessoa idosa com mobilidade reduzida.\n"
            "• Reposicionar a cada 4 horas em colchão de espuma viscoelástica e a cada 2 a 3 horas em colchões comuns.\n"
            "• Evitar massagem em áreas ósseas: não massagear áreas de proeminências ósseas ou hiperemiadas.\n"
            "• Hidratação da pele: aplicar hidratante diariamente, especialmente após o banho, com movimentos suaves e circulares.\n"
            "• Limitar o tempo na cadeira ou cama: reduzir o tempo que a pessoa idosa permanece sentada ou deitada sem alívio da pressão.\n"
            "• Suplementos nutricionais: oferecer suplementos proteicos orais ou por outros meios, sob supervisão do(a) nutricionista.\n"
            "• Gerenciamento da umidade: tratar condições que aumentam a umidade da pele, como incontinências e suor, usando produtos protetores e dispositivos adequados.\n"
            "• Higienização imediata: limpar a pele após evacuações, evitando esfregá-la com força.\n"
            "• Uso de absorventes ou fraldas: em casos de incontinência, usar fraldas ou absorventes apropriados.\n"
            "• Estimular idas ao banheiro: criar um cronograma para levar ou estimular a pessoa idosa a ir ao banheiro, minimizando os episódios de incontinência.\n"
            "• Dispositivos para reposicionamento: utilizar dispositivos como lençóis traçados para reposicionar a pessoa idosa, evitando fricção e cisalhamento. A pessoa idosa deve ser elevada, não arrastada.\n"
            "• Elevação da cabeceira: evitar elevar a cabeceira da cama acima de 30º para prevenir o deslizamento do corpo em posição de decúbito dorsal (barriga para cima).\n"
            "• Apoio para os pés: quando sentado, a pessoa idosa deve ter os pés apoiados para evitar que escorregue.",
          ),
        ],
      ),
    );
  }

  Widget _buildManejoLesoesPressaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "O manejo eficaz das lesões por pressão nas Instituições de Longa Permanência para Idosos (ILPIs) depende de uma avaliação cuidadosa, sistemática e da adoção de condutas baseadas em boas práticas, com o envolvimento ativo de toda a equipe de saúde. "
            "A implementação adequada das medidas terapêuticas pode acelerar o processo de cicatrização e melhorar a qualidade de vida da pessoa idosa.",
          ),
          const SizedBox(height: 10),
          const Text(
            "O manejo terapêutico das lesões por pressão deve ser conduzido pelo(a) enfermeiro(a) da ILPI, responsável por prescrever os cuidados necessários. "
            "Toda a equipe de saúde deve estar orientada e treinada para seguir as melhores condutas, evitando retrocessos na cicatrização.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Avaliação da pessoa idosa e da lesão:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "A avaliação da pessoa idosa com lesões por pressão e o exame específico da ferida seguem boas práticas, com etapas que incluem:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Determinar o número de lesões ativas.\n"
            "• Identificar a causa da lesão.\n"
            "• Analisar as comorbidades e complicações que podem retardar a cicatrização.\n"
            "• Determinar o tempo de existência da lesão: aguda – menos de 3 meses; crônica – mais de 3 meses.\n"
            "• Avaliar a presença de dor.\n"
            "• Estadiar a lesão, definindo o grau de gravidade.\n"
            "• Localizar topograficamente a lesão, identificando o formato e as estruturas comprometidas (pele, músculo, tendão ou osso).\n"
            "• Medir a ferida:\n"
            "   o Dimensão bidimensional: comprimento x largura (em cm).\n"
            "   o Dimensão tridimensional: comprimento x largura x profundidade (em cm).\n"
            "• Identificar a fase da cicatrização e avaliar os tecidos presentes na ferida em porcentagem (necrose, esfacelo, granulação, epitelização). A soma dos tipos de tecido deve totalizar 100%, o que indica melhora (com maior proporção de tecidos de granulação e reepitelização) ou piora (com tecidos desvitalizados, como esfacelo e necrose).\n"
            "• Analisar a presença de inflamação e infecção, bem como o aspecto da secreção (cor, odor, quantidade e consistência do exsudato).\n"
            "• Avaliar as bordas da ferida e a condição da pele ao redor.\n"
            "• Identificar cavidades, túneis ou saídas que permitam a passagem de secreção.\n"
            "• Instituir um plano de cuidados individualizado e sistematizado, baseado em evidências científicas.",
          ),
          const SizedBox(height: 5),
          Image.asset("assets/images/seguranca/Foto_vintedois_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
          const Text(
            "Princípios do manejo da lesão – Acrônimo TIMERS:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "O(a) enfermeiro(a) inicia o manejo da lesão seguindo os princípios de preparação do leito da ferida, conforme o acrônimo TIMERS:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• T (Tissue): Retirar tecido não viável (desbridar e preparar o leito).\n"
            "• I (Infection): Tratar infecção/inflamação (reduzir a carga bacteriana).\n"
            "• M (Moisture): Controlar a umidade da ferida.\n"
            "• E (Edge): Proteger e desbridar bordas da ferida que não avançam.\n"
            "• R (Repair/Regeneration): Reavaliar condutas em caso de cicatrização lenta ou estagnada.\n"
            "• S (Social): Considerar condições sociais que possam interferir no tratamento.",
          ),
          const SizedBox(height: 1),
          Image.asset("assets/images/seguranca/Foto_vintetres_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Critérios para um curativo ideal:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "Um curativo ideal deve atender aos seguintes critérios:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Manter a ferida úmida.\n"
            "• Absorver a secreção da ferida.\n"
            "• Promover isolamento térmico.\n"
            "• Permitir troca gasosa sem ressecar a ferida.\n"
            "• Ser barreira contra sujidades e microrganismos.\n"
            "• Não conter partículas tóxicas.\n"
            "• Não causar trauma à ferida.",
          ),
        ],
      ),
    );
  }
}
