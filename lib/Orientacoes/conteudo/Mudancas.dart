import 'package:flutter/material.dart';

class MudancasScreen extends StatelessWidget {
  const MudancasScreen({Key? key}) : super(key: key);

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
                "MUDANÇA DE POSIÇÃO CORPORAL",
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
                  title: "IMPORTÂNCIA DA MUDANÇA DE POSIÇÃO CORPORAL",
                  subtitle:
                      "Bem-estar, qualidade de vida e desafios nas instituições de longa permanência para idosos (ILPIS)",
                  content: _buildMudancaPosicionamentoContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title:
                      "ORIENTAÇÕES PARA MUDANÇA DE POSIÇÃO CORPORAL DA PESSOA IDOSA ",
                  subtitle: "Detalhes sobre gestão de qualidade.",
                  content: _buildMudancaPosicionamentoDetalhes(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMudancaPosicionamentoContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "O cuidado com a mudança de posicionamento do corpo da pessoa idosa com restrição de mobilidade é extremamente relevante para prevenir o aparecimento de lesões por pressão. Os residentes com algum tipo de incapacidade, que passam a maior parte do tempo na cama ou na cadeira de rodas, precisam mudar de posição a cada 2 horas.",
          ),
          const SizedBox(height: 10),
          const Text(
            "A restrição de mobilidade, comum em pessoas idosas acamadas ou que utilizam cadeiras de rodas por longos períodos, pode resultar em pressão contínua sobre determinadas áreas do corpo, como calcanhares, sacral, quadril e ombros. Essa pressão contínua reduz o fluxo sanguíneo, podendo causar lesões na pele e nos tecidos subjacentes, conhecidas como lesões por pressão. Além disso, a falta de mobilidade pode prejudicar a circulação sanguínea, aumentando o risco de inchaço e trombose.",
          ),
          const SizedBox(height: 10),
          const Text(
            "O cuidado com a mudança de posicionamento regular das pessoas idosas que têm restrição de mobilidade em Instituições de Longa Permanência para Idosos (ILPI) é essencial para garantir conforto, bem-estar e prevenção de complicações. A seguir, algumas orientações e dicas sobre como realizar esse cuidado com segurança e eficácia:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Frequência da mudança de posição:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "⦁ O ideal é que as pessoas idosas sejam reposicionadas a cada duas horas, especialmente as que estão acamadas. Para as que ficam em cadeira de rodas, recomenda-se mudanças de posição a cada uma hora. Esse intervalo ajuda a redistribuir a pressão nas áreas vulneráveis do corpo, prevenindo lesões na pele e tecidos subjacentes."),
          const SizedBox(height: 10),
          const Text(
            "Técnicas de mudança de posição:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "⦁ Planejamento: antes de reposicionar a pessoa idosa, certifique-se de que todos os materiais necessários, como travesseiros, almofadas e cobertores, estão disponíveis. Isso facilitará o processo e garantirá conforto à pessoa idosa."),
          const Text(
              "⦁ Utilização de almofadas: colocar almofadas sob áreas de pressão, como joelhos, tornozelos ou cotovelos, ajuda a distribuir melhor o peso e aliviar pontos de pressão. Utilize almofadas ou travesseiros macios, que se adaptem ao corpo da pessoa idosa."),
          const Text(
              "⦁ Elevação dos membros inferiores: quando a pessoa idosa estiver deitada, eleve levemente as pernas com travesseiros para melhorar a circulação e reduzir o inchaço nas extremidades."),
          const Text(
              "⦁ Uso de técnica adequada: ao reposicionar a pessoa idosa, levante-a cuidadosamente com ajuda de outros cuidadores ou dispositivos, evitando arrastar o corpo sobre a cama ou cadeira, o que pode causar lesões na pele. Use técnicas corretas de levantamento para evitar ferimentos tanto na pessoa idosa quanto em você."),
          const Text(
              "⦁ Rotações suaves: alterne o posicionamento entre decúbito dorsal (de costas), decúbito lateral (de lado) e, ocasionalmente, decúbito ventral (de barriga para baixo), conforme a condição da pessoa idosa e a orientação médica. Esse rodízio de posições evita pressão prolongada em áreas específicas do corpo."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_mudanca.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }

  Widget _buildMudancaPosicionamentoDetalhes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mudança de posição: Deitada de costas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "⦁ Coloque um travesseiro fino e firme embaixo da cabeça da pessoa idosa de maneira que o pescoço fique no mesmo nível da coluna."),
          const Text(
              "⦁ Coloque um travesseiro ou cobertor fino embaixo da panturrilha, assim diminui a pressão dos calcanhares sobre a cama."),
          const Text(
              "⦁ Dobre os cotovelos levemente e coloque as mãos da pessoa idosa apoiadas nos quadris."),
          const Text(
              "⦁ Mantenha as pernas da pessoa idosa esticadas e as pontas dos dedos voltadas para cima. Apoie os pés em uma almofada recostada na guarda final da cama, caso haja esta guarda."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_mudanca_dois.png"),
          const Text("Fonte: Guia prático do cuidador / Ministério da Saúde",
              style: TextStyle(fontStyle: FontStyle.italic)),
          const SizedBox(height: 20),
          const Text(
            "Mudança de posição: Deitada de lado",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("⦁ Coloque a pessoa idosa deitada de um dos lados."),
          const Text(
              "⦁ Coloque um travesseiro fino sob a cabeça e o pescoço de modo que a cabeça fique alinhada com a coluna."),
          const Text(
              "⦁ Escore as costas da pessoa idosa com um travesseiro maior, para evitar que ela vire de costas, e coloque outro travesseiro entre os braços da pessoa idosa para dar maior conforto."),
          const Text(
              "⦁ A perna que fica por cima deve estar levemente dobrada e apoiada em um travesseiro, a fim de mantê-la no nível dos quadris."),
          const Text(
              "⦁ Dobre levemente o joelho e coloque uma toalha dobrada, ou cobertor ou edredon fino, a fim de manter o tornozelo afastado do colchão."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_mudanca_tres.png"),
          const Text("Fonte: Guia prático do cuidador / Ministério da Saúde",
              style: TextStyle(fontStyle: FontStyle.italic)),
          const SizedBox(height: 20),
          const Text(
            "Mudança de posição: Deitada de bruços",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "⦁ Deite a pessoa idosa de bruços, vire a cabeça delicadamente para um dos lados acomodando-a com um travesseiro fino ou toalha dobrada."),
          const Text(
              "⦁ Ajude a pessoa idosa a flexionar os braços para cima de modo que os cotovelos fiquem nivelados com os ombros."),
          const Text(
              "⦁ Depois, coloque toalhas dobradas embaixo do peito e do estômago."),
          const Text(
              "⦁ Por fim, ajeite as pernas apoiando os tornozelos e elevando os pés com uma toalha ou lençol enrolado."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_mudanca_quatro.png"),
          const Text("Fonte: Guia prático do cuidador / Ministério da Saúde",
              style: TextStyle(fontStyle: FontStyle.italic)),
          const SizedBox(height: 20),
          const Text(
            "Mudança da cama para a cadeira",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "⦁ Sempre que for possível, recomenda-se a mudança da pessoa idosa da cama para a cadeira. Entretanto, há de se considerar que quando a pessoa está há muitos dias deitada ou não consegue fazer a transferência sozinha, é preciso que o cuidador faça a mudança da posição deitada para sentada e depois em pé, pois a pessoa pode sentir fraqueza nas pernas, tonturas e vertigem ou até mesmo não conseguir movimentar as pernas."),
          const Text(
              "⦁ Caso a cama tenha rodas e grades, as travar e abaixar, respectivamente. Após, mova as pernas da pessoa idosa para o lado, segurando-a com firmeza pelos ombros. Peça a pessoa idosa que se apoie firmemente nos braços e levante o corpo da cama. Com a pessoa idosa já sentada na cama, solicite a ela que apoie os dois pés no chão."),
          const Text(
              "⦁ Para evitar que a pessoa idosa se desequilibre e caia, permaneça na frente dela enquanto ela se acostuma a ficar sentada e a movimentar as pernas."),
          const Text(
              "⦁ Quando a pessoa idosa não mais se sentir tonta ou cansada, calce-lhe sapatos antiderrapantes, traga-a para a beira da cama, posicione seus pés firmemente no chão e peça-lhe para tentar se levantar, estando alerta para ajudá-la caso se desequilibre."),
          const Text(
              "⦁ Se a pessoa idosa precisar de ajuda para ficar de pé, posicione-se de forma que os joelhos da pessoa idosa fiquem entre os seus. Então abaixe-se, flexionando levemente as pernas, passe os braços em volta da cintura da pessoa idosa e peça-lhe para a pessoa idosa dar impulso. Erga-se trazendo-a junto."),
          const Text(
              "⦁ Guie a pessoa idosa até uma cadeira. Posicione-a de costas para a cadeira, com os joelhos flexionados e as costas eretas. Caso a cadeira tenha braços, peça à pessoa idosa para se apoiar nos braços da cadeira ao sentar. Caso ela não movimente o braço, é preciso que a poltrona ou cadeira onde essa pessoa vai se sentar tenha apoio lateral resistente para que o braço afetado possa ficar bem apoiado."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_mudanca_cinco.png"),
          const Text("Fonte: Guia prático do cuidador / Ministério da Saúde",
              style: TextStyle(fontStyle: FontStyle.italic)),
          const SizedBox(height: 20),
          const Text(
            "Atenção à Comunicação",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Converse com a pessoa idosa durante a mudança de posição, explicando o que será feito, mesmo que ele tenha limitações cognitivas. Essa comunicação promove uma sensação de cuidado e segurança."),
          const SizedBox(height: 10),
          const Text(
            "Conforto e Bem-estar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Além das mudanças de posição, incentive a pessoa idosa a realizar pequenas atividades que estejam ao seu alcance, como movimentar os braços ou pernas, sempre que possível. Essas pequenas ações auxiliam na circulação e no fortalecimento muscular."),
          const SizedBox(height: 10),
          const Text(
            "Cuidar da mobilidade da pessoa idosa é uma responsabilidade que exige atenção, paciência e carinho. Com práticas corretas e frequentes, é possível promover mais conforto e prevenir complicações graves.",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_mudanca_seis.png"),
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
