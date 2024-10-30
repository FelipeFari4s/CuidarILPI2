import 'package:flutter/material.dart';

class coagScreen extends StatelessWidget {
  const coagScreen({Key? key}) : super(key: key);

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
                "COGNIÇÃO  ",
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
                  title: "COGNIÇÃO E A FUNCIONALIDADE GLOBAL ",
                  subtitle: "",
                  content: _buildCognicaoIdosoContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title: "MANUTENÇÃO E ESTIMULAÇÃO DA COGNIÇÃO EM ILPIs ",
                  subtitle: "",
                  content: _buildPreservacaoCognicaoContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title:
                      "ATIVIDADES PARA ESTIMULAR A COGNIÇÃO DA PESSOA IDOSA NAS ILPIs  ",
                  subtitle: "",
                  content: _buildAtividadesCognitivasContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCognicaoIdosoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "O conceito de cognição, em relação à funcionalidade global da pessoa idosa, refere-se às "
            "funções mentais que permitem à pessoa idosa compreender e resolver adequadamente os "
            "problemas do cotidiano, ou seja, interagir com o ambiente de forma eficaz e realizar "
            "atividades do dia a dia com autonomia.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Principais aspectos da cognição em relação à funcionalidade global:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Memória:\n"
            "A memória é uma das funções cognitivas mais afetadas no processo de envelhecimento. "
            "Ela é fundamental para o desempenho de atividades diárias e está relacionada à capacidade "
            "de reter, armazenar e recuperar informações. Declínios na memória, especialmente a memória "
            "de curto prazo e a memória operacional, podem comprometer a habilidade de realizar tarefas "
            "básicas, como lembrar de tomar medicamentos ou gerenciar finanças.",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Atenção:\n"
            "O envelhecimento pode impactar a capacidade de manter a atenção e de se concentrar em "
            "tarefas por longos períodos. A dificuldade em ignorar distrações pode prejudicar a execução "
            "de atividades que exigem foco, como cozinhar ou atravessar a rua com segurança.",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Funções executivas:\n"
            "Relacionadas ao planejamento, organização, resolução de problemas e tomada de decisões, "
            "as funções executivas são cruciais para a autonomia. Um declínio nessas funções pode afetar a "
            "capacidade de tomar decisões em situações cotidianas, como gerir finanças ou lidar com riscos.",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Linguagem:\n"
            "A capacidade de entender e se expressar verbalmente é uma função cognitiva essencial. "
            "Alterações na linguagem, como dificuldade em encontrar palavras ou compreender instruções, "
            "podem prejudicar a comunicação e a interação social, afetando a qualidade de vida.",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Orientação espacial e temporal:\n"
            "Problemas de orientação em relação ao espaço e tempo podem comprometer a segurança "
            "e a capacidade de organização da rotina diária, impactando diretamente a funcionalidade.",
          ),
          Image.asset("assets/images/funcionalidade/Foto5.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Cognição e perda de autonomia:",
          ),
          const SizedBox(height: 10),
          const Text(
            "A perda da funcionalidade cognitiva está fortemente associada ao risco de dependência e "
            "institucionalização de pessoas idosas. A demência, caracterizada pelo declínio progressivo das "
            "capacidades cognitivas, impede a realização de atividades básicas e instrumentais da vida diária.",
          ),
          const SizedBox(height: 10),
          const Text(
            "A demência é uma doença de causa desconhecida que provoca a morte rápida de células do cérebro. "
            "Essa condição resulta na perda de memória, confusão, comportamentos estranhos e mudanças "
            "na personalidade, dificultando a realização de tarefas simples.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Embora não haja cura, o tratamento pode aliviar sintomas. Com a progressão da doença, "
            "os sinais e sintomas se tornam mais marcantes e incapacitantes.",
          ),
          Image.asset("assets/images/funcionalidade/Foto6.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "A pessoa idosa com demência pode apresentar os seguintes sinais e sintomas:",
          ),
          const SizedBox(height: 10),
          const Text(
            "• Falha na memória: Lembrança clara de fatos antigos, mas esquecimento do que acabou de ocorrer.\n"
            "• Desorientação: Dificuldade em se situar no tempo e espaço, perdendo-se em locais conhecidos.\n"
            "• Dificuldade em falar: Esquece nomes de objetos e os descreve por sua função.\n"
            "• Repetição: Reitera as mesmas coisas por não registrar fatos novos na memória.\n"
            "• Alterações de humor e comportamento: Choro, ansiedade, depressão, agressividade e comportamentos repetitivos.\n"
            "• Dificuldade de compreensão: A interação social é prejudicada pela dificuldade de entender o que é dito.\n"
            "• Dificuldade nas atividades diárias: Problemas para realizar tarefas domésticas e manter a higiene pessoal.\n"
            "• Comportamento inadequado: Desrespeito às normas sociais, como sair de pijama ou andar despido.\n"
            "• Esconder ou perder objetos: E acusar outros de tê-los roubado.\n"
            "• Alucinações: Ver imagens e ouvir sons inexistentes.",
          ),
        ],
      ),
    );
  }

  Widget _buildPreservacaoCognicaoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A preservação da cognição é vital para garantir que as pessoas idosas mantenham sua "
            "funcionalidade e autonomia pelo maior tempo possível. A implementação de atividades "
            "cognitivas nas Instituições de Longa Permanência para Idosos (ILPIs), adaptadas às "
            "necessidades e capacidades individuais, é uma forma eficaz de melhorar a qualidade de "
            "vida e promover um envelhecimento ativo e saudável.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Importância da cognição ativa",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Manter a cognição ativa é essencial para preservar a funcionalidade global da pessoa "
            "idosa. Estímulos cognitivos regulares, atividades sociais, desafios mentais e o controle "
            "de doenças crônicas, como hipertensão e diabetes, são fatores importantes que podem "
            "retardar o declínio cognitivo e proteger a autonomia funcional.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Estimulação cognitiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "A estimulação cognitiva é uma intervenção essencial para manter e até melhorar as "
            "funções cognitivas das pessoas idosas, auxiliando na preservação da autonomia e da "
            "qualidade de vida. Quando aplicada regularmente, tem o potencial de retardar os impactos "
            "do envelhecimento sobre as habilidades cognitivas, promovendo um envelhecimento mais "
            "ativo e saudável.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Atividades cognitivas nas ILPIs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Nas ILPIs, as atividades de estimulação cognitiva devem ser adaptadas às capacidades "
            "individuais de cada residente. Ao considerar as limitações físicas e cognitivas, é possível "
            "desenvolver atividades que estimulem o cérebro de forma saudável, sem sobrecarregar os "
            "residentes, mantendo-os engajados de maneira prazerosa.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Essas atividades ajudam a preservar as capacidades cognitivas, minimizando o impacto do "
            "envelhecimento e promovendo uma melhor qualidade de vida para os residentes. Além disso, "
            "trazem benefícios em outros aspectos da vida das pessoas institucionalizadas, como:",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Aumento da autoestima.\n"
            "• Melhora nas interações sociais.\n"
            "• Redução da sensação de isolamento.",
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/funcionalidade/Foto7.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }

  Widget _buildAtividadesCognitivasContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Jogo da Memória",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Estimular a memória de curto e longo prazo, além de melhorar a concentração e atenção.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Utilize o “jogo da memória”, onde os idosos precisam associar pares de cartas "
            "com imagens semelhantes. Alternativas incluem palavras ou números. Outra opção é contar "
            "uma história curta e pedir para a pessoa idosa relatar os detalhes lembrados.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Adaptar o nível de dificuldade conforme a capacidade dos participantes, aumentando o número de cartas ou a complexidade das histórias.",
          ),
          Image.asset("assets/images/funcionalidade/Foto8.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Clube da Leitura",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Estimular a memória, compreensão, atenção, linguagem e interação social.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Leitura de livros, revistas ou notícias em grupo, seguida de conversas e debates sobre o conteúdo lido.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Escolher temas de interesse, como histórias de vida, fatos históricos ou atualidades.",
          ),
          Image.asset("assets/images/funcionalidade/Foto9.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 8),
          const Text(
            "Atividades de Cálculos Simples",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Manter e estimular o raciocínio lógico-matemático.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Propor exercícios simples, como somas ou subtrações, ou resolver problemas práticos, como calcular o troco.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Usar elementos visuais, como fichas, para facilitar a compreensão de participantes com dificuldades.",
          ),
          Image.asset("assets/images/funcionalidade/Foto10.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 8),
          const Text(
            "Jogos de Palavras e Categorização",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Trabalhar o vocabulário, fluência verbal e memória semântica.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Atividades como palavras cruzadas ou caça-palavras, ou formação de listas de palavras em categorias específicas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Aumentar gradualmente a dificuldade conforme a capacidade dos participantes.",
          ),
          Image.asset("assets/images/funcionalidade/Foto11.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Atividades Manuais com Estimulação Cognitiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Estimular coordenação motora, memória, atenção e planejamento.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Realizar atividades como pintura, bordado ou modelagem, envolvendo conversas sobre suas escolhas e histórias associadas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Oferecer diferentes opções e permitir que os idosos escolham suas atividades favoritas.",
          ),
          Image.asset("assets/images/funcionalidade/Foto12.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Música e Memorização de Canções",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Estimular memória afetiva e semântica, além de promover bem-estar emocional.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Escolher canções populares para cantar juntos, ativando memórias associadas às músicas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Pedir que os idosos tentem lembrar letras antigas ou associem músicas com momentos da vida.",
          ),
          Image.asset("assets/images/funcionalidade/Foto13.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Estímulo à Orientação Temporal e Espacial",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Promover a orientação no tempo e no espaço.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Incentivar a identificação de datas e eventos atuais, além do reconhecimento dos cômodos da instituição.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Usar calendários grandes e painéis visuais para reforçar a orientação.",
          ),
          const Text(
            "Recordação de Memórias Autobiográficas – Baú de Memórias",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Estimular a memória de longo prazo, melhorar autoestima e reforçar identidade pessoal.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Usar objetos, fotos e filmes para reviver memórias importantes e compartilhar histórias.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Criar um ambiente acolhedor e seguro para as lembranças e promover atividades temáticas.",
          ),
          Image.asset("assets/images/funcionalidade/Foto14.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Atividades de Socialização em Grupo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Objetivo: Melhorar habilidades sociais e promover interação.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Descrição: Participação em jogos de tabuleiro, dinâmicas de grupo ou atividades recreativas, como bingo.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Dica: Garantir que as atividades sejam inclusivas e adaptadas às capacidades dos participantes.",
          ),
          Image.asset("assets/images/funcionalidade/Foto15.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
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
}
