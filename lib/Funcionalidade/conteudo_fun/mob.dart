import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class mobScreen extends StatelessWidget {
  const mobScreen({Key? key}) : super(key: key);

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
                "MOBILIDADE   ",
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
                  title: "MOBILIDADE E FUNCIONALIDADE GLOBAL DA PESSOA IDOSA ",
                  subtitle: "",
                  content: _buildMobilidadeContent(),
                ),
                const SizedBox(height: 10),
                _buildExpansionTile(
                  title:
                      "ATIVIDADES PARA ESTIMULAR A MOBILIDADE DA PESSOA IDOSA NAS ILPIs ",
                  subtitle: "",
                  content: _buildMobilidadesContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobilidadeContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mobilidade",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "A mobilidade da pessoa idosa refere-se à capacidade individual de se movimentar e manipular o ambiente de maneira independente. É um componente fundamental da funcionalidade global e engloba aspectos físicos, psicológicos e sociais que garantem a independência da pessoa idosa em suas atividades de vida diária (AVDs). O declínio da mobilidade pode afetar gravemente a qualidade de vida e levar a pessoa idosa à dependência em suas diversas AVDs."),
          const SizedBox(height: 8),
          const Text(
            "A mobilidade depende de quatro subsistemas funcionais principais:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Capacidade aeróbia e muscular: envolve a captação e transporte de oxigênio pelos músculos, garantindo a resistência necessária para o movimento. "),
          const SizedBox(height: 8),
          const Text(
            "•	Alcance/preensão/pinça: refere-se ao uso dos membros superiores para manipular objetos e realizar tarefas manuais.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Marcha, postura e transferência: capacidade de se locomover, manter uma postura ereta e realizar transferências, como levantar-se de uma cadeira.",
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Continência esfincteriana: a incontinência pode interferir na mobilidade, restringindo a participação social e aumentando o risco de quedas.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto25.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Aspectos importantes da mobilidade e algumas intervenções para melhora ou manutenção em pessoas idosas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "A manutenção ou restauração da mobilidade em pessoas idosas é essencial para promover a independência e a qualidade de vida, especialmente em Instituições de Longa Permanência (ILPIs). Programas de reabilitação adaptados às necessidades individuais ajudam a reduzir o impacto das doenças crônicas e do envelhecimento em aspectos importantes da mobilidade.",
          ),
          const SizedBox(height: 8),
          const Text(
            "- Força muscular",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "  A força muscular é essencial para realizar diversas atividades, como caminhar, levantar-se e subir escadas. O envelhecimento causa uma perda gradual de massa e força muscular, afetando a mobilidade da pessoa idosa.",
          ),
          const SizedBox(height: 8),
          const Text(
            "  •	O que fazer: Exercícios regulares de fortalecimento muscular ajudam a prevenir a perda de massa muscular (sarcopenia) e a fragilidade e, consequentemente, aumentam a independência da pessoa idosa.",
          ),
          const SizedBox(height: 8),
          const Text(
            "-  Equilíbrio",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "  Capacidade de manter a postura e a estabilidade durante o movimento ou em repouso. O envelhecimento causa um declínio no equilíbrio, o que aumenta o risco de quedas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "  •	O que fazer: Treinos de equilíbrio reduzem o risco de quedas, uma das principais causas de declínio funcional e, consequentemente, dependência entre pessoas idosas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "-  Flexibilidade",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "  Refere-se à amplitude de movimento das articulações e músculos. A perda de flexibilidade dificulta atividades simples, como vestir-se ou pegar objetos.",
          ),
          const SizedBox(height: 8),
          const Text(
            "  •	O que fazer: Alongamentos regulares, ioga ou pilates promovem a mobilidade funcional e previnem lesões em pessoas idosas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "-  Coordenação motora",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "  Habilidade de mover diferentes partes do corpo de forma eficiente. A perda de coordenação motora compromete a realização de AVDs.",
          ),
          const SizedBox(height: 8),
          const Text(
            "  •	O que fazer: Exercícios que melhorem a coordenação motora, como caminhada supervisionada com obstáculos ou atividade com massa de modelar, ajudam a preservar a independência da pessoa idosa.",
          ),
          const SizedBox(height: 8),
          const Text(
            "-  Locomoção e marcha",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "  Refere-se à capacidade de caminhar de forma estável e segura. A marcha pode ser prejudicada por problemas neurológicos e perda de força muscular.",
          ),
          const SizedBox(height: 8),
          const Text(
            "  •	O que fazer: Intervenções como fisioterapia e treinamento de marcha são essenciais para restaurar a mobilidade e prevenir a imobilidade.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto26.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Repercussões sociais e psicológicas da mobilidade em pessoas idosas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Mobilidade e interação social",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            " A mobilidade também afeta o bem-estar emocional e social. As pessoas idosas com boa mobilidade são mais propensas a participar de atividades sociais e interagir com outras pessoas. Assim, a manutenção da mobilidade previne o isolamento social e contribui para a saúde mental e emocional das pessoas idosas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Mobilidade e atividades básicas de vida diária",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Refere-se à capacidade de realizar atividades básicas de vida como caminhar, sentar-se, levantar-se, usar o banheiro, vestir-se e alimentar-se. O declínio na mobilidade afeta diretamente a independência da pessoa idosa para estas atividades. Manter a mobilidade funcional é essencial para que a pessoa idosa consiga realizar as suas atividades de vida diária com independência ou com o mínimo de dependência.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Mobilidade e saúde física e mental",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "A mobilidade influencia a saúde física, uma vez que a pessoa idosa em constante movimento tem repercussões positivas no controle do peso, manutenção da saúde cardiovascular e redução do risco de doenças crônicas. Além dos benefícios físicos, a mobilidade afeta positivamente o humor e previne sentimento de frustração e depressão decorrentes da imobilidade.",
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
            "Exercícios de Alongamento",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "•	Objetivo: Manter ou melhorar a flexibilidade muscular e articular.\n"
              "•	Descrição: Realizar alongamentos suaves de braços, pernas, pescoço e coluna. Iniciar com movimentos lentos e gradualmente aumentar a amplitude. Podem ser feitos tanto em pé quanto sentados, dependendo da capacidade da pessoa idosa. Esta atividade previne a rigidez muscular e articular, facilita a movimentação e reduz o risco de lesões."),
          const Text(
            "•	Dica: Se possível, realizar o alongamento ao ar livre na ILPI ou preparar o ambiente de forma que seja aconchegante e relaxante para as pessoas idosas residentes.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto27.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Caminhadas Supervisionadas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Melhorar a capacidade cardiovascular, equilíbrio e força muscular.\n"
            "• Descrição: Caminhadas curtas nos corredores da ILPI ou ao ar livre, sempre com supervisão, especialmente para as pessoas idosas com risco de quedas. Iniciar com distâncias curtas e aumentar gradativamente. Usar andadores ou bengalas, se necessário. Esta atividade estimula a circulação sanguínea, melhora a marcha e a confiança na locomoção.",
          ),
          const Text(
            "•	Dica: Iniciar a caminhada com frequência semanal reduzida e ir aumentando de acordo com a tolerância da pessoa idosa.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto28.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Exercícios de Fortalecimento Muscular",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Aumentar a força dos membros inferiores e superiores, essenciais para atividades de vida diária, como levantar-se ou caminhar.\n"
            "•	Descrição: Exercícios simples, como levantar-se e sentar-se de uma cadeira, repetidamente. Utilizar faixas elásticas para resistência ou pesos leves (0,5 a 1 kg) nos braços e pernas. Flexão de joelhos, elevação de pernas e abdução de quadris enquanto sentado. Estas atividades são essenciais para melhorar a capacidade de levantar-se de cadeiras, subir escadas e realizar outras atividades que requerem força nas pernas e braços.",
          ),
          const Text(
            "•	Dica: Adaptar os exercícios de acordo com a capacidade de mobilidade das pessoas idosas, inclusive para aquelas que possuem restrições de movimentos, como acamados e cadeirantes. ",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto29.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Treino de Equilíbrio",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Reduzir o risco de quedas e melhorar a estabilidade postural.\n"
            "•	Descrição: Exercícios como ficar em um pé só, apoiado em uma cadeira ou parede. Caminhar em linha reta para melhorar a coordenação. Usar almofadas instáveis ou plataformas de equilíbrio, para avançados. Estes exercícios ajudam a melhorar a coordenação motora e a percepção do próprio corpo no espaço, com consequente prevenção de quedas nos ambientes da ILPI.",
          ),
          const Text(
            "•	Dica: Avaliar, anteriormente ao treino de equilíbrio, possíveis efeitos colaterais de medicamentos que favoreçam o risco de quedas, para evitar acidentes. ",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto30.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Mobilização Passiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Manter a mobilidade articular em pessoas idosas com severas limitações físicas, como aquelas que permanecem acamadas ou restritas à cadeira de rodas.\n"
            "•	Descrição: Mover suavemente as articulações da pessoa idosa (cotovelos, joelhos, tornozelos, ombros) em diferentes direções. Realizar pelo menos 10 a 15 minutos diariamente. Deve ser feito com cuidado, evitando dor ou desconforto. Estas mobilizações ajudam a manter a amplitude de movimento das articulações e previne contraturas.",
          ),
          const Text(
            "•	Dica: Verificar os sinais vitais da pessoa idosa antes de iniciar a mobilização passiva.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Atividades Recreativas e Funcionais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Incentivar a movimentação por meio de atividades divertidas e cotidianas.\n"
            "•	Descrição: Realizar atividades com estratégicas lúdicas, como passar a bola, lançar argolas ou boliche adaptado, que envolvem movimentos dos braços e pernas. Dança em cadeira ou atividades em grupo com música, com incentivo ao movimento rítmico. Outras atividades cotidianas das pessoas idosas residentes na ILPI, como jardinagem (se possível), dobrar roupas, varrer área externa ou outras tarefas funcionais que envolvam movimentação e que possam ser adaptadas para as pessoas idosas. Estas atividades estimula o movimento de forma divertida, melhora a socialização e promove bem-estar emocional.",
          ),
          const Text(
            "•	Dica: Sempre que possível, realizar estas atividades lúdicas em grupo e ao ar livre.",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto32.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Exercícios de Marcha",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Melhorar a qualidade e segurança da marcha.\n"
            "•	Descrição: Estimular a pessoa idosa a caminhar em superfícies com diferentes texturas (tapetes, pisos lisos, grama) para treinar o controle da marcha. Incentivar mudanças de direção e marcha lateral (andar de lado) para aumentar a versatilidade. Simular atividades cotidianas, como andar e carregar objetos leves. Estes tipos de exercícios melhoram a confiança ao caminhar e reduz a insegurança em superfícies diferentes, prevenindo quedas.",
          ),
          const Text(
            "•	Dica: Garantir para que o ambiente esteja seguro e adaptado para a prática destes exercícios e, de preferência, que as pessoas idosas sejam acompanhadas por profissionais capacitados, como fisioterapeuta ou educador físico.  ",
          ),
          const SizedBox(height: 16),
          const Text(
            "Exercícios de Respiração e Relaxamento",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Complementar a mobilidade com técnicas que promovam relaxamento e controle respiratório.\n"
            "•	Descrição: Orientar a pessoa idosa em exercícios de respiração profunda e relaxamento muscular após sessões de atividade física. Incentivar a respiração consciente (inspirar pelo nariz, expirar pela boca) enquanto faz alongamentos. Estes momentos reduzem a tensão muscular, melhora a capacidade respiratória e facilita a recuperação pós-exercício.",
          ),
          const Text(
            "•	Dica: Conciliar os exercícios de respiração e relaxamento com músicas instrumentais suaves para proporcionar ainda mais sensação de bem-estar às pessoas idosas",
          ),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto31.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Treino de Transições e Movimentação Funcional",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "•	Objetivo: Facilitar as transições cotidianas, como deitar, sentar e levantar-se de forma segura.\n"
            "•	Descrição: Ensinar a pessoa idosa a se levantar corretamente da cama ou cadeira com suporte. Simular o ato de sentar e levantar repetidamente para fortalecer os músculos envolvidos nessas transições. Este treino aumenta a independência nas atividades de vida diária, bem como previne quedas e lesões causadas por movimentação inadequada.",
          ),
          const Text(
            "•	Dica:  Sempre que possível, incentivar as pessoas idosas a realizarem suas atividades de vida diária de forma independente e, mesmo aquelas que precisam de auxílio, fazer o mínimo de interferência possível nas atividades diárias.",
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
