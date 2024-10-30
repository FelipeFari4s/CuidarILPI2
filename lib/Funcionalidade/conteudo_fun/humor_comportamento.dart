import 'package:flutter/material.dart';

class humorComportamentoScreen extends StatelessWidget {
  const humorComportamentoScreen({Key? key}) : super(key: key);

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
                "HUMOR/COMPORTAMENTO   ",
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
                  title:
                      "HUMOR E COMPORTAMENTO NA FUNCIONALIDADE DA PESSOA IDOSA ",
                  subtitle: "",
                  content: _buildHumorComportamentoContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title:
                      "ATIVIDADES PARA MELHORAR O HUMOR E COMPORTAMENTO DA PESSOA IDOSA NAS ILPIs ",
                  subtitle: "",
                  content: _buildAtividadesContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHumorComportamentoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Humor",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "O humor da pessoa idosa desempenha um papel fundamental no envelhecimento ativo e saudável, "
            "com influência direta na capacidade de manter uma rotina ativa e o interesse em atividades cotidianas. "
            "Alterações no humor, como depressão e ansiedade, podem reduzir a motivação e levar ao isolamento social, "
            "comprometendo o autocuidado.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Manter uma rotina ativa e socialmente engajada é essencial para preservar a funcionalidade e o bem-estar. "
            "Isso ajuda a prevenir o isolamento e a perda de autonomia.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Principais fatores que afetam o humor:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Depressão: sentimento de tristeza, perda de interesse, cansaço e, em casos graves, ideias suicidas. "
            "A depressão pode ser confundida com o envelhecimento normal, mas é importante diferenciá-la, "
            "pois afeta a funcionalidade cognitiva.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Ansiedade: preocupação excessiva, inquietação e sintomas físicos, como palpitações. "
            "Pode impedir a pessoa idosa de enfrentar desafios e comprometer sua autonomia.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Apatia: falta de energia ou interesse em atividades, comprometendo o envolvimento em autocuidado e lazer.",
          ),
          Image.asset("assets/images/funcionalidade/Foto16.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Comportamento",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "O comportamento reflete como a pessoa idosa responde às suas condições de saúde e ao ambiente. "
            "Alterações comportamentais podem surgir de doenças neurodegenerativas, problemas de saúde mental ou isolamento, "
            "afetando diretamente a funcionalidade.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Principais comportamentos que afetam a funcionalidade:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Agressividade: pode prejudicar o relacionamento com cuidadores e comprometer a adesão aos cuidados.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Agitação e deambulação excessiva: comuns em pessoas com demência, aumentando o risco de quedas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Comportamentos repetitivos: comuns em pessoas com comprometimento cognitivo, podem interferir na rotina diária.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Interações entre humor, comportamento e funcionalidade",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Alterações no humor e comportamento afetam diretamente a funcionalidade global da pessoa idosa, "
            "comprometendo o autocuidado e a adesão aos tratamentos.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Impactos mais comuns:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Socialização: mudanças no humor e comportamento podem levar ao isolamento, prejudicando a interação social.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Adesão ao tratamento: depressão ou agressividade podem dificultar a continuidade de tratamentos.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Segurança: comportamentos desorganizados aumentam o risco de acidentes e comprometem o cuidado.",
          ),
          Image.asset("assets/images/funcionalidade/Foto17.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Intervenções para melhorar o humor e o comportamento",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Melhorar o humor e o comportamento de idosos em Instituições de Longa Permanência (ILPIs) é essencial "
            "para promover bem-estar e qualidade de vida. Intervenções psicossociais e manejo adequado de condições "
            "psiquiátricas ajudam a preservar a funcionalidade global.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Intervenções recomendadas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Terapias psicossociais: terapia ocupacional, cognitivo-comportamental e grupos de apoio.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Medicação: uso de antidepressivos ou ansiolíticos em casos severos.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Estímulo social: manter o engajamento em atividades sociais com residentes, cuidadores e familiares.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Essas intervenções promovem a socialização, reduzem o isolamento e aumentam a sensação de pertencimento, "
            "criando um ambiente mais acolhedor e positivo nas ILPIs.",
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildAtividadesContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Atividades com Artesanato e Trabalhos Manuais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivos: Reduzir o estresse, promover relaxamento e elevar o humor, por meio da sensação de realização criativa e expressão de sentimentos e emoções.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Oferecer materiais diversos e estimular a participação e criatividade em oficinas de arte e/ou atividades manuais, "
            "adaptadas às habilidades de cada pessoa idosa. As atividades podem ser artesanato, bordado, desenho, pintura ou escultura, por exemplo. "
            "Tais atividades devem ser realizadas preferencialmente em grupos.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Aproveitar as atividades em grupo para incentivar a interação social das pessoas idosas residentes.",
          ),
          Image.asset("assets/images/funcionalidade/Foto18.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Musicoterapia",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivos: Estimular emoções positivas, melhorar a memória e o humor e promover a socialização entre as pessoas idosas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Organizar momentos onde as pessoas idosas possam participar de atividades musicais, como cantar ou tocar instrumentos simples, ou simplesmente relaxar ao som de músicas suaves. "
            "A musicoterapia utiliza a música para promover o bem-estar emocional e aliviar ansiedade ou depressão.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Ao selecionar as músicas para as atividades, dar preferência para aquelas que sejam favoritas das pessoas idosas residentes.",
          ),
          Image.asset("assets/images/funcionalidade/Foto19.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Atividades de Exercícios Físicos em Grupo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivos: Aumentar a disposição, elevar o humor, melhorar a saúde física e promover interações sociais.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Oferecer momentos de atividade física adaptada à funcionalidade das pessoas idosas residentes, como caminhadas curtas, exercícios de alongamento, pilates, ioga ou dança. "
            "O exercício físico moderado ajuda a liberar endorfinas, que são neurotransmissores que promovem uma sensação de felicidade e bem-estar.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: A dança em particular pode ser muito eficaz, pois combina o movimento com a música, o que ajuda a elevar o humor ao mesmo tempo que proporciona diversão.",
          ),
          Image.asset("assets/images/funcionalidade/Foto20.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Jogos Cognitivos e Recreativos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivos: Estimular a mente, elevar o humor, melhorar a interação social e proporcionar momentos de descontração e diversão.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Como fazer: Organizar momentos interativos e divertidos com a utilização de jogos de tabuleiro, bingo, cartas ou quebra-cabeças em que as pessoas idosas possam jogar em grupo. "
            "Além de serem atividades recreativas, esses jogos estimulam a cognição e o humor e ajudam a aliviar sentimentos de depressão ou apatia.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Não esquecer de adaptar os jogos para contemplar as habilidades de cada pessoa idosa residente, para que as atividades não se tornem difíceis, cansativas ou entediantes.",
          ),
          Image.asset("assets/images/funcionalidade/Foto21.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Terapia com Animais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivos: Reduzir o estresse e a ansiedade, melhorar o humor e estimular a socialização.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Promover visitas regulares de animais domésticos dóceis, ou se possível, manter animais residentes na ILPI para companhia das pessoas idosas. "
            "A interação com animais de estimação, como cães e gatos, pode trazer alegria e aliviar sentimentos de solidão ou ansiedade nas pessoas idosas residentes.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Para garantir a segurança das pessoas idosas residentes, recomenda-se que os animais sejam treinados para terapias.",
          ),
          Image.asset("assets/images/funcionalidade/Foto22.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Atividades ao Ar Livre e junto à Natureza",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivos: Reduzir o estresse, melhorar o humor e promover atividade física leve.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Organizar passeios supervisionados em áreas verdes, realizar atividades físicas leves como caminhadas curtas ou criar uma horta comunitária. "
            "As atividades ao ar livre têm um efeito relaxante e estimulante, contribuindo para a saúde e bem-estar emocional das pessoas idosas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Se a atividade for realizada ao ar livre, escolha horários antes das 10h ou após as 16h, para evitar exposição excessiva ao sol.",
          ),
          Image.asset("assets/images/funcionalidade/Foto23.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Relaxamento e Meditação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivos: Promover relaxamento, reduzir o estresse e melhorar o bem-estar emocional.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Realizar sessões de meditação guiada, com apoio de música suave e exercícios de respiração para relaxar a mente e o corpo. "
            "As atividades de relaxamento contribuem para a melhoria da saúde mental e emocional das pessoas idosas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Oferecer essas atividades em um ambiente tranquilo, onde os idosos se sintam confortáveis.",
          ),
          Image.asset("assets/images/funcionalidade/Foto24.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Grupos de conversa e apoio emocional",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "Objetivos: Fortalecer os laços sociais, promover o autocuidado emocional e proporcionar um espaço para a expressão de sentimentos. ",
          ),
          const SizedBox(height: 3),
          const Text(
            "Descrição: Criar grupos de apoio, liderados por profissionais de saúde mental ou terapeutas capacitados, em que as pessoas idosas residentes possam compartilhar seus sentimentos e experiências em um ambiente acolhedor e seguro. Conversar em grupo sobre desafios emocionais e cotidianos pode ajudar as pessoas idosas a aliviar sentimentos de isolamento e tristeza, fortalecendo o apoio mútuo. l",
          ),
          const SizedBox(height: 3),
          const Text(
            "Dica: Cuidar para que o ambiente onde estes grupos ocorrerão seja aconchegante e confortável, pois assim as pessoas idosas se sentirão mais bem acolhidas.",
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
