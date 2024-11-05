import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class InconScreen extends StatelessWidget {
  const InconScreen({Key? key}) : super(key: key);

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
                "Incontinências",
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
                      "CUIDADO COM AS INCONTINÊNCIAS EM INSTITUIÇÕES DE LONGA PERMANÊNCIA PARA IDOSOS (ILPIS)",
                  subtitle:
                      "Bem-estar, qualidade de vida e desafios nas instituições de longa permanência para idosos (ILPIS)",
                  content: _buildIncontinenciaContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title:
                      "ASPECTOS IMPORTANTES SOBRE A INCONTINÊNCIA URINÁRIA (IU) ",
                  subtitle: "Detalhes sobre gestão de qualidade.",
                  content: _buildIncontinenciaUrinariaContent(),
                ),
                const SizedBox(height: 20),
                _buildExpansionTile(
                  title: "CUIDADOS COM A SONDA VESICAL DE DEMORA ",
                  subtitle: "Detalhes sobre gestão de qualidade.",
                  content: _buildSondaVesicalContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncontinenciaContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A incontinência urinária (IU) e fecal são condições comuns em ILPIs, e o manejo adequado dessas condições é fundamental para garantir a dignidade, a saúde e o bem-estar dos residentes. Estas condições trazem impactos significativos na vida da pessoa idosa, tanto do ponto de vista físico, quanto emocional.",
          ),
          const SizedBox(height: 10),
          const Text(
            "A incontinência pode causar diversos problemas de saúde, incluindo:",
          ),
          const SizedBox(height: 4),
          const Text(
              "⦁ Desconforto e constrangimento: a perda involuntária de urina ou fezes pode afetar a autoestima da pessoa idosa, gerando constrangimento."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Problemas de pele: a incontinência pode levar a irritações cutâneas, assaduras e infecções devido à umidade prolongada."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Complicações de saúde: sem o manejo correto, a incontinência pode provocar infecções e complicar outras condições de saúde."),
          const SizedBox(height: 10),
          const Text(
            "Além dos aspectos físicos, o cuidado com a incontinência também afeta diretamente o bem-estar emocional da pessoa idosa. Uma abordagem respeitosa e sensível pode:",
          ),
          const SizedBox(height: 6),
          const Text(
              "⦁ Reduzir o estigma: tratar a incontinência com dignidade ajuda a minimizar o estigma que muitas pessoas idosas sentem em relação à condição."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Preservar a autoestima: cuidar adequadamente da incontinência, com apoio psicológico, quando necessário, mantém a autoestima da pessoa idosa."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Autonomia: sempre que possível, é importante preservar a autonomia da pessoa idosa, permitindo que ela participe do seu próprio cuidado."),
          const SizedBox(height: 10),
          const Text(
            "Avaliação e monitoramento regular da pessoa idosa com incontinência:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Avaliação individualizada: é importante realizar uma avaliação contínua da situação de incontinência da pessoa idosa, considerando fatores como mobilidade, doenças associadas e capacidade cognitiva. Isso ajuda a desenvolver um plano de cuidado personalizado."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Registro das ocorrências: manter um registro regular dos episódios de incontinência, horários e padrões ajuda a ajustar o plano de cuidados, evitando complicações."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Frequência de trocas: fraldas e absorventes devem ser trocados com frequência, especialmente após episódios de incontinência. Manter a pele seca ajuda a evitar infecções e assaduras."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Higienização adequada: durante as trocas, é essencial limpar a área genital e perineal com produtos suaves e secar bem a pele, prevenindo irritações e dermatites."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Cuidados com a pele: o uso constante de fraldas e a exposição à umidade podem causar lesões de pele. É fundamental utilizar cremes de barreira, como óxido de zinco, nas áreas vulneráveis para proteger a pele."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Inspeção diária da pele: verifique regularmente a pele da pessoa idosa, principalmente nas áreas de maior contato com fraldas e absorventes, para prevenir infecções ou irritações graves."),
          const SizedBox(height: 1),
          Image.asset("assets/images/orientacoes/Foto_incon.png"),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }

  Widget _buildIncontinenciaUrinariaContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A incontinência urinária (IU) é definida como a perda involuntária de urina e é uma das síndromes geriátricas mais comuns entre pessoas idosas institucionalizadas, porém é prevenível e tratável. O cuidado adequado com a IU exige uma abordagem multidisciplinar que envolva nutrição, hidratação, higiene, mudanças comportamentais e um ambiente acessível.",
          ),
          const SizedBox(height: 10),
          const Text(
            "Principais tipos de IU:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Incontinência Urinária de Esforço (IUE): ocorre quando há perda involuntária de urina durante atividades que aumentam a pressão abdominal, como tossir, espirrar, rir, levantar peso ou se exercitar. É comum em mulheres devido a fraqueza do assoalho pélvico, muitas vezes causada por gestações ou cirurgias."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Incontinência Urinária de Urgência (IUU): caracteriza-se por uma necessidade súbita e intensa de urinar, com perda de urina antes de chegar ao banheiro. Está associada a uma hiperatividade do músculo detrusor da bexiga, que se contrai de forma involuntária."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Incontinência Urinária Mista: combina características da incontinência de esforço e de urgência, ou seja, a pessoa tem perda de urina tanto em situações de aumento da pressão abdominal quanto com a urgência para urinar."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Incontinência por Transbordamento: ocorre quando a bexiga não esvazia completamente, e o excesso de urina acaba vazando. Isso pode ser resultado de obstruções (como aumento da próstata) ou fraqueza muscular da bexiga, causando gotejamento constante ou intermitente."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Incontinência Funcional: ocorre quando a pessoa não consegue chegar ao banheiro a tempo devido a limitações físicas ou cognitivas, como mobilidade reduzida ou demência, mesmo que o sistema urinário esteja funcionando normalmente."),
          const SizedBox(height: 10),
          Image.asset("assets/images/orientacoes/Foto_incon_dois.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text(
            "Fatores de Risco:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Os fatores de risco para IU podem ser divididos em dois grupos:"),
          const SizedBox(height: 5),
          const Text(
            "1. Fatores Não Modificáveis:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Envelhecimento: o avanço da idade diminui a capacidade de armazenamento de urina e a contratilidade da bexiga, além de aumentar o volume residual de urina. Contrações espontâneas do músculo da bexiga podem ocorrer devido à atrofia do córtex cerebral."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Sexo: mulheres têm maior risco de IU devido a fatores hormonais e múltiplas gestações, enquanto homens idosos são afetados por problemas prostáticos, o que pode levar à incontinência."),
          const SizedBox(height: 5),
          const Text(
            "2. Fatores Modificáveis:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Constipação intestinal: o esforço repetido durante a evacuação pode enfraquecer o assoalho pélvico, agravando a IU."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Tosse crônica: a tosse persistente irrita a bexiga e aumenta o volume de urina."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Diabetes descompensado: a hiperglicemia aumenta a produção de urina, o que pode levar a perdas involuntárias."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Baixa ingestão hídrica: a desidratação concentra a urina, irritando a bexiga e facilitando a perda de urina."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Obesidade: a pressão adicional no abdômen e na bexiga aumenta o risco de incontinência."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Estresse emocional e psicossocial: pode desencadear episódios de incontinência devido ao impacto no controle vesical."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Consumo de alimentos irritantes: cafeína, álcool e alimentos apimentados podem aumentar a irritação da bexiga."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Uso de medicamentos: diuréticos e calmantes podem agravar a incontinência."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Infecções urinárias: contribuem para o aumento da urgência e frequência urinária."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Doenças neurológicas: pessoas com doenças neurológicas podem perder o controle sobre a função urinária."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Musculatura pélvica fraca: interfere no controle dos esfíncteres."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Ambiente não adaptado e acessível: dificulta a autonomia e aumenta a necessidade de fraldas em alguns casos."),
          const SizedBox(height: 10),
          const Text(
            "Abordagem prática para minimizar fatores de risco modificáveis:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "Para minimizar os fatores de risco modificáveis da IU nas ILPIs, algumas intervenções são essenciais no cuidado diário das pessoas idosas. Essas intervenções visam promover a dignidade, o conforto e a saúde dos residentes, prevenindo complicações e garantindo uma melhor qualidade de vida dentro das ILPIs. São elas:"),
          const SizedBox(height: 5),
          const Text(
            "Constipação intestinal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Dieta rica em fibras e hidratação adequada: promove a regularidade intestinal e reduz o esforço durante a evacuação."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Postura adequada ao evacuar: ajuda a evitar o enfraquecimento do assoalho pélvico."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Massagens abdominais: podem ser usadas para aliviar a constipação."),
          const SizedBox(height: 5),
          const Text(
            "Ingestão hídrica",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Adequação personalizada: o cálculo da ingestão de líquidos deve ser individualizado, evitando tanto a desidratação quanto o aumento excessivo da produção urinária."),
          const SizedBox(height: 5),
          const Text(
            "Tosse crônica e diabetes descompensado",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Tratamento adequado: a tosse crônica deve ser investigada e controlada para evitar pressão na bexiga, enquanto o controle da glicemia reduz a produção excessiva de urina."),
          const SizedBox(height: 5),
          const Text(
            "Controle do peso corporal",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Peso saudável: a perda de peso reduz a pressão sobre a bexiga, diminuindo a incidência de episódios de IU."),
          const SizedBox(height: 5),
          const Text(
            "Apoio psicossocial",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Apoio emocional: a incontinência pode ser uma fonte de constrangimento e perda de autoestima para a pessoa idosa. Oferecer apoio emocional e tratar a questão com sensibilidade é fundamental para o bem-estar psicológico do residente."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Gerenciamento do estresse: Práticas de controle emocional ajudam a prevenir episódios de incontinência relacionados ao estresse."),
          const SizedBox(height: 5),
          const Text(
            "Controle de alimentos irritantes ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Dieta controlada: evitar o consumo de alimentos irritantes, como cafeína e refrigerantes, que aumentam a irritabilidade da bexiga."),
          const SizedBox(height: 5),
          const Text(
            "Manejo de doenças neurológicas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Cuidado específico: para pessoas com limitações cognitivas, o manejo adequado das doenças neurológicas pode ajudar a evitar episódios de incontinência."),
          const SizedBox(height: 5),
          const Text(
            "Uso correto de fraldas e cateteres",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Avaliação cuidadosa: o uso de fraldas e cateteres deve ser criteriosamente avaliado, evitando a dependência excessiva desses dispositivos, o que pode agravar a IU."),
          const SizedBox(height: 5),
          const Text(
            "Treinamento e fortalecimento da musculatura pélvica",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Exercícios de fortalecimento: quando possível, incentivar exercícios de fortalecimento do assoalho pélvico (como os exercícios de Kegel) pode ajudar a melhorar o controle da bexiga e prevenir a incontinência. O profissional fisioterapeuta pode auxiliar nestes exercícios."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Treinamento vesical: Para pessoas idosas que ainda têm algum controle urinário, o treinamento vesical, com idas regulares ao banheiro, pode ajudar a reduzir os episódios de incontinência."),
          const SizedBox(height: 5),
          const Text(
            "Adaptações no ambiente",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
              "⦁ Acessibilidade: garanta que a pessoa idosa tenha fácil acesso ao banheiro, com barras de apoio e sinalizações adequadas."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Roupas adaptadas: roupas de fácil remoção, como calças com elástico ou velcro, podem facilitar o processo de ir ao banheiro, reduzindo o tempo necessário para atender às necessidades fisiológicas."),
        ],
      ),
    );
  }

  Widget _buildSondaVesicalContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "A sonda vesical de demora, ou sonda de Folley, é utilizada em pessoas que não conseguem urinar espontaneamente ou controlar a saída de urina. A sonda possui um balão que a mantém dentro da bexiga e é fixada externamente na coxa com esparadrapo antialérgico, conectando-se a uma bolsa coletora de urina. A sonda de demora faz com que a pessoa urine continuamente.",
          ),
          const SizedBox(height: 5),
          const Text(
            "Para prevenir infecções, sangramentos e lesões, são necessários cuidados rigorosos:",
          ),
          const SizedBox(height: 3),
          const Text(
              "⦁ Higiene das mãos: lavar as mãos sempre antes de manusear a sonda."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Higienização da pele: limpar a pele ao redor da sonda com água e sabão pelo menos duas vezes ao dia. Isso evita o acúmulo de secreções e reduz o risco de infecções."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Limpeza da bolsa coletora: lavar a bolsa ou frasco coletor de urina uma vez ao dia com água e sabão. Enxaguar com água clorada para manter a higiene adequada."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Posição da bolsa coletora: manter a bolsa coletora abaixo do nível da cama ou do assento da cadeira. Nunca deixe a bolsa muito cheia, isso evita o refluxo da urina para a bexiga, prevenindo infecções."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Cuidado com o movimento da sonda: evitar puxar a sonda acidentalmente, pois isso pode causar ferimentos na uretra."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Verificação do fluxo de urina: a sonda deve estar livre de obstruções para que a urina flua continuamente da bexiga. Cuidar para que a perna da pessoa ou outros objetos não comprimam a sonda."),
          const SizedBox(height: 3),
          const Text(
              "⦁ Monitoramento de urina: se não houver urina na bolsa coletora por um período de tempo, verificar se a sonda está: dobrada, obstruída ou pressionada pela perna ou outros objetos. Caso a pessoa não urine em 4 horas, mesmo após ingestão de líquidos, contatar urgentemente a equipe de saúde."),
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
