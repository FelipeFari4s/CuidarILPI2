import 'package:cuidar_ilpi/Funcionalidade/conteudo_fun/coag.dart';
import 'package:cuidar_ilpi/Funcionalidade/conteudo_fun/comunicacoes.dart';
import 'package:cuidar_ilpi/Funcionalidade/conteudo_fun/fun.dart';
import 'package:cuidar_ilpi/Funcionalidade/conteudo_fun/humor_comportamento.dart';
import 'package:cuidar_ilpi/Funcionalidade/conteudo_fun/mob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FunScreen extends StatelessWidget {
  const FunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          _buildAppBar(), // Reutiliza a AppBar
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
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildButton(
                  context,
                  "Conceitos importantes sobre funcionalidade global da pessoa idosa ",
                  const Color(0xFFEBF3F7), // Cor de fundo atualizada
                  const Color(0xFF3E5C68), // Cor da fonte atualizada
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const funorientacoesScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Cognição  ",
                  const Color(0xFFD3E6F2), // Cor de fundo atualizada
                  const Color(0xFF3E5C68), // Cor da fonte atualizada
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const coagScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Humor/Comportamento",
                  const Color(0xFFBAD6E2), // Cor de fundo atualizada
                  const Color(0xFF3E5C68),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const humorComportamentoScreen(),
                      ),
                    );
                  }, // Cor da fonte atualizada
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Mobilidade ",
                  const Color(0xFFA3C3CE), // Cor de fundo atualizada
                  const Color(0xFFFFFFFF), // Texto branco
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const mobScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Comunicação",
                  const Color(0xFF88ADB7), // Cor de fundo atualizada
                  Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComunicacoesScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reutiliza a AppBar da tela principal
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
              icon: SvgPicture.asset(
                "assets/images/home/burger_icon.svg",
                height: 30,
              ),
              onPressed: () {
                print("Menu aberto!");
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
      onTap: onTap ?? () => print("$title clicado!"), // Ação do clique
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
