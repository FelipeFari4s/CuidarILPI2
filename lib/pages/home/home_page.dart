import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cuidar_ilpi/services/autentification_service.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          _buildAppBar(), // AppBar com bordas arredondadas
          const SizedBox(height: 35), // Pequeno espaçamento abaixo da AppBar
          _buildWideButton(
            context,
            "Perfil do Usuário",
            "assets/images/home/Icone_Perfil.svg",
            const Color(0xFFF9AAAA), // Cor do botão perfil
            '/monitoramento',
          ),
          const SizedBox(height: 10), // Espaçamento entre perfil e grid
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                categoryCard(
                  context,
                  "Monitoramento de Saúde da Pessoa Idosa",
                  "assets/images/home/Icone_Monitoramento.svg",
                  const Color(0xFFFAE3DD), // Cor do botão monitoramento
                  '/monitoring',
                ),
                categoryCard(
                  context,
                  "Orientações para Atividades da Vida Diária",
                  "assets/images/home/Icone_Orientações.svg",
                  Color(0xFFCAE5D1), // Cor do botão orientações
                  '/daily_activities',
                ),
                categoryCard(
                  context,
                  "Segurança do Cuidado à Pessoa Idosa",
                  "assets/images/home/Icone_Seguranca.svg",
                  const Color(0xFFFFDA8F), // Cor do botão segurança
                  '/safety',
                ),
                categoryCard(
                  context,
                  "Funcionalidade Global da Pessoa Idosa",
                  "assets/images/home/Icone_Funcionalidade.svg",
                  const Color(0xFFD3E6F2), // Cor do botão funcionalidade
                  '/fun',
                ),
              ],
            ),
          ),
          const SizedBox(
              height: 10), // Pequeno espaço acima do botão de referências
          _buildWideButtonWithSubtitle(
            context,
            "Referências Bibliográficas",
            "Consultadas",
            "assets/images/home/Icone_Referencias.svg",
            const Color(0xFFE0C7F9), // Cor do botão referências
            '/references',
          ),
          const SizedBox(height: 38), // Margem inferior
        ],
      ),
    );
  }

  // AppBar com bordas arredondadas
  Widget _buildAppBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32), // Arredondando apenas a parte inferior
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Espaçamento entre os itens
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 5), // Ajusta o espaço acima da logo
            child: Image.asset(
              "assets/images/home/logo_home_semfundo.png", // Logo do app
              height: 100,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 10), // Ajusta o espaço acima do ícone
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/images/home/burger_icon.svg",
                height: 30,
              ),
              onPressed: () {
                print("Menu aberto!");
                AutentificationService().islogout();
                //Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }

  // Botão largo (Perfil e Referências)
  Widget _buildWideButton(BuildContext context, String title, String iconPath,
      Color color, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Espaça o ícone e o texto
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 3.0), // Espaçamento à esquerda do ícone
              child: SvgPicture.asset(
                iconPath,
                height: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0), // Ajuste o valor conforme necessário
              child: Text(
                title,
                textAlign: TextAlign.right, // Alinha o texto à direita
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF707070), // Cor da fonte
                  fontFamily: 'Roboto', // Definindo a fonte Roboto
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Botão de Referências com subtítulo
  Widget _buildWideButtonWithSubtitle(BuildContext context, String title,
      String subtitle, String iconPath, Color color, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: SvgPicture.asset(
                iconPath,
                height: 90,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF707070), // Cor da fonte
                        fontFamily: 'Roboto', // Definindo a fonte Roboto
                      ),
                    ),
                    Text(
                      subtitle,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 12, // Pode ajustar o tamanho da fonte aqui
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF707070), // Cor da fonte
                        fontFamily: 'Roboto', // Definindo a fonte Roboto
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cards pequenos no Grid
  Widget categoryCard(BuildContext context, String title, String iconPath,
      Color color, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12, // Texto menor
                fontWeight: FontWeight.bold,
                color: Color(0xFF707070), // Cor da fonte
                fontFamily: 'Roboto', // Definindo a fonte Roboto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
