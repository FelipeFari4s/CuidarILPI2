import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/pages/longinEsingUp_screen/widgets/custom_button.dart';
import 'package:cuidar_ilpi/services/autentification_service.dart';
import 'package:cuidar_ilpi/_comum/my_snackbar.dart'; // Corrigido o caminho


class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  String? _selectedGender;
  String? _selectedCategory;
  int _experienceYears = 0;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  // Controllers para os campos de texto
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Chave global para o formulário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutentificationService _autentificationService = AutentificationService();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    InputDecoration inputDecoration(String hint, IconData icon,
        {bool isPassword = false, bool isConfirmPassword = false}) {
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
            : isConfirmPassword
                ? IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,  // Chave do formulário
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.0001),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    "Vamos começar!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Registre-se e faça parte da nossa comunidade",
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 46, 46),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: inputDecoration("Nome do Usuário", Icons.person),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration("Email", Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: inputDecoration("Telefone", Icons.phone),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu telefone';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height * 0.03),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Requisitos para a senha:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "- Mínimo de 6 caracteres\n"
                "- Deve conter pelo menos uma letra maiúscula\n"
                "- Deve conter pelo menos uma letra minúscula\n"
                "- Deve conter pelo menos um número\n",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: inputDecoration("Senha", Icons.lock, isPassword: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha';
                  }
                  // Validaão da senha
                  if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'A senha deve conter pelo menos uma letra maiúscula';
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'A senha deve conter pelo menos uma letra minúscula';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'A senha deve conter pelo menos um número';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: inputDecoration("Confirme a Senha", Icons.lock,
                    isConfirmPassword: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme sua senha';
                  }
                  if (value != passwordController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String>(
                decoration: inputDecoration("Sexo", Icons.wc),
                value: _selectedGender,
                items: ["Masculino", "Feminino", "Outros"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione seu sexo';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String>(
                decoration: inputDecoration("Categoria Profissional", Icons.work),
                value: _selectedCategory,
                items: [
                  "Cuidador(a) de Idosos",
                  "Técnico(a) de Enfermagem",
                  "Enfermeiro(a)"
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione sua categoria profissional';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tempo de Experiência (em anos)",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  Slider(
                    value: _experienceYears.toDouble(),
                    min: 0,
                    max: 60,
                    divisions: 60,
                    label: _experienceYears.toString(),
                    onChanged: (double value) {
                      setState(() {
                        _experienceYears = value.round();
                      });
                    },
                  ),
                  Text(
                    "${_experienceYears} anos",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            Container(
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                child: CustomButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  text: _isLoading ? "Carregando..." : "Continuar",
                  onPressed: _isLoading 
                    ? () {} // função vazia quando estiver carregando
                    : () {
                        _handleSignUp();
                      },
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Já tem conta ?"),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/login');
                  },
                  child: const Text(
                    " Entrar ",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      try {
        final erro = await _autentificationService.cadastrarUsuario(
          nome: nameController.text,
          email: emailController.text,
          senha: passwordController.text,
          telefone: phoneController.text,
          genero: _selectedGender ?? '',
          categoria: _selectedCategory ?? '',
          anosExperiencia: _experienceYears,
        );
        if (erro == null) {
          mostrarSnackbar(context: context, mensagem: 'Cadastro bem-sucedido', isError: false);
          // Fecha a tela atual e navega para home
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          mostrarSnackbar(context: context, mensagem: 'Erro ao cadastrar: $erro', isError: true);
        }
      } catch (e) {
        mostrarSnackbar(context: context, mensagem: 'Erro ao cadastrar: $e', isError: true);
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }
}
