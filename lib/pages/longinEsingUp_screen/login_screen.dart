import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/pages/longinEsingUp_screen/widgets/custom_button.dart';
import 'package:cuidar_ilpi/_comum/my_snackbar.dart';
import 'package:cuidar_ilpi/services/autentification_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AutentificationService _autentificationService = AutentificationService();
  // Variável para controlar a visibilidade da senha
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    InputDecoration inputDecoration(String hint, IconData icon,
        {bool isPassword = false}) {
      return InputDecoration(
        fillColor: const Color.fromARGB(255, 240, 240, 240),
        filled: true,
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey[600],
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(height: height * 0.35), // Espaço acima da imagem
                Container(
                  height: height * 0.35,
                  child: Image.asset(
                      "assets/images/login_singUp/logo_oficial.png"),
                ),
              ],
            ),
            // Removido o texto "Seja Bem-vindo..."
            SizedBox(height: height * 0.00001),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration("Email", Icons.email),
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration:
                    inputDecoration("Senha", Icons.lock, isPassword: true),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              alignment: Alignment.center,
              child: const Text(
                " Esqueceu a senha? ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.blue),
              ),
            ),
            SizedBox(height: height * 0.035),
            Container(
              height: 40,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                child: CustomButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  text: "Login",
                  onPressed: () {
                    // Chama o método de login
                    _autentificationService.loginUsuario(
                      email: emailController.text,
                      senha: passwordController.text,
                    ).then((erro) {
                      if (erro == null) {
                        // Login bem-sucedido
                        mostrarSnackbar(context: context, mensagem: 'Login bem-sucedido', isError: false);
                        Navigator.pushNamed(context, '/home');
                        print("Login bem-sucedido");
                      } else {
                        // Exibe mensagem de erro
                        mostrarSnackbar(context: context, mensagem: erro, isError: true);
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Ou entre com",
                style: TextStyle(
                  color: Color.fromARGB(255, 56, 54, 54),
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Facebook",
                      icon: Icons.facebook,
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: CustomButton(
                      text: "Google",
                      color: const Color.fromARGB(255, 0, 0, 0),
                      image: Image.asset(
                          "assets/images/login_singUp/google-symbol.png"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Não tem conta, crie uma aqui?"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/sign_up');
                  },
                  child: const Text(
                    " Registre-se",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
