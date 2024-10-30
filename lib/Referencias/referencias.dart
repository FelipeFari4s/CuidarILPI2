import 'package:flutter/material.dart';

class ReferenciasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EEFF),
      body: Column(
        children: [
          _buildAppBar(), // AppBar personalizada
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Referências Bibliográficas",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500, // Roboto Medium
                  color: Color(0xFF70627F),
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Bibliografia",
                style: TextStyle(
                  fontSize: 24, // Tamanho do título grande
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF70627F),
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
                  title: "Consultas",
                  subtitle: "",
                  content: _buildBibliografiaContent(),
                ),
              ],
            ),
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Color(0xFF70627F),
          ),
        ),
        children: [content],
      ),
    );
  }

  Widget _buildBibliografiaContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "LISTA DE BIBLIOGRAFIA CONSULTADA",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
              "ATKIN, L. et al. Implementing TIMERS: the race against hard-to-heal wounds. Journal of Wound Care, v. 23, n. Sup3a, p. S1–S50, 2019."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BAIXINHO, C. R. S. L. et al. Queda nas Instituições de Longa Permanência para Idosos: validação de protocolo. Revista Brasileira de Enfermagem, v. 70, n. 4, p. 740–746, 2017."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BENTO-TORRES N V O, et al. Estimulação multissensorial e cognitiva em idosos institucionalizados e não institucionalizados. Rev. Pan-Amaz Saúde, v.7, n.4, p.53-60, 2016."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BORGES, E.; DOMANSKY, R. Manual para prevenção de lesões de pele: recomendações baseadas em evidências. 2. ed. São Paulo: Rubio, 2014."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Ministério da Saúde, Secretaria de saúde. Secretaria do trabalho e da educação na saúde. Guia prático do cuidador. Ministério da saúde, 2008."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL, Ministério da Saúde. Portaria n. 529, de 1 de abril de 2013. Programa Nacional de Segurança do Paciente. Ministério da saúde, 2013."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Ministério da Saúde. Agência Nacional de Vigilância Sanitária. Protocolo de segurança na prescrição, uso e administração de medicamentos / Agência Nacional de Vigilância Sanitária. ANVISA, 2013."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Ministério da Saúde. Agência Nacional de Vigilância Sanitária. Protocolo para prevenção de úlcera por pressão / Agência Nacional de Vigilância Sanitária. ANVISA, 2013."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Ministério da Saúde. Agência Nacional de Vigilância Sanitária. Protocolo para prevenção de quedas / Agência Nacional de Vigilância Sanitária. ANVISA, 2013."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Agência Nacional de Vigilância Sanitária. Assistência Segura: Uma Reflexão Teórica Aplicada à Prática. Agência Nacional de Vigilância Sanitária. ANVISA, 2017."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Agência Nacional De Vigilância Sanitária. Organização Pan-Americana da Saúde (OPAS). Módulo 2: Protocolos de Segurança do Paciente I. ANVISA; 2018."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Ministério da Saúde. Instituto Nacional de Câncer (INCA). Folheto informativo sobre prevenção do câncer de boca: Câncer de Boca: É preciso falar disso. INCA, 2019."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Ministério da Saúde. Agência Nacional de Vigilância Sanitária. Práticas seguras para prevenção de erros na administração de medicamentos. ANVISA, 2021."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Agência de Vigilância Sanitária. Resolução da Diretoria Colegiada/RDC N° 502, de 27 de maio de 2021. Normas de funcionamento para as Instituições de Longa Permanência para Idosos. ANVISA, 2021."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "BRASIL. Ministério dos direitos humanos e da cidadania. Secretaria Executiva do Conselho Nacional dos Direitos da Pessoa Idosa. Guia para uma comunicação responsável sobre a pessoa idosa. Ministério dos direitos humanos e da cidadania, 2023."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "CASEMIRO F. G. et al. Impacto da estimulação cognitiva sobre depressão, ansiedade, cognição e capacidade funcional em adultos e idosos de uma universidade aberta da terceira idade. Rev. Bras. Geriatr. Gerontol., v. 19, n.4, p.683-694, 2016."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "CONSELHO REGIONAL DE ENFERMAGEM DE SÃO PAULO. Guia de boas práticas de enfermagem em terapia nutricional enteral. Conselho Regional de Enfermagem de São Paulo. São Paulo: Coren-SP, 2023."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "DANTAS, C. M. H. L. et al. Capacidade funcional de idosos com doenças crônicas residentes em Instituições de Longa Permanência. Revista Brasileira de Enfermagem, v. 66, n. 6, p. 914–920, 2013."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "DI PIERO, K. Manejo de pacientes com feridas crônicas: boas práticas em saúde. Boletim da Sociedade de Reumatologia do Rio de Janeiro, 2017."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "FERREIRA, J. D. L. et al. Ações Preventivas para Úlcera por Pressão em Idosos com Declínio Funcional de Mobilidade Física no Âmbito Domiciliar. Estima - Brazilian Journal of Enterostomal Therapy, v. 14, n. 1, 2016."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "FREITAS, E. V.; PY, L. (Ed.). Tratado de Geriatria e Gerontologia. 4a. ed. Rio de Janeiro: Ed. Guanabara Koogan, 2016."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "FERREIRA, L. M. DE B. M. et al. Quedas recorrentes e fatores de risco em idosos institucionalizados. Ciência & Saúde Coletiva, v. 24, n. 1, p. 67–75, 2019."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "GOMES, E. C. C. et al. Fatores associados ao risco de quedas em idosos institucionalizados: uma revisão integrativa. Ciência & Saúde Coletiva, v. 19, n. 8, p. 3543–3551, 2014."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "MACIEL, E. M. V. Cartilha Estimulação Cognitiva. Frente Nacional de Fortalecimento à Instituição de Longa Permanência para Idosos - ILPI. Revisão 01, 2020."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "MANSANO-SCHLOSSER, T. C. et al. Idosos institucionalizados: organização cronológica das rotinas diárias e qualidade do sono. Revista Brasileira de Enfermagem, v. 67, n. 4, p. 610–616, 2014."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "MEDEIROS, A. et al. Segurança do paciente: adesão à higienização das mãos pelos profissionais de saúde, um grande desafio institucional. Resid Pediatr. v. 2, n. 1, p. 32-34, 2021."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "MORAES, E. N. Avaliação Multidimensional do Idoso. 1. ed. Belo Horizonte: Folium, 2012."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "MORAES, E. N. Princípios Básicos de Geriatria e Gerontologia. 1. ed. Belo Horizonte: Coopmed, 2008."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "MORAES, E. N. Avaliação Geriátrica Ampla: Um Guia para a Saúde do Idoso na Atenção Básica. 1. ed. Belo Horizonte: NESCON/UFMG, 2013."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "MORSE, J.M.; MORSE, R.M.; TYLKO, S.J. Development of a scale to identify the fall-prone patient. Can J Aging, v.8, p.366-7, 1989."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "NOGUEIRA, J. T. et al. A qualidade do sono e a fragilidade em idosos: revisão integrativa. Revista de Enfermagem do Centro-Oeste Mineiro, v. 10, n. 0, 30 2020."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "NUNES, V. M. A.; MENDONÇA, A. E. O. Premissas para Segurança no Cuidado à Pessoa Idosa em Instituições de Longa Permanência. E-book. São José dos Pinhais: Seven Events, 2023."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "OMS. Organização Mundial da Saúde. Guidelines on Hand Hygiene in Health Care: First Global Patient Safety Challenge Clean Care is Safer Care. Genebra: OMS, 2009. "),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "OMS. Organização Mundial da Saúde. Salve vidas: Higiene das Mãos na Assistência à Saúde Extrahospitalar e Domiciliar e nas Instituições de Longa Permanência. Um Guia para a Implementação da Estratégia Multimodal da OMS para a Melhoria da Higiene das Mãos e da Abordagem “Meus 5 Momentos para a Higiene das Mãos”. Brasília: OMS; OPAS; ANVISA, 2014. "),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "RIPLINGER, L.; PIERA-JIMÉNEZ, J.; DOOLING, J. P. Patient Identification Techniques - Approaches, Implications, and Findings. Yearbook of Medical Informatics, v. 29, n. 1, p. 81-86, 2020. "),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "RUBENSTEIN, L.Z. et al  Screening for Undernutrition in Geriatric Practice: Developing the Short-Form Mini Nutritional Assessment (MNA-SF). J. Geront, v. 56, n.6, p.366-377. 2001."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "SANTOS, M. S. et al. Perfil clínico, epidemiológico e funcional de idosos em uma instituição de longa permanência de Campo Grande –MS. Brazilian Journal of Development, v.9, n.6, p.20822-20837, 2023."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "SERPA, L. F. et al. Validade preditiva da escala de Braden para o risco de desenvolvimento de úlcera por pressão, em pacientes críticos. Revista LatinoAmericana de Enfermagem, v. 19, n. 1, p. 50–57, 2011."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "SILVA, L. A. A. et al. Gestão da segurança de idosos residentes em instituições de longa permanência. Brazilian Journal of Health Review, v.4, n.5, p. 22031-22047 2021. "),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "RIPLINGER, L.; PIERA-JIMÉNEZ, J.; DOOLING, J. P. Patient Identification Techniques - Approaches, Implications, and Findings. Yearbook of Medical Informatics, v. 29, n. 1, p. 81-86, 2020. "),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "SILVA, V.A.; D’ELBOUX, M.J. Fatores associados à incontinência urinária em idosos com critérios de fragilidade. Texto Contexto Enferm, v. 21, n.2, p. 338-47, 2012."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "SOARES, S.; REIS, C.; ZAFFARI, D. Perfil nutricional de idosos residentes em instituições de longa permanência e a associação com variáveis sociodemográficas e clínico nutricionais. Revista Amazonense de Geriatria e Gerontologia, v.14, p.69-85, 2023."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "SOUZA, L. C. et al. Aplicativo para rastreio de fragilidade: ferramenta de cuidado ao idoso na Atenção Primária à Saúde. Rev. Eletr. Enferm., v.24, p: 1-9, 2022."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "THE JOINT COMMISSION. Quick Safety: People, processes, health IT and accurate patient identification. The Joint Commission, v. 45, out. 2018. "),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "THE JOINT COMMISSION. National Patient Safety Goals. Effective January 2023 for the Nursing Care Center Program. 2022. "),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "THE JOINT COMMISSION. Two Patient Identifiers - Understanding The Requirements: What are the key elements organizations need to understand regarding the use of two patient identifiers prior to providing care, treatment or services?. The Joint Commission, 2022.  "),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "VILLAS BOAS, P. J. F.; ABDALLA, C.; CARVALHO, A. S.; GIACOMIN, K. C. Frente Nacional de Fortalecimento à Instituição de Longa Permanência para Idosos - ILPI. Manual: Qualidade do Cuidado em Instituição de Longa Permanência para Idoso. Belo Horizonte (MG): ILPI, 2021."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "VILLAS BOAS, P. J. F. et al. Recomendações para prevenção e controle de infecções por CORONAVÍRUS (SARS-CoV-2) em Instituições de Longa de Longa Permanência para Idosos (ILPIS). Geriatric, Gerontology and Aging, v. 14, p. 134–7, 2020."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
          Text(
              "YOSHIKAWA, T. T.; NORMAN, D. C. Geriatric Infectious Diseases: Current Concepts on Diagnosis and Management. Journal of the American Geriatrics Society, v. 65, n. 3, p. 631–641, 2017."),
          SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF70627F),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
