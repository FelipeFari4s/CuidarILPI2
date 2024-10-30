import 'package:cuidar_ilpi/Orientacoes/conteudo/Alimentacao.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/HigieneCorporal.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/Incontinencias.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/Mudancas.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/Sono.dart';
import 'package:cuidar_ilpi/Orientacoes/conteudo/Vestuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DailyActivitiesScreen extends StatelessWidget {
  const DailyActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          _buildAppBar(context), // Reutiliza a AppBar
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
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildButton(
                  context,
                  "Alimentação",
                  const Color(0xFFCAE5D1), // Cor de fundo atualizada
                  const Color(0xFF43604C), // Cor da fonte atualizada
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlimentacaoScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Higiene Corporal",
                  const Color(0xFFA1D1AD), // Cor de fundo atualizada
                  const Color(0xFF43604C), // Cor da fonte atualizada
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HigieneScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Vestuário",
                  const Color(0xFF80B78C), // Cor de fundo atualizada
                  const Color(0xFF43604C),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VestuarioScreen(),
                      ),
                    );
                  }, // Cor da fonte atualizada
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Incontinências",
                  const Color(0xFF5C9B68), // Cor de fundo atualizada
                  Colors.white, // Texto branco
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InconScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Mudanças de Posição Corporal",
                  const Color(0xFF4F8458), // Cor de fundo atualizada
                  Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MudancasScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Sono",
                  const Color(0xFF386D3E), // Cor de fundo atualizada
                  Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SonoScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reutiliza a AppBar da tela principal
  Widget _buildAppBar(BuildContext context) { // Adicionado parâmetro context
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
              icon: SvgPicture.asset(
                "assets/images/home/burger_icon.svg",
                height: 30,
              ),
              onPressed: ()  { 
              },
            ),
          ),
        ],
      ),
    );
  }

  // Função que cria botões verdes
  Widget _buildButton(
    BuildContext context,
    String title,
    Color color,
    Color textColor, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () => print("$title clicado!") ,// Ação do clique
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: textColor, // Cor do texto dinâmica
          ),
        ),
      ),
    );
  }
}
