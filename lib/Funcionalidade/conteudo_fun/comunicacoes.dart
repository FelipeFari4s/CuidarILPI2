import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class ComunicacoesScreen extends StatelessWidget {
  const ComunicacoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User currentUser = FirebaseAuth.instance.currentUser!;
    
    return Scaffold(
      backgroundColor: const Color(0xFFEBF3F7),
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
              "A comunicação é essencial para a capacidade da pessoa idosa de estabelecer relacionamentos produtivos, trocar informações, manifestar desejos, ideias e sentimentos. Ela envolve a interação verbal e não verbal e é fundamental para a autonomia, independência, bem-estar e qualidade de vida. A comunicação não se limita à fala, mas também inclui a compreensão e expressão de informações e emoções."),
          const SizedBox(height: 8),
          const Text(
              "No processo de envelhecimento, a comunicação pode ser prejudicada por diversos fatores, com impacto direto na interação social, na expressão de necessidades e na própria autonomia e independência da pessoa idosa. Por isso, qualquer comprometimento nessa área deve ser abordado de forma cuidadosa, para preservar a funcionalidade global da pessoa idosa."),
          const SizedBox(height: 8),
          const Text(
            "A comunicação tem relação direta com a mobilidade e o bem-estar geral. Uma pessoa idosa com dificuldades de comunicação pode ter mais dificuldade em expressar limitações físicas ou necessidades de ajuda, o que pode comprometer a mobilidade e aumentar o risco de quedas ou acidentes. Manter um bom nível de comunicação também é importante para a socialização e a participação ativa nas atividades de vida diária.",
          ),
          const SizedBox(height: 8),
          const Text(
            "A comunicação depende de três subsistemas funcionais principais:",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Visão: Essencial para reconhecer sinais visuais e interpretar gestos.\n"
            "• Audição: Fundamental para compreender informações auditivas e interagir com o ambiente.\n"
            "• Produção/motricidade orofacial: Relacionada à fala, voz, mastigação e deglutição.",
          ),
          const SizedBox(height: 8),
          const Text(
              "Manter estimular as habilidades comunicativas de pessoas idosas em ambientes institucionais é crucial para preservar suas capacidades cognitivas, emocionais, de mobilidade e sociais. Diversas intervenções podem ser realizadas para que as pessoas idosas institucionalizadas possam desenvolver a sua comunicação e melhorar sua interação social e qualidade de vida. Dentre estas intervenções, destacam-se:"),
          const Text(
            "• Terapia fonoaudiológica: Pode ajudar a restaurar a audição, a fala e a deglutição, "
            "quando prejudicadas.\n"
            "• Estimulação cognitiva: Atividades que estimulem sobretudo a interação social, "
            "como jogos ou conversas em grupo, ajudam a preservar o senso de identidade e pertencimento.\n"
            "• Adaptação do ambiente: Reduzir ruídos, melhorar a iluminação e criar um espaço "
            "propício à comunicação é essencial para garantir uma interação adequada da pessoa idosa com o seu meio.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto33.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Aspectos importantes da comunicação na funcionalidade global da pessoa idosa",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            " - Habilidades cognitivas e processamento de informação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "A comunicação eficaz depende do funcionamento cognitivo, incluindo memória, atenção e capacidade de processar informações. O envelhecimento, especialmente em condições como a demência, pode prejudicar essas habilidades e dificultar a compreensão e expressão de ideias. Preservar as habilidades cognitivas ajuda a manter a capacidade de comunicação, de interação social e a autonomia."),
          const SizedBox(height: 8),
          const Text(
            " - Linguagem verbal e não verbal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "A comunicação inclui tanto a linguagem verbal (fala) quanto a não verbal (gestos, expressões faciais, postura corporal). Quando a fala é prejudicada por problemas neurológicos ou físicos, a comunicação não verbal torna-se essencial. Cuidadores e profissionais de saúde devem estar atentos às expressões não verbais para entender melhor as necessidades da pessoa idosa. "),
          const SizedBox(height: 8),
          const Text(
            " - Alterações no sistema sensorial",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "A visão e a audição são fundamentais para uma comunicação eficaz e ambas tendem a se deteriorar com a idade. A perda auditiva, por exemplo, pode limitar a participação em conversas, levando a pessoa idosa ao isolamento social. Identificar e corrigir problemas sensoriais, como o uso de aparelhos auditivos, pode melhorar significativamente a interação social e qualidade de vida da pessoa idosa. "),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto40.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Impacto das Doenças Neurológicas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "Doenças como o Acidente Vascular Cerebral (AVC) e a Doença de Alzheimer podem causar afasia, comprometendo a capacidade de formar ou entender palavras. Estratégias específicas de comunicação são necessárias para ajudar a pessoa idosa a se expressar e interagir, preservando sua autonomia e independência. "),
          const SizedBox(height: 8),
          const Text(
            " - Importância da Comunicação para a Autonomia",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "A comunicação é essencial para que a pessoa idosa expresse suas necessidades, preferências e tome decisões sobre seu cuidado. Quando prejudicada, a capacidade de autodeterminação é comprometida. Por isso, manter a capacidade de comunicação é essencial para preservar a autonomia e garantir que a pessoa idosa participe ativamente de sua vida."),
          const SizedBox(height: 8),
          const Text(
            " - Repercussões Psicológicas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "Dificuldades de comunicação podem gerar frustração, ansiedade e depressão. A pessoa idosa pode sentir-se incompreendido ou excluído, o que aumenta o risco de isolamento social. Neste contexto, atuar na preservação da comunicação é importante para evitar problemas emocionais que impactem negativamente a qualidade de vida da pessoa idosa."),
          const SizedBox(height: 8),
          const Text(
            " - Importância do estímulo e suporte",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "Intervenções como terapia fonoaudiológica e ajustes no ambiente (como diminuir ruídos, falar mais devagar e de frente para a pessoa idosa) são essenciais para preservar ou restaurar as habilidades comunicativas. Incentivar a interação social contínua contribui para a manutenção da comunicação e o bem-estar emocional da pessoa idosa."),
          const SizedBox(height: 8),
          const Text(
            " -  Uso de Auxiliares de Comunicação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "Em casos de comprometimento severo, o uso de tecnologias assistivas, como aparelhos auditivos ou quadros de comunicação com símbolos, pode facilitar a interação da pessoa idosa com o seu meio. Essas ferramentas garantem que a pessoa idosa continue a se comunicar e participar das decisões sobre sua vida e cuidados."),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto35.png"),
          const Text("Fonte: www.freepik.com"),
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
              "•	Objetivo: Estimular a expressão verbal, promover interação social e fortalecer o vínculo entre os residentes."),
          const Text(
              "•	Descrição: Reunir as pessoas idosas em pequenos grupos para discutir temas de interesse comum, como eventos atuais, memórias do passado, ou histórias pessoais. O cuidador ou facilitador pode guiar a conversa com perguntas abertas, que incentivem a pessoa idosa a expressar suas opiniões e experiências."),
          const Text(
            "•	Dica: Usar recursos visuais como fotos antigas ou jornais para estimular a memória e a conversa.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto36.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Leitura em Voz Alta",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Objetivo: Promover a compreensão auditiva e manter a prática da linguagem verbal.\n"
              "•	Descrição: O cuidador ou outra pessoa idosa voluntária lê em voz alta para o grupo. Escolher livros, poemas ou artigos de jornais adequados aos interesses e capacidade cognitiva do grupo. Após a leitura, fazer perguntas sobre o conteúdo para garantir a compreensão e gerar discussão."),
          const Text(
            "•	Dica: Escolher histórias que despertem emoções ou memórias pode facilitar a participação ativa e envolvimento na conversa.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Jogos de Perguntas e Respostas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Objetivo: Estimular o raciocínio verbal, a memória e a concentração.\n"
              "•	Descrição: Organizar sessões de 'quiz' ou jogos de perguntas e respostas sobre temas variados, como cultura geral, filmes antigos, músicas, ou histórias do país. Os jogos podem ser competitivos ou colaborativos, dependendo da dinâmica do grupo."),
          const Text(
            "•	Dica: Adaptar a complexidade das perguntas conforme as capacidades das pessoas idosas. Incentive respostas completas, não apenas 'sim' ou 'não', para prolongar a fala.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto37.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Teatro e Dramatização",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Objetivo: Incentivar a expressão verbal e não-verbal, desenvolvendo tanto a comunicação quanto a autoestima.\n"
              "•	Descrição: Organizar pequenas encenações ou dramatizações de histórias simples ou baseadas em memórias dos próprios residentes. Cada pessoa idosa pode assumir um papel e usar a linguagem verbal e gestual para se expressar."),
          const Text(
            "•	Dica: Criar um ambiente descontraído e de apoio, para que os participantes sintam-se à vontade para expressar-se livremente.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Música e Canto em Grupo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Objetivo: Estimular a comunicação através da música, que ativa áreas diferentes do cérebro ligadas à linguagem.\n"
              "•	Descrição: Realizar sessões de canto em grupo, onde as pessoas idosas cantem músicas de sua época ou canções religiosas, folclóricas ou populares. A música pode ser acompanhada de instrumentos simples, como pandeiros, para estimular a coordenação motora e a interação."),
          const Text(
            "•	Dica: Ao final da atividade, perguntar às pessoas idosas sobre o que as músicas lhes lembraram, abrindo espaço para que compartilhem suas memórias e emoções.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto38.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Contação de Histórias Pessoais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Objetivo: Promover o resgate de memórias e dar espaço para a expressão individual.\n"
              "•	Descrição: Reservar um momento para que cada idoso possa contar uma história de sua vida, seja sobre a infância, família, viagens ou qualquer tema que o motive a falar. Incentivar os outros a fazer perguntas ou comentar sobre a história contada."),
          const Text(
            "•	Dica: O cuidador pode preparar um ambiente acolhedor, com música suave ao fundo e iluminação confortável, criando um ambiente acolhedor para a partilha de histórias. ",
          ),
          const SizedBox(height: 8),
          const Text(
            "Jogos de Associação de Palavras",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Objetivo: Estimular a memória, o vocabulário e a criatividade.\n"
              "•	Descrição: Apresentar uma palavra ou imagem e peça que as pessoas idosas participantes digam outras palavras associadas a ela. Por exemplo, se a palavra for 'verão', os participantes podem dizer 'praia', 'sol', 'calor', etc."),
          const Text(
            "•	Dica: Este exercício é ótimo para melhorar a fluência verbal e manter a mente ativa de maneira divertida e colaborativa.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Interação Intergeracional",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Objetivo: Promover o diálogo e a troca de experiências entre gerações, estimulando a comunicação verbal e social.\n"
              "•	Descrição: Organizar visitas de grupos de jovens ou crianças às ILPIs, onde possam realizar atividades conjuntas, como jogos, conversas ou leitura. A interação com pessoas de diferentes idades pode ser muito enriquecedora e estimulante para as pessoas idosas. "),
          const Text(
            "•	Dica: Preparar as duas partes para as interações, explicando a importância da paciência e escuta ativa.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Tecnologias de Comunicação Assistiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Facilitar a comunicação em pessoas idosas com dificuldades verbais ou motoras.\n"
            "•	Descrição: Utilizar tablets ou quadros de comunicação com símbolos e imagens, onde a pessoa idosa pode apontar para expressar suas necessidades e desejos. Esta ferramenta é útil para pessoas idosas com afasia ou dificuldades motoras que prejudicam a fala. "
            "•	Dica: Oferecer treinamento simples e suporte contínuo ao uso dessas tecnologias, garantindo que os residentes estejam confortáveis e confiantes em sua utilização",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto39.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Sessões de Terapia Fonoaudiológica",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "• Objetivo: Trabalhar a comunicação em pessoas idosas com deficiências de fala e linguagem.\n"
              "•	Descrição: Realizar sessões regulares com um(a) fonoaudiólogo(a), que pode desenvolver exercícios específicos para melhorar a dicção, articulação das palavras, compreensão auditiva e expressão verbal. Esses exercícios podem ser realizados de forma individual ou em pequenos grupos."),
          const Text(
            "•	Dica: Envolver os cuidadores e familiares, quando possível, nas orientações, para que eles possam ajudar na prática cotidiana desses exercícios.",
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
            color: Color(0xFF43604C),
          ),
        ),
        children: [content],
      ),
    );
  }
}
