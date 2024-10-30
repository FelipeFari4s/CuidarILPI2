import 'package:flutter/material.dart';

class mobScreen extends StatelessWidget {
  const mobScreen({Key? key}) : super(key: key);

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
            "A mobilidade da pessoa idosa refere-se à capacidade individual de se movimentar e "
            "manipular o ambiente de maneira independente. É um componente fundamental da "
            "funcionalidade global e engloba aspectos físicos, psicológicos e sociais que garantem a "
            "independência da pessoa idosa em suas atividades de vida diária (AVDs). O declínio da "
            "mobilidade pode afetar gravemente a qualidade de vida e levar a pessoa idosa à "
            "dependência em suas diversas AVDs.",
          ),
          const SizedBox(height: 8),
          const Text(
            "A mobilidade depende de quatro subsistemas funcionais principais:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Capacidade aeróbia e muscular: envolve a captação e transporte de oxigênio pelos músculos, "
            "garantindo a resistência necessária para o movimento.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Alcance/preensão/pinça: refere-se ao uso dos membros superiores para manipular objetos e realizar tarefas manuais.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Marcha, postura e transferência: capacidade de se locomover, manter uma postura ereta e realizar transferências, como levantar-se de uma cadeira.",
          ),
          const SizedBox(height: 8),
          const Text(
            "• Continência esfincteriana: a incontinência pode interferir na mobilidade, restringindo a participação social e aumentando o risco de quedas.",
          ),
          Image.asset("assets/images/funcionalidade/Foto25.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Aspectos importantes da mobilidade e algumas intervenções para melhora ou manutenção em pessoas idosas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            " Força muscular: Exercícios regulares de fortalecimento ajudam a prevenir a sarcopenia e aumentam a independência.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Equilíbrio: Treinos de equilíbrio reduzem o risco de quedas e evitam a dependência.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Flexibilidade: Alongamentos, ioga ou pilates promovem mobilidade e previnem lesões.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Coordenação motora: Exercícios supervisionados preservam a independência.",
          ),
          const SizedBox(height: 8),
          const Text(
            " Locomoção e marcha: Fisioterapia e treinamento de marcha são essenciais para restaurar a mobilidade.",
          ),
          const Text(
            "O que fazer: Intervenções como fisioterapia e treinamento de marcha são essenciais para restaurar a mobilidade e prevenir a imobilidade. ",
          ),
          const SizedBox(height: 8),
          Image.asset("assets/images/funcionalidade/Foto26.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Repercussões sociais e psicológicas da mobilidade em pessoas idosas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Mobilidade e interação social: A boa mobilidade promove a participação em atividades sociais e evita o isolamento.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Mobilidade e atividades básicas de vida diária: Manter a mobilidade é essencial para a independência em atividades cotidianas.",
          ),
          const SizedBox(height: 8),
          const Text(
            "Mobilidade e saúde física e mental: A atividade física constante contribui para a saúde cardiovascular e melhora o humor.",
          ),
          const SizedBox(height: 16),
          const Text(
            "Fonte: www.freepik.com",
            style: TextStyle(fontStyle: FontStyle.italic),
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
            "• Objetivo: Manter ou melhorar a flexibilidade muscular e articular.\n"
            "• Descrição: Realizar alongamentos suaves de braços, pernas, pescoço e coluna, iniciando com movimentos lentos e ampliando gradualmente. "
            "Podem ser feitos em pé ou sentados. Previne a rigidez e reduz o risco de lesões.",
          ),
          const Text(
            "• Dica: Realizar ao ar livre ou preparar o ambiente para ser relaxante.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Image.asset("assets/images/funcionalidade/Foto27.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Caminhadas Supervisionadas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Melhorar a capacidade cardiovascular, equilíbrio e força muscular.\n"
            "• Descrição: Caminhadas curtas com supervisão. Iniciar com distâncias pequenas e aumentar gradativamente, usando andadores ou bengalas, se necessário.",
          ),
          const Text(
            "• Dica: Aumentar a frequência conforme a tolerância.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Image.asset("assets/images/funcionalidade/Foto28.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Exercícios de Fortalecimento Muscular",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Aumentar a força dos membros inferiores e superiores.\n"
            "• Descrição: Atividades como levantar-se e sentar-se de uma cadeira. Usar faixas elásticas ou pesos leves para braços e pernas.",
          ),
          const Text(
            "• Dica: Adaptar os exercícios para pessoas com restrições de mobilidade.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Image.asset("assets/images/funcionalidade/Foto29.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Treino de Equilíbrio",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Reduzir o risco de quedas e melhorar a estabilidade postural.\n"
            "• Descrição: Ficar em um pé só, caminhar em linha reta e usar plataformas de equilíbrio para aumentar a dificuldade.",
          ),
          const Text(
            "• Dica: Avaliar possíveis efeitos colaterais de medicamentos antes do treino.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Image.asset("assets/images/funcionalidade/Foto30.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Mobilização Passiva",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Manter a mobilidade articular em pessoas com severas limitações físicas.\n"
            "• Descrição: Movimentar suavemente articulações como joelhos e ombros, por 10 a 15 minutos diários.",
          ),
          const Text(
            "• Dica: Verificar sinais vitais antes da mobilização.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16),
          const Text(
            "Atividades Recreativas e Funcionais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Incentivar a movimentação por meio de atividades lúdicas.\n"
            "• Descrição: Atividades como passar a bola, boliche adaptado ou jardinagem, promovem movimento e socialização.",
          ),
          const Text(
            "• Dica: Realizar essas atividades em grupo e ao ar livre.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Image.asset("assets/images/funcionalidade/Foto32.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Exercícios de Marcha",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Melhorar a qualidade e segurança da marcha.\n"
            "• Descrição: Caminhar em diferentes superfícies e simular atividades cotidianas.",
          ),
          const Text(
            "• Dica: Garantir que o ambiente esteja seguro e supervisionado por profissionais.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16),
          const Text(
            "Exercícios de Respiração e Relaxamento",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Complementar a mobilidade com técnicas de relaxamento.\n"
            "• Descrição: Exercícios de respiração profunda e relaxamento após a atividade física.",
          ),
          const Text(
            "• Dica: Usar músicas suaves para promover bem-estar.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Image.asset("assets/images/funcionalidade/Foto31.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 3),
          const Text(
            "Treino de Transições e Movimentação Funcional",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "• Objetivo: Facilitar transições como deitar, sentar e levantar-se.\n"
            "• Descrição: Ensinar a levantar-se corretamente e fortalecer os músculos envolvidos nas transições.",
          ),
          const Text(
            "• Dica: Incentivar a realização das atividades de forma independente.",
            style: TextStyle(fontStyle: FontStyle.italic),
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
