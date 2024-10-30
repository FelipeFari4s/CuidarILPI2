import 'package:flutter/material.dart';

class SonoScreen extends StatelessWidget {
  const SonoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE5D1), // Fundo verde claro
      body: Column(
        children: [
          _buildAppBar(), // AppBar personalizada
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Orientações para atividades básicas de vida diárias",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500, // Roboto Medium
                  color: Color(0xFF707070), // Cor cinza escuro
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF707070), // Linha cinza escura
              thickness: 1,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sono",
                style: TextStyle(
                  fontSize: 20, // Tamanho do título grande
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF43604C), // Verde escuro
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
                      "A IMPORTÂNCIA DO SONO NA SAÚDE DAS PESSOAS IDOSAS INSTITUCIONALIZADAS",
                  subtitle:
                      "Bem-estar, qualidade de vida e desafios nas instituições de longa permanência para idosos (ILPIS)",
                  content: _buildSonoDetalhes(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title:
                      "DICAS PARA MELHORAR O SONO DAS PESSOAS IDOSAS EM ILPIS ",
                  subtitle: "Detalhes sobre gestão de qualidade.",
                  content: _buildSonoQualidade(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSonoDetalhes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Importância do Sono na Saúde da Pessoa Idosa",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            "O sono desempenha um papel fundamental na saúde e bem-estar das pessoas idosas. Com o envelhecimento, é comum ocorrerem mudanças no padrão de sono, mas em Instituições de Longa Permanência para Idosos (ILPIs), esses problemas podem ser agravados por diversos fatores, como:",
            style: TextStyle(fontSize: 16),
          ),
          const Text("⦁ Mudanças no ambiente;"),
          const Text("⦁ Problemas de saúde;"),
          const Text("⦁ Rotinas inadequadas."),
          const SizedBox(height: 10),
          const Text(
            "O cuidado com a qualidade do sono deve ser uma prioridade, pois impacta diretamente na saúde física, emocional e mental, promovendo uma vida mais equilibrada e saudável.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
          const Text(
            "Impacto do Sono na Saúde da Pessoa Idosa",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            "O sono é essencial para a recuperação física, a manutenção da memória e a regulação do humor. Em pessoas idosas, a privação de sono ou a baixa qualidade do sono pode resultar em problemas cognitivos, irritabilidade, risco aumentado de quedas e piora de condições crônicas, como hipertensão e diabetes. Por isso, cuidar do sono da pessoa idosa não é apenas uma questão de conforto, mas de saúde integral.",
            style: TextStyle(fontSize: 16),
          ),
          const Text(
              "Um sono adequado pode proporcionar diversos benefícios, como:"),
          const Text(
              "⦁ Melhora na saúde física: contribui para a regeneração celular e o fortalecimento do sistema imunológico."),
          const Text(
              "⦁ Saúde emocional equilibrada: reduz o risco de depressão e ansiedade."),
          const Text(
              "⦁ Atenção e memória: o descanso adequado favorece a função cognitiva e a memória."),
          const SizedBox(height: 10),
          const Text(
            "Garantir um sono de qualidade para as pessoas idosas é uma parte vital do cuidado em ILPIs. Ao aplicar as práticas adequadas e observar os sinais de alerta, os cuidadores podem ajudar a melhorar o bem-estar e a qualidade de vida das pessoas idosas.",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_sono.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 20),
          const Text(
            "Principais Alterações do Sono na Pessoa Idosa",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
              "As pessoas idosas costumam ter mudanças nos padrões de sono, incluindo:"),
          const Text(
              "⦁ Redução do tempo total de sono: muitas pessoas idosas dormem menos horas durante a noite."),
          const Text(
              "⦁ Fragmentação do sono: o sono noturno pode ser interrompido por vários despertares."),
          const Text(
              "⦁ Sonolência diurna: pode ocorrer cansaço excessivo durante o dia, levando a cochilos prolongados."),
          const Text(
              "⦁ Inversão do ciclo sono-vigília: algumas pessoas idosas têm dificuldades para dormir à noite e acabam ficando mais ativos durante a madrugada."),
          const SizedBox(height: 10),
          const Text(
            "Essas alterações podem ser causadas por fatores como dores crônicas, efeitos colaterais de medicamentos, distúrbios de saúde mental (como ansiedade e depressão) e condições médicas, como apneia do sono e demências.",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_sono_dois.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }

  Widget _buildSonoQualidade() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recomendações para um Sono de Qualidade",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            "O sono de qualidade é essencial para o bem-estar das pessoas idosas. Com práticas simples, os cuidadores podem contribuir para que os residentes durmam melhor e tenham mais disposição e saúde ao longo do dia. Seguem algumas recomendações:",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            "Estabelecer uma rotina consistente de sono",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Mantenha horários regulares: dormir e acordar nos mesmos horários diariamente, inclusive aos fins de semana, ajuda o corpo a reconhecer quando é hora de descansar."),
          const SizedBox(height: 10),
          const Text(
            "Ambiente de sono agradável",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ O quarto deve ser um espaço tranquilo, escuro e silencioso."),
          const Text(
              "⦁ Reduza ruídos e controle a temperatura para torná-lo confortável."),
          const Text(
              "⦁ Exponha a pessoa idosa à luz natural pela manhã para ajudar a regular o ciclo sono-vigília."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_sono_tres.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 20),
          const Text(
            "Reduzir cochilos durante o dia",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Evite cochilos longos ou frequentes, especialmente no final da tarde. Eles podem interferir no sono noturno e deixar a pessoa idosa mais desperto à noite."),
          const SizedBox(height: 10),
          const Text(
            "Estimular a atividade física",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Caminhadas leves ou alongamentos ao ar livre durante o dia ajudam a melhorar o sono."),
          const Text("⦁ Evite atividades físicas perto da hora de dormir."),
          const SizedBox(height: 10),
          const Text(
            "Cuidado com alimentação e hidratação",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text("⦁ Evite refeições pesadas perto da hora de dormir."),
          const Text(
              "⦁ Limite a ingestão de cafeína e bebidas gaseificadas à noite."),
          const Text(
              "⦁ Reduza a ingestão de líquidos antes de dormir para evitar idas ao banheiro durante a noite."),
          const SizedBox(height: 10),
          const Text(
            "Promover relaxamento antes de dormir",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Incentive atividades relaxantes antes de deitar, como leitura, ouvir música suave ou fazer exercícios de respiração."),
          const Text(
              "⦁ Uma rotina relaxante ajuda a preparar a mente para o sono."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_sono_quatro.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 20),
          const Text(
            "Monitorar os efeitos dos medicamentos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Alguns medicamentos podem causar insônia ou sonolência diurna excessiva. Fique atento e consulte a equipe de saúde para ajustes, se necessário."),
          const SizedBox(height: 10),
          const Text(
            "Gerenciar problemas de saúde relacionados ao sono",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Problemas como apneia do sono, ansiedade, depressão ou dores crônicas afetam diretamente a qualidade do sono. Tratar essas condições adequadamente é essencial para melhorar o descanso."),
          const SizedBox(height: 10),
          const Text(
            "Evitar estímulos noturnos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Minimize atividades que possam gerar agitação ou ansiedade antes de dormir. Um ambiente calmo e sereno é crucial para facilitar o relaxamento."),
          const SizedBox(height: 10),
          const Text(
            "Limitar o uso de tecnologias à noite",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Reduza o uso de celulares, tablets e televisores à noite. A luz azul emitida por esses dispositivos interfere na produção de melatonina, dificultando o adormecimento."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_sono_cinco.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 20),
          const Text(
            "Atenção às Necessidades Individuais",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ Cada pessoa idosa tem suas particularidades, por isso é importante que os cuidadores estejam atentos às suas necessidades e comportamentos relacionados ao sono. Personalizar os cuidados pode fazer toda a diferença na qualidade de vida dos residentes."),
          const SizedBox(height: 10),
          const Text(
            "Monitorar Sinais de Distúrbios no Sono",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Text(
              "⦁ É importante ficar atento aos sinais de que a pessoa idosa não está dormindo bem, como: cansaço excessivo durante o dia, irritabilidade ou mudanças de humor, confusão mental e dificuldade em realizar tarefas diárias."),
          const Text(
              "⦁ Se esses sinais forem observados, a equipe de saúde da ILPI deve ser acionada para realizar uma avaliação detalhada e, se necessário, uma intervenção."),
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
