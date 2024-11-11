import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class PrevenQuedasScreen extends StatelessWidget {
  const PrevenQuedasScreen({Key? key}) : super(key: key);

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
              "As quedas representam um grave problema de saúde pública para a população idosa, especialmente nas Instituições de Longa Permanência para Idosos (ILPIs). O ambiente institucional pode agravar as consequências das quedas devido à mudança do lar para uma instituição, resultando em alterações psicológicas, cognitivas e funcionais. Essas mudanças estão frequentemente associadas ao isolamento social e à diminuição da atividade física."),
          const SizedBox(height: 10),
          const Text(
              "As características comuns das pessoas idosas institucionalizadas, que fazem com que as quedas sejam mais frequentes nas ILPIs do que na comunidade, incluem:"),
          const SizedBox(height: 10),
          const Text(
            "•	Doenças crônicas.\n"
            "•	Declínio funcional\n"
            "•  Alterações psíquicas, como depressão e demência.\n"
            "•	Alta vulnerabilidade.",
          ),
          Image.asset("assets/images/seguranca/Foto_quatorze_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 15),
          const Text(
            "Causas das Quedas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "A causa das quedas é multifatorial, relacionada a fatores intrínsecos (relacionados à pessoa idosa) e extrínsecos (relacionados ao ambiente).",
          ),
          const SizedBox(height: 10),
          const Text("Fatores Intrínsecos",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• História prévia de quedas\n• Transtorno da visão\n•  Equilíbrio\n• Marcha alterada\n• Idade\n• Polifarmácia\n• Interação medicamentosa\n• Condição clínica\n• Doenças crônicas não transmissíveis\n• Doenças neurológicas/ortopédicas que afetam a marcha\n• Incontinências\n• Sarcopenia\n• Fragilidade (dependência funcional)"),
          const SizedBox(height: 10),
          const Text("Fatores Extrínsecos",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Iluminação inadequada\n• Superfícies escorregadias\n• Tapetes soltos\n• Degraus altos ou estreitos\n• Obstáculos (como móveis baixos, pequenos objetos e fios)\n• Ausêncoa dde adaptação ambiental em corredores, banheiros, entre outros\n• Prateleiras baixas ou altas\n• Vestuário e calçados inadequados\n• Vais públicas\n• Ambientes com buracos \n• Calçamento irregular \n• Animais de estimação no ambiente "),
          const SizedBox(height: 10),
          const Text(
            "Medicamentos Potenciais para Quedas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Certos medicamentos podem aumentar o risco de quedas, incluindo:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Anticonvulsivantes\n• Opioides\n• Psicofármacos (antipsicóticos, hipnóticos, benzodiazepínicos)\n• Medicamentos cardiovasculares (anti-hipertensivos, antiarrítmicos, diuréticos)\n• Hipoglicemiantes (como insulina)",
          ),
          const SizedBox(height: 10),
          const Text(
            "Interações entre medicamentos antidiabéticos e inibidores da ECA (Enzima Conversora de Angiotensina) ou betabloqueadores também são relevantes. Esses medicamentos podem causar:",
          ),
          const SizedBox(height: 10),
          const Text(
            "•	Hipotensão ortostática.\n•	Disfunção cognitiva.\n•	Distúrbios de equilíbrio.\n•	Tontura e sonolência.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Ciclo do Medo de Cair",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Como consequência da(s) queda(s), as pessoas idosas residentes nas ILPI tendem a se tornarem menos ativas, o que diminui a força muscular, altera o equilíbrio, o que, consequentemente, aumenta o risco de novas quedas. Este fenômeno é conhecido como ciclo do medo de cair. ",
          ),
          const SizedBox(height: 10),
          const Text(
            "Registro do Episódio de Queda",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "É crucial registrar detalhadamente o evento de queda, incluindo:",
          ),
          const SizedBox(height: 10),
          const Text(
            "•	Local onde ocorreu a queda.\n"
            "•	Circunstâncias da queda.\n"
            "•  Decisões tomadas após a queda.\n"
            "•  Data e horário do incidente.\n"
            "•  Relator do evento.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Cada ILPI deve notificar imediatamente à autoridade sanitária local qualquer queda com lesão. A caracterização das quedas (fatores internos, externos, comportamentais ou mistos) ajuda a desenvolver estratégias para prevenir novos incidentes.",
          ),
          Image.asset("assets/images/seguranca/Foto_quinze_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 15),
          const Text(
            "Estratégias de Prevenção de Quedas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Na ILPI, é fundamental conhecer o perfil das pessoas idosas residentes, atentando para as condições de saúde, fatores intrínsecos e extrínsecos que podem provocar uma queda. Para prevenir quedas, é essencial:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Conhecer o perfil das pessoas idosas residentes e os fatores de risco\n\n"
            "• Identificar fatores de risco significativos, como quedas prévias e polifarmácia.\n\n"
            "• Caracterizar episódios de quedas e realizar intervenções multidisciplinares para prevenir e controlar as consequências das quedas.\n\n"
            "• Incentivar a prática de exercícios físicos para melhorar a marcha e o equilíbrio.\n\n"
            "• Monitorar medicamentos e seus efeitos colaterais, que podem gerar ou potencializar sintomas que geram risco para quedas.\n\n"
            "• Garantir um ambiente físico seguro: pisos antiderrapantes, barras de apoio, iluminação adequada.\n\n"
            "• Elaborar e distribuir material educativo sobre a prevenção de quedas.\n\n"
            "• Assegurar comunicação eficaz entre a equipe sobre riscos de quedas.\n\n"
            "• Orientar as pessoas idosas sobre o uso de calçados e vestuário adequados\n\n"
            "• Avaliar a necessidade de dispositivos auxiliares para deambulação (ex.: andadores, muletas).\n\n"
            "• Reavaliar o risco de quedas após mudanças no ambiente, na rotina ou no quadro clínico.",
          ),
          Image.asset("assets/images/seguranca/Foto_dezeseis_segun.png"),
          const Text("Fonte: www.freepik.com"),
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
            "A aplicação de instrumentos de avaliação do risco de quedas em pessoas idosas nas ILPIs é realizada por profissionais de saúde, geralmente o(a) enfermeiro(a) ou o(a) fisioterapeuta, e pode ser repetida sempre que houver mudança no estado clínico da pessoa idosa residente, como após a introdução de novos medicamentos, após episódio de internação hospitalar ou após quedas. ",
          ),
          const SizedBox(height: 10),
          const Text(
            "A utilização destes instrumentos nas ILPIs possibilita identificar residentes em risco e implementar estratégias de prevenção, como adaptações no ambiente ou no cuidado direto. Segue abaixo dois exemplos de instrumentos utilizados para avaliar o risco de quedas em ILPIs.",
          ),
          Image.asset("assets/images/seguranca/Foto_dezessete_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 15),
          const Text(
            "• Time Get Up and Go – TUG",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "O Time Get Up and Go (TUG) é um teste clínico simples e amplamente utilizado para avaliar a mobilidade funcional, equilíbrio e risco de quedas em idosos. Ele é particularmente útil para identificar indivíduos que podem estar em risco de sofrer quedas devido a dificuldades de locomoção. O teste avalia a capacidade da pessoa idosa residente se levantar de uma cadeira sem apoio de braços, caminhar 3 metros, dar meia volta e sentar-se novamente. De acordo com o tempo para desempenhar esta tarefa é possível avaliar o risco de quedas."),
          const SizedBox(height: 10),
          const Text(
            "Entretanto, como limitação, tem-se que O TUG mede apenas aspectos físicos da mobilidade e não leva em conta fatores clínicos da pessoa idosa, que também podem impactar o risco de quedas.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Como funciona o teste TUG:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "1.	Início: A pessoa idosa começa sentado em uma cadeira com apoio para os braços.\n\n"
            "2.	Ação: Ao sinal do avaliador, a pessoa idosa deve levantar-se da cadeira, caminhar uma distância de 3 metros (aproximadamente 10 pés), girar, voltar para a cadeira e sentar-se novamente.\n\n"
            "3.	Tempo: O tempo necessário para completar a tarefa é cronometrado. O tempo total geralmente varia entre 8 a 12 segundos em pessoas saudáveis e com boa mobilidade.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Avaliação do teste TUG:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
          const Text(
              "Outra alternativa de instrumento para avaliar o risco de quedas é a Escala de Quedas de Morse (Morse Fall Scale - MFS), amplamente utilizada para avaliar o risco de quedas em idosos em diferentes ambientes, como hospitais e ILPIs. A escala é rápida e fácil de aplicar, baseada em uma série de fatores de risco que são comumente observados em pessoas idosas."),
          const SizedBox(height: 10),
          const Text(
            "Como funciona a Escala de Morse:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "A Escala de Morse avalia seis fatores que contribuem para o risco de queda. Cada fator recebe uma pontuação, que é somada para fornecer uma classificação de risco. Com base no escore final, o indivíduo é classificado em baixo, médio ou alto risco de queda:"),
          const SizedBox(height: 10),
          const Text(
            "• Baixo risco: 0-24 pontos\n"
            "• Risco moderado: 25-44 pontos\n"
            "• Alto risco: ≥ 45 pontos",
          ),
          const SizedBox(height: 10),
          const Text(
            "Escala de Morse para Avaliação do Risco de Quedas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/escala_morse.png"),
          const SizedBox(height: 10),
          const Text(
            "Exemplo de Estratégias Preventivas Baseadas na Pontuação dos Instrumentos:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "•	Baixo risco: Observação e ações educativas sobre prevenção de quedas.\n"
            "•  Médio risco: Supervisão e intervenções como o uso de calçados adequados e exercícios multicomponentes (treino de força, cardiorrespiratório, equilíbrio, flexibilidade).\n"
            "•  Alto risco: Supervisão constante, uso de dispositivos de proteção (como barras de apoio), revisão de medicações que possam aumentar o risco de quedas e rastreio de outros fatores que contribuem para o alto risco.",
          ),
          const SizedBox(height: 2),
          Image.asset("assets/images/seguranca/Foto_dezoito_segun.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }
}
