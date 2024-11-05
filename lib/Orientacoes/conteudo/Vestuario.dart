import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class VestuarioScreen extends StatelessWidget {
  const VestuarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User currentUser = FirebaseAuth.instance.currentUser!;
    
    return Scaffold(
      backgroundColor: const Color(0xFFCAE5D1),
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
                "VESTUÁRIO",
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
                      "VESTUÁRIO EM INSTITUIÇÕES DE LONGA PERMANÊNCIA PARA IDOSOS (ILPIS)",
                  subtitle:
                      "Bem-estar, qualidade de vida e desafios nas instituições de longa permanência para idosos (ILPIS)",
                  content: _buildVestuarioContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVestuarioContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "O vestuário da pessoa idosa desempenha um papel crucial não apenas para o conforto e segurança, mas também para a autoestima e dignidade. Considerando as limitações físicas e cognitivas que podem surgir com o envelhecimento, a escolha das roupas adequadas deve ser feita com atenção especial ao clima, à mobilidade e às preferências pessoais da pessoa idosa.",
          ),
          const SizedBox(height: 10),
          const Text(
            "O cuidado com o vestuário em ILPIs é essencial para garantir o conforto, a segurança e o bem-estar dos residentes. A escolha adequada das roupas vai além da estética, impactando diretamente na saúde física e emocional das pessoas idosas.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Aspectos importantes a serem considerados sobre o vestuário das pessoas idosas institucionalizadas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Prevenção de acidentes: roupas e calçados adequados ajudam a prevenir quedas e outras complicações, como lesões na pele."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Manutenção da higiene: o uso de roupas limpas e bem cuidadas é essencial para a dignidade e o bem-estar geral da pessoa idosa residente."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Controle da temperatura corporal: tecidos confortáveis e adequados ao clima contribuem para manter a temperatura corporal estável, prevenindo complicações associadas ao frio ou calor extremos."),
          const SizedBox(height: 10),
          const Text(
            "Importância do vestuário para a autoestima e dignidade",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "Respeitar as preferências de vestuário das pessoas idosas e garantir que suas roupas estejam limpas e em bom estado reforça o senso de dignidade e pertencimento. Em ambientes institucionais, esses cuidados simples podem contribuir para a qualidade de vida dos residentes, ajudando a preservar sua autonomia, independência, autoestima e bem-estar emocional, além de respeitar a individualidade de cada pessoa.",
          ),
          const SizedBox(height: 5),
          const Text(
            "Recomendações para melhorar os cuidados com o vestuário das pessoas idosas em ILPIs:",
          ),
          const SizedBox(height: 10),
          const Text(
            "Escolha de roupas confortáveis e adequadas:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
              "⦁ Tecidos confortáveis e respiráveis: opte por roupas feitas de tecidos macios, naturais e respiráveis, como algodão, que ajudam a manter a pele arejada, reduzindo o risco de alergias e irritações."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Tamanho correto: as roupas não devem ser apertadas ou muito soltas. Roupas ajustadas corretamente facilitam a movimentação e evitam quedas."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Facilidade para vestir: escolha peças que sejam fáceis de vestir e retirar, como calças de elástico e camisas com botões ou zíperes frontais, que ajudam na autonomia e evitam movimentos dolorosos."),
          const SizedBox(height: 10),
          const Text(
            "Segurança no vestuário e adaptação à mobilidade reduzida",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            "Calçados",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Evitar chinelos sem apoio no calcanhar: esses calçados podem enroscar em objetos pelo chão ou soltar dos pés e causar quedas."),
          const Text(
              "⦁ Sapatos adequados: o ideal são sapatos com solado de borracha antiderrapante, para evitar escorregões, e com elástico na parte superior, para facilitar o calçar e descalçar."),
          const SizedBox(height: 10),
          const Text(
            "Roupas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Facilidade de vestir: evitar roupas com botões, zíperes e presilhas, que podem ser difíceis de manusear. Dê preferência a roupas com abertura frontal, elástico na cintura e fechamento em velcro."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Conforto para cadeirantes: para pessoas idosas que permanecem por longos períodos em cadeiras de rodas ou poltronas, é essencial que as roupas sejam largas nos quadris e confortáveis. Deve-se tomar cuidado para que as roupas não fiquem dobradas ao sentar, evitando o surgimento de lesões por pressão."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Evitar roupas com muitos detalhes: botões pequenos, zíperes complexos ou cordões podem ser difíceis de manusear para pessoas idosas com limitações motoras ou problemas de coordenação."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Roupas com baixo risco de quedas: evite roupas compridas ou muito soltas, que podem se enroscar ou provocar acidentes. Prefira roupas com bainhas seguras e sem bordas que possam causar tropeços."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Roupas sem costuras grossas: As roupas devem ser confortáveis e sem costuras em áreas de maior pressão, como quadris e ombros, para evitar o surgimento de úlceras de pressão em idosos acamados ou com mobilidade limitada."),
          const SizedBox(height: 2),
          Image.asset("assets/images/orientacoes/Foto_vestuario.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 12),
          const Text(
            "Manutenção da Temperatura Corporal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
              "A capacidade da pessoa idosa de perceber ou expressar sensações de frio ou calor pode estar diminuída devido a doenças ou incapacidades. Por isso, o cuidador deve estar sempre atento às mudanças de temperatura e agir sem esperar que a pessoa idosa peça para vestir ou tirar agasalhos. Alguns aspectos são importantes a serem considerados:"),
          const SizedBox(height: 3),
          const Text(
              "⦁ Tecidos confortáveis e adequados ao clima: prefira roupas feitas de tecidos naturais, como o algodão, que são ventilados, confortáveis e apropriados tanto para o frio quanto para o calor."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Conforto e simplicidade: as roupas devem ser práticas, fáceis de vestir e de remover, sem complicações, para facilitar a troca."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Roupas adequadas ao clima: garanta que o vestuário da pessoa idosa seja compatível com a estação. No inverno, use peças que mantenham o calor, como blusas de manga longa, meias e mantas, e no verão, roupas leves para evitar superaquecimento."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Meias e gorros no frio: extremidades do corpo como pés e cabeça perdem calor rapidamente, então manter essas partes cobertas no frio é essencial."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_vestuario_dois.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 12),
          const Text(
            "Higiene e Troca de Roupas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Troca regular de roupas: a troca diária ou sempre que necessário é importante para manter a higiene, principalmente após atividades físicas, refeições ou no caso de incontinência."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Roupas fáceis de lavar e secar: prefira tecidos que sejam fáceis de lavar e de secagem rápida, facilitando a rotina das instituições e mantendo sempre um estoque de roupas limpas."),
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
