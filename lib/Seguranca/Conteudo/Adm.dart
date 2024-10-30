import 'package:flutter/material.dart';

class AdmScreen extends StatelessWidget {
  const AdmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E1),
      body: Column(
        children: [
          _buildAppBar(), // AppBar personalizada
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Segurança do Cuidado à Pessoa Idosa",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7C6439),
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF7C6439),
              thickness: 1,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Administração segura dos medicamentos",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF7C6439),
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
                  title: "ADMINISTRAÇÃO SEGURA DE MEDICAMENTOS – NOVE CERTOS",
                  subtitle: "",
                  content: _buildAdministracaoMedicamentosContent(),
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
            color: Color(0xFF7C6439),
          ),
        ),
        children: [content],
      ),
    );
  }

  Widget _buildAdministracaoMedicamentosContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "A administração de medicamentos é a última barreira para prevenir erros resultantes de falhas anteriores no processo, como prescrição e dispensação. Por isso, os profissionais de saúde que administram medicamentos têm uma grande responsabilidade. Erros nesta etapa podem ter consequências graves para as pessoas idosas em Instituições de Longa Permanência (ILPIs)."),
          const SizedBox(height: 10),
          const Text(
            "Os Nove certos da administração segura de medicamentos",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
              "Seguir os nove certos é uma prática essencial para garantir a administração segura dos medicamentos em ILPIs, prevenindo erros e proporcionando um cuidado de qualidade às pessoas idosas."),
          const SizedBox(height: 10),
          const Text("1. Pessoa idosa certa",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Verifique o prontuário e, quando possível, confirme com a própria pessoa idosa se ela é a destinatária correta do medicamento."),
          const Text(
              "• Para pessoas idosas com alterações cognitivas, utilize documentos oficiais ou prontuários atualizados."),
          const Text(
              "• Evite alocar pessoas idosas com nomes semelhantes no mesmo quarto ou ala para prevenir confusões."),
          Image.asset("assets/images/seguranca/Foto_dez_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text("2. Medicamento certo",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Verifique se o medicamento em mãos corresponde ao prescrito."),
          const Text(
              "• Confirme se a pessoa idosa tem alergias ao medicamento. Se houver, não administre."),
          const Text(
              "• As alergias devem estar claramente registradas no prontuário."),
          const SizedBox(height: 10),
          const Text("3. Hora certa",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Garanta que o medicamento seja administrado no horário correto para maximizar a eficácia e manter a estabilidade da medicação."),
          const SizedBox(height: 10),
          const Text("4. Via certa",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Verifique a via de administração prescrita e se ela é adequada para o medicamento."),
          const Text(
              "• Higienize as mãos e realize antissepsia antes de administrar o medicamento por vias parenterais ou através de sondas."),
          const Text(
              "• Caso de dúvida, consulte o enfermeiro responsável ou o prescritor, se for possível."),
          Image.asset("assets/images/seguranca/Foto_onze_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const SizedBox(height: 10),
          const Text("5. Dose certa",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("• Confirme a dose e a unidade de medida prescrita."),
          const Text(
              "• Medicamentos 'se necessário' devem conter posologia clara. Nunca administre com base em prescrições vagas como 'se necessário' ou 'a critério médico'."),
          const SizedBox(height: 10),
          const Text("6. Registro certo",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Registre o horário de administração e qualquer ocorrência relevante (como falta de medicamento ou recusa da pessoa idosa) em documentos internos da ILPI."),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_doze_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const Text("7. Razão/Orientação correta",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Certifique-se de que a indicação do medicamento e sua posologia são adequadas às necessidades da pessoa idosa."),
          const Text(
              "• Explique à pessoa idosa o nome, o motivo e possíveis efeitos colaterais do medicamento, para que ela também participe da prevenção de erros."),
          const SizedBox(height: 10),
          const Text("8. Forma certa",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Verifique se a forma farmacêutica (como comprimido ou líquido) e a via de administração são adequadas à condição clínica da pessoa idosa."),
          const Text(
              "• Se necessário, triture o medicamento para administração via sonda, respeitando as recomendações."),
          const SizedBox(height: 10),
          Image.asset("assets/images/seguranca/Foto_treze_segun.png"),
          const Text("Fonte: www.freepik.com"),
          const Text("9. Resposta certa",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text(
              "• Monitore a eficácia do medicamento, observando se ele está gerando o efeito esperado ou se há reações adversas."),
          const Text(
              "• Registre qualquer resposta incomum, como alterações nos sinais vitais ou glicemia capilar."),
          const SizedBox(height: 10),
          const Text("Fonte: www.freepik.com"),
        ],
      ),
    );
  }
}
