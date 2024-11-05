import 'package:cuidar_ilpi/Seguranca/Conteudo/Adm.dart';
import 'package:cuidar_ilpi/Seguranca/Conteudo/Comunicacao.dart';
import 'package:cuidar_ilpi/Seguranca/Conteudo/Iden.dart';
import 'package:cuidar_ilpi/Seguranca/Conteudo/PrevensaoLesao.dart';
import 'package:cuidar_ilpi/Seguranca/Conteudo/PrevensaoQuedas.dart';
import 'package:cuidar_ilpi/Seguranca/Conteudo/Prevesencao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';
// ... outros imports existentes ...

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User currentUser = FirebaseAuth.instance.currentUser!;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                "Segurança do Cuidado à Pessoa Idosa",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500, // Roboto Medium
                  color: Color(0xFF7C6439), // Cor cinza escuro
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF7C6439), // Linha cinza escura
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
                  "Identificação correta da pessoa idosa",
                  const Color(0xFFFFF4E1), // Cor de fundo atualizada
                  const Color(0xFF7C6439), // Cor da fonte atualizada
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IdenScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Prevenção e controle de infecção ",
                  const Color(0xFFFFEBB8), // Cor de fundo atualizada
                  const Color(0xFF7C6439), // Cor da fonte atualizada
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrevensaoScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Administração segura dos medicamentos",
                  const Color(0xFFFFDE9C), // Cor de fundo atualizada
                  const Color(0xFF7C6439),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdmScreen(),
                      ),
                    );
                  }, // Cor da fonte atualizada
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Prevensão de Quedas ",
                  const Color(0xFFFFCF7B), // Cor de fundo atualizada
                  const Color(0xFFFFFFFF), // Texto branco
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrevenQuedasScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Prevensão de lesão por pressão",
                  const Color(0xFFffC95C), // Cor de fundo atualizada
                  Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrevenLesaoScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildButton(
                  context,
                  "Comunicação Efetiva",
                  const Color(0xFFFFC23B), // Cor de fundo atualizada
                  Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComunScreen(),
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
