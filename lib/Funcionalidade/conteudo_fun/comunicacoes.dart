import 'package:flutter/material.dart';

class ComunicacoesScreen extends StatelessWidget {
  const ComunicacoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF3F7), // Fundo verde claro
      body: Column(
        children: [
          _buildAppBar(), // AppBar personalizada
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Funcionalidade global da pessoa idosa",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500, // Roboto Medium
                  color: Color(0xFF3E5C68), // Cor cinza escuro
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF3E5C68), // Linha cinza escura
              thickness: 1,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "COMUNICAÇÕES   ",
                style: TextStyle(
                  fontSize: 16, // Tamanho do título grande
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF3E5C68),
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
                  title: "COMUNICAÇÃO E FUNCIONALIDADE GLOBAL DA PESSOA IDOSA",
                  subtitle: "",
                  content: _buildMobilidadesContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title:
                      "ATIVIDADES PARA MELHORAR A COMUNICAÇÃO DA PESSOA IDOSA NAS ILPIs  ",
                  subtitle: "",
                  content: _buildAtividadesComunicacaoContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobilidadesContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Comunicação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "A comunicação é essencial para a capacidade da pessoa idosa de estabelecer "
            "relacionamentos produtivos, trocar informações, manifestar desejos, ideias e sentimentos. "
            "Ela envolve a interação verbal e não verbal e é fundamental para a autonomia, "
            "independência, bem-estar e qualidade de vida. A comunicação não se limita à fala, mas "
            "também inclui a compreensão e expressão de informações e emoções.\n"
            "No processo de envelhecimento, a comunicação pode ser prejudicada por diversos "
            "fatores, com impacto direto na interação social, na expressão de necessidades e na própria "
            "autonomia e independência da pessoa idosa. Por isso, qualquer comprometimento nessa "
            "área deve ser abordado de forma cuidadosa, para preservar a funcionalidade global da "
            "pessoa idosa.",
          ),
          const SizedBox(height: 8),
          const Text(
            "A comunicação tem relação direta com a mobilidade e o bem-estar geral. Uma pessoa "
            "idosa com dificuldades de comunicação pode ter mais dificuldade em expressar "
            "limitações físicas ou necessidades de ajuda, o que pode comprometer a mobilidade e "
            "aumentar o risco de quedas ou acidentes. Manter um bom nível de comunicação também "
            "é importante para a socialização e a participação ativa nas atividades de vida diária.",
          ),
          const SizedBox(height: 8),
          const Text(
            "A comunicação depende de três subsistemas funcionais principais:",
          ),
          const Text(
            "• Visão: Essencial para reconhecer sinais visuais e interpretar gestos.\n"
            "• Audição: Fundamental para compreender informações auditivas e interagir com o ambiente.\n"
            "• Produção/motricidade orofacial: Relacionada à fala, voz, mastigação e deglutição.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Manter estimular as habilidades comunicativas de pessoas idosas em ambientes "
            "institucionais é crucial para preservar suas capacidades cognitivas, emocionais, de "
            "mobilidade e sociais. Diversas intervenções podem ser realizadas para que as pessoas "
            "idosas institucionalizadas possam desenvolver a sua comunicação e melhorar sua "
            "interação social e qualidade de vida. Dentre estas intervenções, destacam-se:",
          ),
          const Text(
            "• Terapia fonoaudiológica: Pode ajudar a restaurar a audição, a fala e a deglutição, "
            "quando prejudicadas.\n"
            "• Estimulação cognitiva: Atividades que estimulem sobretudo a interação social, "
            "como jogos ou conversas em grupo, ajudam a preservar o senso de identidade e pertencimento.\n"
            "• Adaptação do ambiente: Reduzir ruídos, melhorar a iluminação e criar um espaço "
            "propício à comunicação é essencial para garantir uma interação adequada da pessoa idosa com o seu meio.",
          ),
          Image.asset("assets/images/funcionalidade/Foto33.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Aspectos importantes da comunicação na funcionalidade global da pessoa idosa",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            " Habilidades cognitivas e processamento de informação\n"
            "A comunicação eficaz depende do funcionamento cognitivo, incluindo memória, "
            "atenção e capacidade de processar informações. O envelhecimento, especialmente em "
            "condições como a demência, pode prejudicar essas habilidades e dificultar a "
            "compreensão e expressão de ideias. Preservar as habilidades cognitivas ajuda a manter "
            "a capacidade de comunicação, de interação social e a autonomia.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Linguagem verbal e não verbal\n"
            "A comunicação inclui tanto a linguagem verbal (fala) quanto a não verbal (gestos, "
            "expressões faciais, postura corporal). Quando a fala é prejudicada por problemas "
            "neurológicos ou físicos, a comunicação não verbal torna-se essencial. Cuidadores e "
            "profissionais de saúde devem estar atentos às expressões não verbais para entender "
            "melhor as necessidades da pessoa idosa.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Alterações no sistema sensorial\n"
            "A visão e a audição são fundamentais para uma comunicação eficaz e ambas tendem "
            "a se deteriorar com a idade. A perda auditiva, por exemplo, pode limitar a participação "
            "em conversas, levando a pessoa idosa ao isolamento social. Identificar e corrigir "
            "problemas sensoriais, como o uso de aparelhos auditivos, pode melhorar "
            "significativamente a interação social e qualidade de vida da pessoa idosa.",
          ),
          Image.asset("assets/images/funcionalidade/Foto40.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Impacto das Doenças Neurológicas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Doenças como o Acidente Vascular Cerebral (AVC) e a Doença de Alzheimer podem "
            "causar afasia, comprometendo a capacidade de formar ou entender palavras. "
            "Estratégias específicas de comunicação são necessárias para ajudar a pessoa idosa a "
            "se expressar e interagir, preservando sua autonomia e independência.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Importância da Comunicação para a Autonomia\n"
            "A comunicação é essencial para que a pessoa idosa expresse suas necessidades, "
            "preferências e tome decisões sobre seu cuidado. Quando prejudicada, a capacidade de "
            "autodeterminação é comprometida. Por isso, manter a capacidade de comunicação é "
            "essencial para preservar a autonomia e garantir que a pessoa idosa participe "
            "ativamente de sua vida.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Repercussões Psicológicas\n"
            "Dificuldades de comunicação podem gerar frustração, ansiedade e depressão. A "
            "pessoa idosa pode sentir-se incompreendida ou excluída, o que aumenta o risco de "
            "isolamento social. Neste contexto, atuar na preservação da comunicação é importante "
            "para evitar problemas emocionais que impactem negativamente a qualidade de vida "
            "da pessoa idosa.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Importância do Estímulo e Suporte\n"
            "Intervenções como terapia fonoaudiológica e ajustes no ambiente (como diminuir "
            "ruídos, falar mais devagar e de frente para a pessoa idosa) são essenciais para "
            "preservar ou restaurar as habilidades comunicativas. Incentivar a interação social "
            "contínua contribui para a manutenção da comunicação e o bem-estar emocional da "
            "pessoa idosa.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Uso de Auxiliares de Comunicação\n"
            "Em casos de comprometimento severo, o uso de tecnologias assistivas, como "
            "aparelhos auditivos ou quadros de comunicação com símbolos, pode facilitar a "
            "interação da pessoa idosa com o seu meio. Essas ferramentas garantem que a pessoa "
            "idosa continue a se comunicar e participar das decisões sobre sua vida e cuidados.",
          ),
          Image.asset("assets/images/funcionalidade/Foto35.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
        ],
      ),
    );
  }

  Widget _buildAtividadesComunicacaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Conversas Dirigidas em Grupo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Estimular a expressão verbal, promover interação social e fortalecer "
            "o vínculo entre os residentes.\n"
            "• Descrição: Reunir as pessoas idosas em pequenos grupos para discutir temas de "
            "interesse comum, como eventos atuais, memórias do passado ou histórias pessoais. "
            "O cuidador ou facilitador pode guiar a conversa com perguntas abertas, "
            "incentivando a expressão de opiniões e experiências.",
          ),
          const Text(
            "• Dica: Usar recursos visuais como fotos antigas ou jornais para estimular a memória e a conversa.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 8),
          Image.asset("assets/images/funcionalidade/Foto36.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Leitura em Voz Alta",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Promover a compreensão auditiva e manter a prática da linguagem verbal.\n"
            "• Descrição: O cuidador ou outra pessoa idosa voluntária lê em voz alta para o grupo. "
            "Escolher livros, poemas ou artigos de jornais adequados aos interesses e capacidade cognitiva do grupo. "
            "Após a leitura, fazer perguntas sobre o conteúdo para garantir a compreensão e gerar discussão.",
          ),
          const Text(
            "• Dica: Escolher histórias que despertem emoções ou memórias facilita a participação ativa na conversa.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 8),
          const Text(
            "Jogos de Perguntas e Respostas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Estimular o raciocínio verbal, a memória e a concentração.\n"
            "• Descrição: Organizar sessões de 'quiz' com temas variados como cultura geral, "
            "filmes antigos, músicas ou histórias do país. Os jogos podem ser competitivos ou colaborativos, "
            "dependendo da dinâmica do grupo.",
          ),
          const Text(
            "• Dica: Adaptar a complexidade das perguntas conforme as capacidades das pessoas idosas.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Image.asset("assets/images/funcionalidade/Foto37.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Teatro e Dramatização",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Incentivar a expressão verbal e não-verbal, desenvolvendo tanto a comunicação quanto a autoestima.\n"
            "• Descrição: Organizar pequenas encenações ou dramatizações baseadas em histórias simples ou memórias dos residentes. "
            "Cada pessoa idosa assume um papel e se expressa verbal e gestualmente.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Música e Canto em Grupo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Estimular a comunicação através da música, que ativa áreas diferentes do cérebro ligadas à linguagem.\n"
            "• Descrição: Realizar sessões de canto em grupo com músicas de sua época, religiosas ou populares. "
            "Podem ser usados instrumentos simples, como pandeiros, para estimular a coordenação motora.",
          ),
          const Text(
            "• Dica: Ao final, perguntar sobre o que as músicas lembram, promovendo a partilha de memórias.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Image.asset("assets/images/funcionalidade/Foto38.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Contação de Histórias Pessoais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Promover o resgate de memórias e dar espaço para a expressão individual.\n"
            "• Descrição: Reservar um momento para cada idoso contar uma história da vida, como infância ou viagens, "
            "incentivando perguntas e comentários dos outros participantes.",
          ),
          const Text(
            "• Dica: O cuidador pode preparar um ambiente acolhedor, com música suave ao fundo e iluminação confortável, criando um ambiente acolhedor para a partilha de histórias. ",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 8),
          const Text(
            "Jogos de Associação de Palavras",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Estimular a memória, o vocabulário e a criatividade.\n"
            "• Descrição: Apresentar uma palavra ou imagem e pedir que os participantes digam outras associadas a ela. "
            "Por exemplo, com a palavra 'verão', os participantes podem dizer 'praia', 'sol' ou 'calor'.",
          ),
          const Text(
            "• Dica: Este exercício é ótimo para melhorar a fluência verbal e manter a mente ativa de maneira divertida e colaborativa. ",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 8),
          const Text(
            "Interação Intergeracional",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Promover o diálogo e a troca de experiências entre gerações.\n"
            "• Descrição: Organizar visitas de grupos de jovens ou crianças às ILPIs para realizar atividades conjuntas, "
            "como jogos, conversas ou leitura. A interação é enriquecedora e estimulante para todos.",
          ),
          const Text(
            "• Dica: Preparar as duas partes para as interações, explicando a importância da paciência e escuta ativa. ",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 8),
          const Text(
            "Tecnologias de Comunicação Assistiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Facilitar a comunicação em pessoas idosas com dificuldades verbais ou motoras.\n"
            "• Descrição: Utilizar tablets ou quadros de comunicação com símbolos para expressar necessidades. "
            "Essa ferramenta é útil para pessoas com afasia ou dificuldades motoras.",
          ),
          Image.asset("assets/images/funcionalidade/Foto39.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Sessões de Terapia Fonoaudiológica",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Trabalhar a comunicação em pessoas idosas com deficiências de fala e linguagem.\n"
            "• Descrição: Realizar sessões com fonoaudiólogos para desenvolver exercícios de dicção, articulação, "
            "compreensão auditiva e expressão verbal.",
          ),
          const SizedBox(height: 8),
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
            color: Color(0xFF43604C),
          ),
        ),
        children: [content],
      ),
    );
  }
}
