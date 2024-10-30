import 'package:flutter/material.dart';

class PrevenQuedasScreen extends StatelessWidget {
  const PrevenQuedasScreen({Key? key}) : super(key: key);

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
                "Prevensão de Quedas",
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
                      "QUEDAS EM INSTITUIÇÕES DE LONGA PERMANÊNCIA PARA IDOSOS (ILPIs)",
                  subtitle: "",
                  content: _buildQuedasContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title: "AVALIAÇÃO DO RISCO DE QUEDA E INTERVENÇÕES SUGERIDAS",
                  subtitle: "",
                  content: _buildInstrumentosQuedasContent(),
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

  Widget _buildQuedasContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "As quedas representam um grave problema de saúde pública para a população idosa, especialmente nas Instituições de Longa Permanência para Idosos (ILPIs). "
            "O ambiente institucional pode agravar as consequências das quedas devido à mudança do lar para uma instituição, resultando em alterações psicológicas, cognitivas e funcionais. "
            "Essas mudanças estão frequentemente associadas ao isolamento social e à diminuição da atividade física.",
          ),
          const SizedBox(height: 10),
          const Text(
            "É essencial registrar o evento de queda, incluindo:\n"
            "•	Doenças crônicas.\n"
            "•	Declínio funcional\n"
            "•  Alterações psíquicas, como depressão e demência.\n"
            "•	Alta vulnerabilidade.",
          ),
          const SizedBox(height: 5),
          Image.asset("assets/images/seguranca/Foto_quatorze_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
          const Text(
            "Causas das Quedas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "A causa das quedas é multifatorial, relacionada a fatores intrínsecos (relacionados à pessoa idosa) e extrínsecos (relacionados ao ambiente).",
          ),
          const SizedBox(height: 10),
          const Text("Fatores Intrínsecos",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• História prévia de quedas\n• Transtorno da visão\n• Problemas de equilíbrio\n• Marcha alterada\n• Idade\n• Polifarmácia\n• Interação medicamentosa\n• Condição clínica\n• Doenças crônicas não transmissíveis\n• Doenças neurológicas/ortopédicas\n• Incontinências\n• Sarcopenia\n• Fragilidade (dependência funcional)"),
          const SizedBox(height: 10),
          const Text("Fatores Extrínsecos",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Iluminação inadequada\n• Superfícies escorregadias\n• Tapetes soltos\n• Degraus altos ou estreitos\n• Obstáculos (como móveis baixos e fios)\n• Falta de adaptação ambiental\n• Prateleiras fora do alcance\n• Vestuário e calçados inadequados\n• Calçamento irregular\n• Animais de estimação no ambiente"),
          const SizedBox(height: 10),
          const Text(
            "Medicamentos Potenciais para Quedas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "• Anticonvulsivantes\n• Opioides\n• Psicofármacos (antipsicóticos, hipnóticos, benzodiazepínicos)\n• Medicamentos cardiovasculares (anti-hipertensivos, antiarrítmicos, diuréticos)\n• Hipoglicemiantes (como insulina)",
          ),
          const Text(
            "Esses medicamentos podem causar hipotensão ortostática, disfunção cognitiva, distúrbios de equilíbrio, tontura e sonolência.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Ciclo do Medo de Cair",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "Após uma queda, a pessoa idosa pode se tornar menos ativa, diminuindo a força muscular e o equilíbrio, o que aumenta o risco de novas quedas. Esse fenômeno é conhecido como ciclo do medo de cair.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Registro do Episódio de Queda",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "É essencial registrar o evento de queda, incluindo:\n"
            "• Local e circunstâncias\n"
            "• Decisões tomadas após a queda\n"
            "• Data e horário do incidente\n"
            "• Relator do evento",
          ),
          const Text(
            "Cada ILPI deve notificar imediatamente à autoridade sanitária local qualquer queda com lesão. A caracterização das quedas (fatores internos, externos, comportamentais ou mistos) ajuda a desenvolver estratégias para prevenir novos incidentes.",
          ),
          const SizedBox(height: 5),
          Image.asset("assets/images/seguranca/Foto_quinze_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
          const SizedBox(height: 10),
          const Text(
            "Estratégias de Prevenção de Quedas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "• Conhecer o perfil dos residentes e seus fatores de risco\n"
            "• Identificar riscos como quedas prévias e polifarmácia\n"
            "• Realizar intervenções multidisciplinares\n"
            "• Incentivar a prática de exercícios para melhorar o equilíbrio\n"
            "• Monitorar medicamentos e efeitos colaterais\n"
            "• Garantir um ambiente seguro: pisos antiderrapantes, barras de apoio\n"
            "• Distribuir material educativo\n"
            "• Assegurar comunicação eficaz entre a equipe\n"
            "• Orientar sobre o uso de vestuário e calçados adequados\n"
            "• Avaliar a necessidade de dispositivos auxiliares\n"
            "• Reavaliar o risco após mudanças na rotina ou quadro clínico",
          ),
          const SizedBox(height: 5),
          Image.asset("assets/images/seguranca/Foto_dezeseis_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildInstrumentosQuedasContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A aplicação de instrumentos de avaliação do risco de quedas em pessoas idosas nas ILPIs é realizada por profissionais de saúde, geralmente o(a) enfermeiro(a) ou o(a) fisioterapeuta, e pode ser repetida sempre que houver mudança no estado clínico da pessoa idosa residente, como após a introdução de novos medicamentos, após episódio de internação hospitalar ou após quedas.",
          ),
          const Text(
            "A utilização destes instrumentos nas ILPIs possibilita identificar residentes em risco e implementar estratégias de prevenção, como adaptações no ambiente ou no cuidado direto. Segue abaixo dois exemplos de instrumentos utilizados para avaliar o risco de quedas em ILPIs.",
          ),
          const SizedBox(height: 5),
          Image.asset("assets/images/seguranca/Foto_dezessete_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 5),
          const Text(
            "• Time Get Up and Go – TUG",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "O Time Get Up and Go (TUG) é um teste clínico simples e amplamente utilizado para avaliar a mobilidade funcional, equilíbrio e risco de quedas em idosos. Ele é particularmente útil para identificar indivíduos que podem estar em risco de sofrer quedas devido a dificuldades de locomoção. O teste avalia a capacidade da pessoa idosa residente se levantar de uma cadeira sem apoio de braços, caminhar 3 metros, dar meia volta e"
              "sentar-se novamente. De acordo com o tempo para desempenhar esta tarefa é"
              "possível avaliar o risco de quedas."),
          const Text(
            "Entretanto, como limitação, tem-se que O TUG mede apenas aspectos físicos da mobilidade e não leva em conta fatores clínicos da pessoa idosa, que também podem impactar o risco de quedas.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Como funciona o teste TUG:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "1. Início: A pessoa idosa começa sentada em uma cadeira com apoio.\n"
            "2. Ação: Ao sinal do avaliador, levanta-se, caminha 3 metros, gira, volta e senta-se novamente.\n"
            "3. Tempo: O tempo necessário para completar a tarefa é cronometrado (geralmente entre 8 a 12 segundos em pessoas saudáveis).",
          ),
          const SizedBox(height: 10),
          const Text(
            "Avaliação do teste TUG:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "• Menor ou igual a 10s - independente em tarefas básicas, sem alterações.\n"
            "• Entre 11 e 20s - independente em transferências básicas, baixo risco de quedas.\n"
            "• Maior ou igual a 20s - dependente em várias atividades da vida diária e na mobilidade – alto risco de quedas.",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Escala de Quedas de Morse",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Outra alternativa de instrumento para avaliar o risco de quedas é a Escala de Quedas de Morse (Morse Fall Scale - MFS), amplamente utilizada para avaliar o risco de quedas em idosos em diferentes ambientes, como hospitais e ILPIs. A escala é rápida e fácil de aplicar, baseada em uma série de fatores de risco que são comumente observados em pessoas idosas."),
          const SizedBox(height: 10),
          const Text(
            "Como funciona a Escala de Morse:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "A Escala de Morse avalia seis fatores que contribuem para o risco de queda. Cada fator recebe uma pontuação, que é somada para fornecer uma classificação de risco. Com base no escore final, o indivíduo é classificado em baixo, médio ou alto risco de queda:\n"
            "• Baixo risco: 0-24 pontos\n"
            "• Risco moderado: 25-44 pontos\n"
            "• Alto risco: ≥ 45 pontos",
          ),
          const SizedBox(height: 10),
          const Text(
            "Escala de Morse para Avaliação do Risco de Quedas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/images/seguranca/segun.png"),
          const SizedBox(height: 10),
          const Text(
            "Exemplo de Estratégias Preventivas Baseadas na Pontuação dos Instrumentos:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "• Baixo risco: Observação e ações educativas sobre prevenção de quedas.\n"
            "• Médio risco: Supervisão e intervenções como o uso de calçados adequados e exercícios multicomponentes (treino de força, cardiorrespiratório, equilíbrio, flexibilidade).\n"
            "• Alto risco: Supervisão constante, uso de dispositivos de proteção (como barras de apoio), revisão de medicações que possam aumentar o risco de quedas e rastreio de outros fatores que contribuem para o alto risco.",
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_dezoito_segun.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }
}
