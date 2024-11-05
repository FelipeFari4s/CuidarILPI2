import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class humorComportamentoScreen extends StatelessWidget {
  const humorComportamentoScreen({Key? key}) : super(key: key);

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
              "O humor da pessoa idosa desempenha um papel fundamental no envelhecimento ativo e saudável, com influência direta na capacidade de manter uma rotina ativa e o interesse em atividades cotidianas. Alterações no humor, como depressão e ansiedade, podem reduzir a motivação e, consequentemente, levar a pessoa idosa ao isolamento social e comprometer o seu autocuidado. "),
          const SizedBox(height: 8),
          const Text(
              "A motivação para realizar atividades diárias e participar de interações sociais é fundamental para preservar a funcionalidade e o bem-estar das pessoas idosas. Manter uma rotina ativa e socialmente engajada ajuda a prevenir o isolamento e a perda de autonomia."),
          const SizedBox(height: 16),
          const Text(
            "Principais fatores que afetam o humor:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Depressão: sentimento de tristeza, perda de interesse em atividades, cansaço e, em casos graves, ideias suicidas. A depressão pode ser confundida com o envelhecimento normal, mas é de extrema importância diferenciá-la, pois afeta negativamente a funcionalidade cognitiva da pessoa idosa."),
          const SizedBox(height: 8),
          const Text(
              "•	Ansiedade: preocupação excessiva, inquietação e sintomas físicos, como palpitações. A ansiedade pode impedir a pessoa idosa de enfrentar desafios, prejudicando sua autonomia. "),
          const SizedBox(height: 8),
          const Text(
            "•	Apatia: falta de energia ou interesse em atividades sociais e físicas, o que compromete o envolvimento em atividades de autocuidado ou lazer.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto16.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Comportamento",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "O comportamento reflete como a pessoa idosa responde às suas condições de saúde e à realidade ao seu redor. Alterações de comportamento podem surgir de doenças neurodegenerativas, problemas de saúde mental ou isolamento social, afetando diretamente a funcionalidade da pessoa idosa. "),
          const SizedBox(height: 16),
          const Text(
            "Principais comportamentos que afetam a funcionalidade:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Agressividade: verbal ou física, pode prejudicar o relacionamento da pessoa idosa com cuidadores e comprometer a adesão a tratamentos e cuidados.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Agitação e deambulação excessiva: comportamentos comuns em pessoas idosas com demência. Com esses comportamentos, a segurança da pessoa idosa fica comprometida, pois aumenta o risco de quedas e acidentes.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Comportamentos repetitivos: ações repetitivas e sem propósito, comuns em pessoas idosas com comprometimento cognitivo, podem interromper as rotinas diárias e prejudicar a funcionalidade.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Interações entre humor, comportamento e funcionalidade",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "Como as alterações de humor e comportamento afetam diretamente a funcionalidade global da pessoa idosa, as diversas condições advindas destas alterações podem impedir ou desmotivar a pessoa idosa a desempenhar ou colaborar nos cuidados com a sua saúde e com as atividades básicas de autocuidado, como higiene, alimentação e administração de medicamentos. "),
          const SizedBox(height: 16),
          const Text(
            " - Alguns impactos das alterações de humor e comportamento são recorrentes na vida das pessoas idosas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Socialização: a maioria das pessoas idosas com mudanças no humor e no comportamento entram em estado de isolamento, o que compromete a interação social e reduz a motivação para se manterem ativas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Adesão ao tratamento: a depressão ou a agressividade, por exemplo, podem dificultar a aceitação e continuidade de tratamentos e intervenções, o que prejudica a manutenção da saúde física e cognitiva da pessoa idosa.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Segurança: comportamentos desorganizados, como a agitação, deambulação excessiva ou até mesmo a agressividade, aumentam o risco de acidentes e comprometem a eficácia das intervenções de cuidado.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto17.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Intervenções para melhorar o humor e o comportamento",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "Melhorar o humor e o comportamento de pessoas idosas em Instituições de Longa Permanência (ILPIs) é fundamental para promover o bem-estar emocional e psicológico, e também para manter a funcionalidade e a qualidade de vida dos residentes.  "),
          const SizedBox(height: 8),
          const Text(
              "A implementação de intervenções psicossociais e o manejo adequado de condições psiquiátricas são essenciais para preservar a funcionalidade global da pessoa idosa."),
          const SizedBox(height: 16),
          const Text(
            " - Algumas intervenções recomendadas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Terapias psicossociais: terapia ocupacional, terapia cognitivo-comportamental e grupos de apoio ajudam a melhorar o humor e corrigir comportamentos inadequados das pessoas idosas institucionalizadas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Medicação: em casos de alterações de humor severas, antidepressivos ou ansiolíticos podem ser prescritos para amenizar e controlar os sintomas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Estímulo social: manter a pessoa idosa engajada em atividades sociais com outros residentes, cuidadores ou até mesmo familiares dentro da ILPI é fundamental para melhorar o humor e minimizar comportamentos desajustados.",
          ),
          const SizedBox(height: 16),
          const Text(
              "Essas intervenções, além de estimularem o humor, promovem a socialização, reduzem o isolamento e aumentam a sensação de pertencimento, criando um ambiente mais acolhedor e positivo para as pessoas idosas residentes nas ILPIs. "),
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
            "•	Objetivos: Reduzir o estresse, promover relaxamento e elevar o humor, por meio da sensação de realização criativa e expressão de sentimentos e emoções.",
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Descrição: Oferecer materiais diversos e estimule a participação e criatividade em oficinas de arte e/ou atividades manuais, adaptadas às habilidades de cada pessoa idosa. As atividades podem ser artesanato, bordado, desenho, pintura ou escultura, por exemplo. Tais atividades devem ser realizadas preferencialmente em grupos.  "),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Aproveitar as atividades em grupo para incentivar a interação social das pessoas idosas residentes.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto18.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Musicoterapia",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivos: Estimular emoções positivas, melhorar a memória e o humor e promover a socialização entre as pessoas idosas.",
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Descrição: Organizar momentos onde as pessoas idosas possam participar de atividades musicais, como cantar ou tocar instrumentos simples, ou simplesmente relaxar ao som de músicas suaves. A musicoterapia utiliza a música para promover o bem-estar emocional e aliviar ansiedade ou depressão. "),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Ao selecionar as músicas para as atividades, dar preferência para aquelas que sejam favoritas das pessoas idosas residentes. Assim, a adesão à atividade poderá ser mais satisfatória.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto19.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Atividades de Exercícios Físicos em Grupo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivos: Aumentar a disposição, elevar o humor, melhorar a saúde física e promover interações sociais.",
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Descrição: Oferecer momentos de atividade física adaptada à funcionalidade das pessoas idosas residentes, como caminhadas curtas, exercícios de alongamento, pilates, ioga ou dança. O exercício físico moderado ajuda a liberar endorfinas, que são neurotransmissores que promovem uma sensação de felicidade e bem-estar. "),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: A dança em particular pode ser muito eficaz, pois combina o movimento com a música, o que ajuda a elevar o humor ao mesmo tempo que proporciona diversão. Além disso, dar preferência para a realização das atividades ao ar livre, pois aumenta a sensação de bem-estar.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto20.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Jogos Cognitivos e Recreativos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivos: Estimular a mente, elevar o humor, melhorar a interação social e proporcionar momentos de descontração e diversão.",
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Como fazer: Organizar momentos interativos e divertidos com a utilização de jogos de tabuleiro, bingo, cartas ou quebra-cabeças em que as pessoas idosas possam jogar em grupo. Além de serem atividades recreativas, esses jogos estimulam a cognição e o humor e ajudam a aliviar sentimentos de depressão ou apatia. "),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Não esquecer de adaptar os jogos para contemplar as habilidades de cada pessoa idosa residente, para que as atividades não se tornem difíceis, cansativas ou entediantes.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto21.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Terapia com Animais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivos: Reduzir o estresse e a ansiedade, melhorar o humor e estimular a socialização.",
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Descrição: Promover visitas regulares de animais domésticos dóceis, ou se possível, manter animais residentes na ILPI para companhia das pessoas idosas. A interação com animais de estimação, como cães e gatos, pode trazer alegria e aliviar sentimentos de solidão ou ansiedade nas pessoas idosas residentes. A presença de animais é calmante e promove uma conexão emocional. "),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Para garantir a segurança das pessoas idosas residentes, recomenda-se que os animais sejam treinados para terapias.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto22.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Atividades ao Ar Livre e junto à Natureza",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivos: Reduzir o estresse, melhorar o humor e promover atividade física leve.",
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Descrição: Organizar atividades físicas ou caminhadas supervisionadas nos jardins da ILPI, criar hortas comunitárias onde as pessoas idosas possam plantar flores, ervas ou hortaliças, ou simplesmente promover momentos de relaxamento em áreas verdes. Atividades realizadas ao ar livre e junto à natureza têm um efeito relaxante e estimulante para as pessoas idosas."),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Cuidado com a exposição das pessoas idosas ao sol, recomenda-se os horários antes de 10hs e após as 16hs, quando os raios ultravioletas são menos intensos e a sensação térmica mais amena.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto23.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Relaxamento e Meditação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivos: Promover relaxamento, reduzir a ansiedade e melhorar o humor e o bem-estar emocional.",
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Descrição: Realizar sessões diárias ou semanais de meditação guiada, com música suave, luzes tranquilas e exercícios de respiração profunda. Atividades de relaxamento ou meditação guiada ajudam a reduzir a ansiedade e a melhorar o humor das pessoas idosas, proporcionando momentos de paz e tranquilidade. "),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Associar aromaterapia às atividades de relaxamento e meditação. Aromas de lavanda, camomila e hortelã, por exemplo, podem potencializar as atividades de relaxamento e trazer ainda mais bem-estar para as pessoas idosas residentes. ",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto24.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Grupos de conversa e apoio emocional",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "•	Objetivos: Fortalecer os laços sociais, promover o autocuidado emocional e proporcionar um espaço para a expressão de sentimentos.",
          ),
          const SizedBox(height: 3),
          const Text(
            "•	Descrição: Criar grupos de apoio, liderados por profissionais de saúde mental ou terapeutas capacitados, em que as pessoas idosas residentes possam compartilhar seus sentimentos e experiências em um ambiente acolhedor e seguro. Conversar em grupo sobre desafios emocionais e cotidianos pode ajudar as pessoas idosas a aliviar sentimentos de isolamento e tristeza, fortalecendo o apoio mútuo.",
          ),
          const SizedBox(height: 3),
          const Text(
            "•	Dica: Cuidar para que o ambiente onde estes grupos ocorrerão seja aconchegante e confortável, pois assim as pessoas idosas se sentirão mais bem acolhidas.",
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
