import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class coagScreen extends StatelessWidget {
  const coagScreen({Key? key}) : super(key: key);

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
              "O conceito de cognição, em relação à funcionalidade global da pessoa idosa, refere-se às funções mentais que permitem à pessoa idosa compreender e resolver adequadamente os problemas do cotidiano, ou seja, interagir com o ambiente de forma eficaz e realizar atividades do dia a dia com autonomia. "),
          const SizedBox(height: 10),
          const Text(
            "Principais aspectos da cognição em relação à funcionalidade global:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              " - Memória: A memória é uma das funções cognitivas mais afetadas no processo de envelhecimento. Ela é fundamental para o desempenho de atividades diárias e está relacionada à capacidade de reter, armazenar e recuperar informações. Declínios na memória, especialmente a memória de curto prazo e a memória operacional, podem comprometer a habilidade de realizar tarefas básicas, como lembrar de tomar medicamentos ou realizar tarefas instrumentais, como gerenciar finanças.\n"),
          const SizedBox(height: 10),
          const Text(
              " - Atenção: O envelhecimento pode impactar a capacidade de manter a atenção e de se concentrar em tarefas por longos períodos. A perda da atenção seletiva, ou a dificuldade em se concentrar em uma atividade enquanto ignora distrações, pode prejudicar a funcionalidade global da pessoa idosa, dificultando a execução de atividades que exigem foco, como cozinhar ou atravessar a rua com segurança.\n"),
          const SizedBox(height: 10),
          const Text(
              " - Funções executivas: Relacionadas ao planejamento, organização, resolução de problemas e tomada de decisões, as funções executivas são cruciais para a autonomia. Um declínio nas funções executivas pode comprometer a capacidade da pessoa idosa de tomar decisões adequadas em situações cotidianas, como a gestão de finanças e a escolha de comportamentos adequados frente a situações de risco.\n"),
          const SizedBox(height: 10),
          const Text(
              "  - Linguagem: A capacidade de entender e expressar-se verbalmente também é uma função cognitiva relevante. Alterações na linguagem, como dificuldades em encontrar palavras ou em compreender instruções, podem dificultar a comunicação e a interação social, o que pode impactar negativamente a qualidade de vida e a autonomia da pessoa idosa.\n"),
          const SizedBox(height: 10),
          const Text(
              " - Orientação espacial e temporal: Problemas na orientação em relação ao espaço (saber onde está) e ao tempo (lembrar-se de datas e horários) podem comprometer a segurança e a capacidade da pessoa idosa de se locomover e organizar sua rotina diária, afetando diretamente sua funcionalidade.\n"),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto5.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Cognição e perda de autonomia",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "A perda da funcionalidade cognitiva está fortemente associada ao risco de dependência e institucionalização de pessoas idosas. A demência, uma condição caracterizada pelo declínio progressivo das capacidades cognitivas, afeta a funcionalidade global, impedindo a pessoa idosa de desempenhar tanto atividades básicas da vida diária quanto atividades instrumentais da vida diária. "),
          const SizedBox(height: 10),
          const Text(
              "A demência é uma doença de causa desconhecida, caracterizada pela morte rápida de muitas células do cérebro. A pessoa com demência vai perdendo a capacidade e as habilidades de fazer coisas simples. A demência provoca perda de memória, confusão, comportamentos estranhos e mudanças na personalidade. "),
          const SizedBox(height: 10),
          const Text(
              "Ainda não existe cura para a demência, no entanto há tratamento que alivia os sinais e sintomas da doença. No entanto, à medida que a doença progride, esses sinais e os sintomas se tornam mais marcantes e incapacitantes."),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto6.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "A pessoa idosa com demência pode apresentar os seguintes sinais e sintomas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            " - Falha na memória: a pessoa se lembra perfeitamente de fatos ocorridos há muitos anos, mas esquece o que acabou de acontecer.\n\n"
            " - Desorientação: dificuldade de se situar quanto à hora, dia e local e perde-se em lugares conhecidos.\n\n"
            " - Dificuldade em falar ou esquece o nome das coisas: para superar essa falha, tenta descrever o objeto pela sua função, como por exemplo ao não conseguir dizer caneta, diz: “Aquele negócio que escreve”. \n\n"
            " - Dificuldade em registrar na memória fatos novos: por isso repete as mesmas coisas várias vezes.\n\n"
            " - Alterações de humor e de comportamento: choro, ansiedade, depressão, fica facilmente zangada, chateada ou agressiva, desinibição sexual, repetição de movimentos, como abrir e fechar gavetas várias vezes.\n\n"
            " - Dificuldade de compreensão: a interação com outras pessoas fica comprometida, pois tem dificuldade de compreender o que lhe dizem.\n\n"
            " - Dificuldade em realizar atividades diárias: principalmente em executar tarefas domésticas e fazer sua higiene pessoal.\n\n"
            " - Comportar-se de maneira inadequada: foge às regras sociais, como sair vestido de pijama, andar despido, etc.\n\n"
            " - Esconder ou perder coisas: e depois acusar as pessoas de tê-las roubado.\n\n"
            " - Ter alucinações: ver imagens, ouvir vozes e ruídos que não existem.",
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
              "A preservação da cognição é vital para garantir que as pessoas idosas mantenham sua funcionalidade e autonomia pelo maior tempo possível. A implementação de atividades cognitivas nas Instituições de Longa Permanência para Idosos (ILPIs), adaptadas às necessidades e capacidades individuais, é uma forma eficaz de melhorar a qualidade de vida e promover um envelhecimento ativo e saudável."),
          const SizedBox(height: 10),
          const Text(
            "Importância da cognição ativa",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "Manter a cognição ativa é essencial para preservar a funcionalidade global da pessoa idosa. Estímulos cognitivos regulares, atividades sociais, desafios mentais, e o controle de doenças crônicas como hipertensão e diabetes são fatores importantes que podem retardar o declínio cognitivo e, consequentemente, proteger a autonomia funcional da pessoa idosa. "),
          const SizedBox(height: 10),
          const Text(
            "Estimulação cognitiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "A estimulação cognitiva é uma intervenção fundamental para manter e até melhorar as funções cognitivas das pessoas idosas, auxiliando na preservação da autonomia e da qualidade de vida. Essa prática, quando aplicada regularmente, tem o potencial de retardar os impactos do envelhecimento sobre as habilidades cognitivas, promovendo um envelhecimento mais ativo e saudável."),
          const SizedBox(height: 10),
          const Text(
            "Atividades cognitivas nas ILPIs",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
              "Em ILPIs, as atividades de estimulação cognitiva podem e devem ser adaptadas às capacidades individuais de cada residente. Ao considerar as limitações físicas e cognitivas das pessoas idosas, é possível desenvolver atividades que estimulem o cérebro sem sobrecarregar os residentes, mantendo-os engajados de forma saudável e prazerosa."),
          const SizedBox(height: 10),
          const Text(
              "Essas atividades de estimulação ajudam a manter as capacidades cognitivas das pessoas idosas, minimizando o impacto natural do envelhecimento sobre a funcionalidade e promovendo uma melhor qualidade de vida para os residentes das ILPIs. Além de estimular a mente, essas atividades têm efeitos positivos em outros aspectos da vida das idosas institucionalizadas, como:"),
          const SizedBox(height: 8),
          const Text(
            "• Aumento da autoestima.\n"
            "• Melhora nas interações sociais.\n"
            "• Redução da sensação de isolamento.",
          ),
          const SizedBox(height: 6),
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
            "•	Objetivo: Estimular a memória de curto e longo prazo, além de melhorar a concentração e atenção.",
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Descrição: Utilize o “jogo da memória”, em que as pessoas idosas precisam associar pares de cartas com imagens semelhantes. Também pode ser feita uma variação com palavras ou números. Outra alternativa é contar uma história curta e, em seguida, pedir que a pessoa idosa relate os detalhes que conseguir lembrar. "),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Adaptar o nível de dificuldade conforme a capacidade das pessoas idosas participantes, aumentando o número de cartas ou complexidade das histórias.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto8.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            " Atividades de leitura e interpretação – Clube da leitura",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Estimular a memória, a compreensão, a atenção, a linguagem e a interação social.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Descrição: Leitura de trechos de livros, revistas ou notícias em grupo, seguida de uma conversa sobre o conteúdo lido. A ideia é promover debates, perguntas ou reflexões sobre o texto. ",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Escolher temas de interesse dos idosos, como histórias de vida, fatos históricos ou atualidades.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto9.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
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
            "•	Descrição: Propor exercícios de cálculos simples, como somas, subtrações e multiplicações, ou resolver pequenos problemas matemáticos práticos, como contar o troco ou calcular quantos dias faltam para uma data comemorativa. Isso ajuda a manter as funções executivas, como planejamento e resolução de problemas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Estas atividades podem ser realizadas individualmente ou em grupo e também podem ser realizadas oralmente ou por meio de materiais impressos com os exercícios. Para pessoas idosas com maior dificuldade, usar elementos visuais (como fichas ou objetos) para facilitar o entendimento.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto10.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Jogos de Palavras e Categorização",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Trabalhar o vocabulário, fluência verbal e memória semântica (memória dos significados).",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Descrição: Jogos como palavras cruzadas, caça-palavras ou até a formação de listas de palavras em categorias específicas (ex: animais, frutas, objetos de cozinha, carros, etc) ajudam a estimular a linguagem e a organização mental.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Incentivar o uso de palavras simples e ir ampliando o desafio conforme a capacidade da pessoa idosa.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto11.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Atividades Manuais com Estimulação Cognitiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Estimular a coordenação motora, memória, atenção e planejamento.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Descrição: Realizar atividades manuais, como pintura, bordado, montagens com blocos, modelagem de argila ou criação de objetos simples, enquanto se envolve a pessoa idosa em conversas sobre o que ele está fazendo, quais são as cores que está usando, o porquê de suas escolhas, quais as histórias advindas com aquelas atividades. Isso ajuda a estimular tanto a criatividade quanto a tomada de decisões.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Deixar que as pessoas idosas escolham as atividades manuais que mais gostam, oferecendo um leque de opções e desafios diferentes.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto12.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            " Música e memorização de letras de canções",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Estimular a memória afetiva e semântica (memória dos significados), além de proporcionar interação social e bem-estar emocional.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Descrição: Escolher canções populares ou que tenham sido importantes para a geração das pessoas idosas participantes. Cantar juntos pode ajudar a ativar memórias associadas às músicas, além de ser uma atividade prazerosa que incentiva a interação social.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Pedir às pessoas idosas que tentem lembrar letras de músicas antigas ou associar músicas com eventos da sua vida.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto13.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Estímulo à Orientação Temporal e Espacial",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Promover a orientação no tempo e no espaço",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Descrição: Criar atividades diárias que incentivem as pessoas idosas a recordar e identificar a data, o dia da semana, o mês e até a estação do ano. Pode-se também incentivar a conversa sobre eventos atuais ou históricos importantes. Outra ideia é mapear o ambiente em que vivem, pedindo que eles reconheçam os cômodos da instituição e suas finalidades.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Utilizar calendários grandes e painéis visuais com o dia, mês e ano visíveis.",
          ),
          const Text(
            "Recordação de Memórias Autobiográficas – Baú de Memórias",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Estimular a memória de longo prazo, melhorar a autoestima, trabalhar o reconhecimento de eventos passados e a identidade pessoal.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Descrição: Utilizar um “baú” com objetos, fotos, músicas, filmes ou outros materiais que remetam a épocas anteriores da vida das pessoas idosas (casamento, nascimento dos filhos, profissão, viagens), incentivando a discussão e compartilhamento de memórias. Também é possível criar um “livro da vida” em que cada pessoa idosa relata suas memórias. ",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Usar temas que tenham sido marcantes para a geração das pessoas idosas e promover um ambiente seguro e acolhedor para as lembranças. Vale destacar que essa técnica é particularmente eficaz para pessoas idosas com demência inicial, pois ajuda a reforçar a autoestima e o senso de identidade.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto14.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Atividades de Socialização em Grupo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Melhorar as habilidades sociais, linguagem e interação social.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Descrição: Participação em jogos de tabuleiro em grupo, dinâmicas em que as pessoas idosas trocam experiências ou criam histórias em conjunto, ou até mesmo atividades recreativas como bingo. Estimular a socialização é essencial para evitar o isolamento e manter o cérebro ativo em interações.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Dica: Garantir que as atividades sejam inclusivas e adequadas às capacidades cognitivas e físicas de todos os participantes.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto15.png"),
          const Text("Fonte: www.freepik.com"),
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
