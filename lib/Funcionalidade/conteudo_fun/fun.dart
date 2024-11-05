import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class funorientacoesScreen extends StatelessWidget {
  const funorientacoesScreen({Key? key}) : super(key: key);

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
                "Funcionalidade ",
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
                  title: "Funcionalidade global da pessoa idosa  ",
                  subtitle: "",
                  content: _buildFuncionalidadeIdosoContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFuncionalidadeIdosoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "Refere-se à capacidade que a pessoa idosa tem de realizar de forma independente e eficaz as Atividades da Vida Diária (AVDs), mantendo sua autonomia e qualidade de vida. Esse conceito abrange não apenas aspectos físicos, mas também cognitivos, emocionais e sociais, compondo uma visão integral do envelhecimento. "),
          const SizedBox(height: 10),
          const Text(
              "A funcionalidade global da pessoa idosa deve ser vista como o principal indicador de saúde na população idosa, pois, é por meio da manutenção das capacidades funcionais da pessoa idosa que se pode promover um envelhecimento saudável. "),
          const SizedBox(height: 10),
          const Text(
              "Assim, dentro do conceito de funcionalidade, há de se considerar os quatro sistemas funcionais fundamentais para que a pessoa idosa tenha garantida a sua plena capacidade funcional. São eles: "),
          const SizedBox(height: 10),
          const Text(
            "• Cognição;\n"
            "• Humor/Comportamento;\n"
            "• Mobilidade;\n"
            "• Comunicação.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Capacidade funcional:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "Refere-se à capacidade de uma pessoa idosa realizar as AVDs de forma autônoma e independente. Isso envolve tanto as atividades básicas (como comer, vestir-se, tomar banho etc) quanto as instrumentais (como utilizar o telefone, preparar refeições, gerenciar medicamentos etc)."),
          const SizedBox(height: 10),
          const Text(
            "Autonomia:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "É a capacidade individual da pessoa idosa de decisão, de comandar suas próprias ações e de seguir suas próprias convicções. A autonomia está relacionada com o adequado funcionamento da cognição e do humor/comportamento da pessoa idosa. "),
          const SizedBox(height: 10),
          const Text(
            "Independência:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "Refere-se ao sentido de a pessoa idosa conseguir realizar suas atividades por seus próprios meios, considerando sua capacidade física e mental. A independência está diretamente relacionada à preservação da mobilidade e da comunicação da pessoa idosa."),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto1.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Atividades da Vida Diária (AVDs):",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "Referem-se às tarefas básicas de autocuidado que a pessoa idosa deve realizar para manter uma vida independente. Elas incluem atividades como se alimentar, tomar banho, vestir-se, cuidar da higiene pessoal, ir ao banheiro, manter-se continente, andar e transferir-se (por exemplo, da cama para a cadeira)."),
          const SizedBox(height: 10),
          const Text(
            "Atividades Instrumentais da Vida Diária (AIVDs):",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "São atividades mais complexas que permitem à pessoa idosa viver de forma independente na comunidade, como realizar tarefas domésticas, preparar refeições, fazer compras, usar transporte público, gerenciar finanças, lidar com a medicação e usar telefone ou outros aparelhos de comunicação."),
          const SizedBox(height: 10),
          const Text(
            "Capacidade física/motora:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "A capacidade física é um dos pilares da independência da pessoa idosa. Ela inclui a mobilidade, a força muscular, o equilíbrio e a coordenação motora. São habilidades fundamentais para a realização de AVDs, como caminhar, se alimentar, vestir-se e manter a higiene pessoal."),
          const SizedBox(height: 6),
          Image.asset("assets/images/funcionalidade/Foto2.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Capacidade cognitiva:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "São funções cognitivas essenciais para a funcionalidade, como memória, atenção, raciocínio e capacidade de julgamento. A preservação dessas funções é crucial para a autonomia, permitindo que a pessoa idosa tome decisões, organize suas atividades e mantenha sua vida social e familiar ativa. "),
          const SizedBox(height: 3),
          Image.asset("assets/images/funcionalidade/Foto3.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Aspectos emocionais:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "O estado emocional da pessoa idosa também é um componente importante da funcionalidade global. Questões como depressão, ansiedade e estresse podem impactar negativamente a capacidade funcional, pois influenciam a motivação e a disposição da pessoa idosa em realizar suas atividades diárias. "),
          const SizedBox(height: 10),
          const Text(
            "Interação social e ambiente:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "A funcionalidade da pessoa idosa é influenciada também por fatores sociais e ambientais. O suporte institucional ou familiar, a rede de amigos e o ambiente físico acessível são elementos essenciais para a preservação da autonomia. Um ambiente adaptado às limitações da pessoa idosa e um suporte social adequado promovem a participação ativa na sociedade e aumentam o bem-estar da população idosa."),
          const SizedBox(height: 10),
          const Text(
            "Avaliação funcional:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "Deve ser uma ferramenta contínua no cuidado à pessoa idosa. Ela não deve apenas focar na presença ou ausência de doenças, mas na capacidade da pessoa idosa de lidar com as demandas do dia a dia. Ao integrar aspectos físicos, cognitivos, emocionais e sociais, a avaliação funcional oferece uma visão mais ampla da saúde da pessoa idosa, auxiliando no desenvolvimento de estratégias personalizadas de cuidado e intervenções que promovam a longevidade com qualidade de vida."),
          const SizedBox(height: 3),
          Image.asset("assets/images/funcionalidade/Foto4.png"),
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
