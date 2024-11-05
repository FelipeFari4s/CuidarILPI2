import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class HigieneScreen extends StatelessWidget {
  const HigieneScreen({Key? key}) : super(key: key);

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
                "HIGIENE CORPORAL E BUCAL",
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
                  title: "HIGIENE CORPORAL DA PESSOA IDOSA EM ILPIS",
                  subtitle:
                      "Bem-estar, qualidade de vida e desafios nas instituições de longa permanência para idosos (ILPIS)",
                  content: _buildHigieneCorporalContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title: "HIGIENE BUCAL DA PESSOA IDOSA EM ILPIS",
                  subtitle: "Detalhes sobre gestão de qualidade.",
                  content: _buildHigieneBucalContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHigieneCorporalContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A higiene corporal na pessoa idosa é um aspecto crucial para garantir conforto, bem-estar e, sobretudo, contribuir para a manutenção e recuperação da saúde. A prática regular da higiene corporal, incluindo o banho diário, não apenas promove a limpeza, mas também ajuda a prevenir complicações de saúde, como infecções e lesões, além de proporcionar uma sensação de relaxamento.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Benefícios do banho",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "O banho oferece diversos benefícios:",
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Limpeza do corpo: remove sujeiras, resíduos e odores corporais."),
          const Text(
              "⦁ Estímulo das glândulas do suor: promove a abertura dos poros."),
          const Text(
              "⦁ Remoção de microrganismos nocivos: prevenção de infecções."),
          const Text(
              "⦁ Sensação de frescor e relaxamento: o banho relaxa os músculos e promove bem-estar."),
          const Text(
              "⦁ Prevenção de lesões: limpa a pele e evita complicações de doenças ou infecções."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados especiais com a pele da pessoa idosa",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Devido ao processo natural de envelhecimento, a pele da pessoa idosa torna-se mais sensível e ressecada. Para garantir uma higiene adequada e preservar a saúde da pele, é essencial adotar cuidados específicos:",
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Uso de sabonetes neutros: sabonetes com pH neutro são menos agressivos e ajudam a evitar ressecamentos. Além disso, evitar sabonetes em barra, que podem acumular microrganismos."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Enxaguar completamente o sabonete: durante o enxágue, é importante garantir que não fiquem resíduos de sabonete."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Movimentos suaves: ao lavar o corpo, utilize movimentos delicados para não irritar a pele sensível."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Secagem cuidadosa: seque completamente o corpo, especialmente nas áreas com dobras, como axilas, mamas, e entre os dedos, para evitar umidade excessiva e prevenir infecções fúngicas ou assaduras."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Cabelos: seque bem os cabelos e, se necessário, utilize um secador em temperatura morna."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Inspecionar regularmente a pele: observar sinais de lesões ou infecções."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Exposição ao sol: garantir que a pessoa idosa tome sol diariamente por cerca de 20 minutos, antes das 10h ou após as 16h, para promover a síntese de vitamina D e melhorar o humor."),
          const SizedBox(height: 12),
          const Text(
            "Adaptações ambientais para o banho",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Um ambiente seguro é essencial para garantir a funcionalidade e independência da pessoa idosa durante o banho. Adaptações simples podem fazer uma grande diferença:",
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Piso antiderrapante: devem ser evitados desníveis e pisos escorregadios na área do banho."),
          const Text(
              "⦁ Barras de apoio: devem ser instaladas barras de apoio no banheiro, para auxiliar na mobilidade da pessoa idosa."),
          const Text(
              "⦁ Cadeiras firmes: use cadeiras firmes e de material lavável para o banho, garantindo que a pessoa idosa possa se sentar de forma segura."),
          const Text(
              "⦁ Verificar a temperatura e pressão da água: garantir temperaturas amenas para a água e que o jato não seja forte."),
          const SizedBox(height: 1),
          Image.asset("assets/images/orientacoes/Foto_corporal.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 6),
          const Text(
            "Itens para evitar no banheiro:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text("⦁ Aquecedores a gás."),
          const Text("⦁ Prateleiras de vidro ou objetos cortantes."),
          const Text("⦁ Piso ou tapetes escorregadios."),
          const SizedBox(height: 10),
          const Text(
            "Tipos de banho e recomendações",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            "1. Banho no chuveiro",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
              "O banho no chuveiro é ideal e pode ser realizado com a pessoa idosa em pé ou sentada, dependendo de sua mobilidade. Recomenda-se o uso de cadeiras de plástico ou cadeiras próprias para banho, colocadas sobre tapetes antiderrapantes para garantir a segurança."),
          const Text(
              "   ⦁ Temperatura da água: deve ser regulada conforme o conforto da pessoa idosa, garantindo uma sensação de relaxamento."),
          const Text(
              "   ⦁ Supervisão: a pessoa idosa pode realizar o banho sozinho, mas, em muitos casos, requer supervisão ou ajuda do cuidador."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados com o banho no chuveiro:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
              "⦁ Separe previamente roupas e objetos necessários para o banho."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Garanta privacidade para a pessoa idosa se despir e vestir a roupa."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Regule a temperatura da água e mantenha o banheiro aquecido, evitando correntes de ar."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Encaminhe a pessoa idosa ao banho e não a deixe sozinha, porque ela pode escorregar e cair."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Observar a pele do residente, verificando lesões, rachaduras, mudanças na cor, inchaços ou hematomas."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Auxilie na secagem, especialmente em áreas íntimas e dobras cutâneas."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Após o banho, aplique cremes hidratantes para manter a pele hidratada, retendo a umidade e aumentando a proteção."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Estimule, oriente, supervisione e auxilie a pessoa idosa cuidada a fazer sua higiene. Só faça aquilo que ela não é capaz de fazer."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_corporal_dois.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 4),
          const Text(
            "2. Banho na cama",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
              "Quando a pessoa idosa não consegue se locomover até o chuveiro, o banho pode ser realizado na cama, mas, se possível, não deve ser rotina diária, pois pode ser desconfortável e constrangedor. O banho na cama deve ser conduzido com privacidade e o cuidador deve manter um diálogo constante com a pessoa idosa."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados com o banho na cama:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          const Text(
              "⦁ Proteja o colchão e o travesseiro com plástico antes de iniciar e garantir a privacidade da pessoa idosa no quarto."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Lave o rosto com um pano umedecido, enxague e seque bem."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Lave os cabelos: coloque um balde ou bacia embaixo da cabeça e use o travesseiro como apoio."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Higienize o corpo por partes: lave braços, tórax, pernas e pés. Após, seque bem cada região e aplique creme hidratante."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Higiene das costas: vire a pessoa idosa de lado para limpar e secar as costas. Aplique creme hidratante."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Higiene íntima: com o auxílio de uma comadre, lave as partes íntimas com movimentos adequados para evitar infecções. Em mulheres, sempre lave da frente para trás. No homem é importante descobrir a cabeça do pênis para que possa lavar e secar bem."),
          const SizedBox(height: 2),
          const Text(
              "⦁ A todo momento, observar a pele do residente, para verificar se há lesões, rachaduras, mudanças na cor, inchaços ou hematomas."),
          const SizedBox(height: 2),
        ],
      ),
    );
  }

  Widget _buildHigieneBucalContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A higiene bucal é essencial para a saúde, o bem-estar e a convivência social dos residentes em Instituições de Longa Permanência para Idosos (ILPIs). O cuidado diário da boca, dos dentes e das próteses melhora a qualidade de vida e previne doenças orais e sistêmicas. Todas as pessoas idosas, seja com dentes naturais ou próteses, devem realizar a higienização sempre após as refeições. É fundamental que os cuidadores sejam treinados para realizar corretamente a higienização bucal dos residentes. Um treinamento adequado melhora a eficácia da higienização, previne doenças e aumenta o conforto da pessoa idosa.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Importância da higiene bucal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Prevenção de doenças bucais: evita cáries, gengivites e outras complicações."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Prevenção de doenças sistêmicas: doenças bucais podem influenciar a saúde geral, afetando o sistema imunológico."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Conforto e segurança na mastigação: a limpeza regular promove uma melhor mastigação, o que é essencial para uma boa nutrição."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Melhoria da fala e do paladar: a higienização mantém a boca saudável, facilitando a fala e preservando o paladar."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Melhoria da aparência e autoestima: manter a boca limpa contribui para a autoestima da pessoa idosa."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Alívio de dores e reparo de danos orais: a higienização correta pode ajudar a prevenir desconfortos e lesões na cavidade oral."),
          const SizedBox(height: 10),
          const Text(
            "Lesões bucais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "Lesões bucais podem surgir devido à má higienização, uso inadequado de próteses, traumas ou condições de saúde geral. Essas lesões incluem:"),
          const SizedBox(height: 5),
          const Text(
              "⦁ Feridas na mucosa: provocadas por próteses mal ajustadas."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Lesões por trauma: mordidas repetitivas ou uso prolongado de máscara respiratória podem gerar lesões."),
          const SizedBox(height: 10),
          const Text(
            "Como identificar lesões bucais",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text("⦁ Observar os lábios: tanto por dentro quanto por fora."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Verificar as bochechas: abrir a boca e examinar os dois lados."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Exame da língua: com a língua para fora, verificar os dois lados e a parte superior. Levante a língua para observar por baixo."),
          const SizedBox(height: 2),
          const Text(
              "⦁ Apalpar o pescoço e a face: verificar a presença de caroços, manchas, sangramentos ou feridas que não cicatrizam após 20 dias, mesmo sem dor."),
          const SizedBox(height: 10),
          const Text(
            "Saliva e saúde bucal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
              "A saliva desempenha um papel fundamental na manutenção da saúde bucal, auxiliando nos mecanismos de defesa, na lubrificação da cavidade oral e na prevenção de cáries. A falta de saliva (xerostomia) pode ser resultado de medicamentos, e é essencial manter a boca hidratada para evitar complicações."),
          const SizedBox(height: 10),
          const Text(
            "Dicas para manutenção do fluxo salivar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Ingestão de água: garantir uma boa ingestão de líquidos para hidratar a boca."),
          const Text(
              "⦁ Aumento da frequência de escovações: para compensar a baixa produção de saliva."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados diários com a higiene bucal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            " Equipamentos de proteção individual (EPIs)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
              "⦁ Os cuidadores devem sempre utilizar máscara e luvas descartáveis para garantir a segurança e higiene durante o cuidado com a saúde bucal da pessoa idosa."),
          const SizedBox(height: 6),
          const Text(
            " Higienização de dentes naturais e boca",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
              "⦁ Escova de cerdas macias: utilize escovas de cabeça reduzida e de cerdas macias."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Creme dental e fio dental: sempre usar creme dental e realizar a higienização com fio dental, preferencialmente com cabo para facilitar o manuseio, tanto para pessoas idosas autônomas quanto para aquelas acamadas, que precisam de auxílio."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Escovação completa: escovar dentes, gengivas, bochechas, língua e o palato (céu da boca)."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Armazenamento das escovas: guardar as escovas individualmente, com identificação, garantindo cuidado e higiene."),
          const SizedBox(height: 1),
          Image.asset("assets/images/orientacoes/Foto_bucal.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Higienização com gaze",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              " Caso a pessoa idosa tenha desconforto ao usar escovas ou apresente algum grau de dependência significativo, recomenda-se:"),
          const SizedBox(height: 3),
          const Text(
              "⦁ Uso de gaze umedecida: umedecer a gaze em solução asséptica e limpá-la por toda a cavidade oral, incluindo gengivas, língua e bochechas. Pode ser usada uma espátula envolvida em gaze para facilitar o procedimento."),
          const SizedBox(height: 8),
          const Text(
            "Higienização com mobilidade limitada",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              "⦁ Cuidado com o enxágue: para as pessoas idosas com limitações funcionais, evitar o uso de água para enxaguar a boca. Em vez disso, remova o excesso de pasta de dente e resíduos com uma gaze seca, passando pelos dentes e gengiva."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Posição adequada: durante a higiene bucal, a pessoa idosa deve estar preferencialmente sentada ou com a cabeceira da cama elevada, para evitar engasgos. Evite posicionar a pessoa idosa em pé na pia do banheiro, para maior segurança e evitar quedas."),
          const SizedBox(height: 10),
          const Text(
            "Cuidados especiais com a língua",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "A língua também requer atenção durante a higiene bucal. Utilize:"),
          const SizedBox(height: 3),
          const Text(
              "⦁ Limpadores ou raspadores de língua: ou, alternativamente, uma colher pequena para remover o excesso de resíduos. Comece pela parte posterior da língua e arraste suavemente até a ponta."),
          const SizedBox(height: 10),
          const Text(
            "Limpeza de próteses dentárias",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
              "Aqueles que utilizam próteses dentárias precisam de cuidados adicionais:"),
          const SizedBox(height: 4),
          const Text(
              "⦁ Uso de escova exclusiva para próteses: utilize uma escova com cerdas mais duras para limpeza de próteses."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Produtos de limpeza adequados: pode-se utilizar sabão neutro ou pasta dental para higienizar as próteses. Não se deve utilizar produtos como água sanitária, álcool, detergente para limpar a prótese."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Limpeza com a prótese fora da boca: para evitar acidentes, limpe sempre a prótese fora da boca. Uma dica é fazer isso sobre uma toalha ou bacia dentro da pia para amortecer a queda, caso ela escorregue."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Armazenamento das próteses: quando não estiverem sendo usadas, as próteses devem ser armazenadas limpas, em recipientes fechados e identificados, com água para proteger a resina e evitar danos. A água do recipiente deve ser trocada diariamente."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Limpeza da boca: lembrar de higienizar gengivas, língua e bochechas com escova de cerdas macias ou gaze umedecida."),
          const SizedBox(height: 10),
          const Text(
            "Hidratação labial",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
              "⦁ Após a higiene bucal, é importante cuidar dos lábios, ou seja, aplicar hidratante labial, que pode ser óleo, bálsamo ou creme labial. Evite manteiga de cacau, pois pode ressecar e causar fissuras ou feridas nos lábios com o tempo."),
          const SizedBox(height: 2),
          Image.asset("assets/images/orientacoes/Foto_bucal_dois.png"),
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
