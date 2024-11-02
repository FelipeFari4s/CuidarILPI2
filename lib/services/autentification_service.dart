import 'package:firebase_auth/firebase_auth.dart';

class AutentificationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AutentificationService() {
    // Habilita persistência
    _firebaseAuth.setPersistence(Persistence.LOCAL);
  }

  Future<String?> cadastrarUsuario({
    required String nome,
    required String email,
    required String senha,
    required String telefone,
    required String genero,
    required String categoria,
    required int anosExperiencia,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      await userCredential.user!.updateDisplayName(nome); 
      // Aqui você pode salvar os dados adicionais no Firestore, se necessário
      return null; // Cadastro bem-sucedido
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'O email já está em uso'; // Retorna mensagem de erro
      } else {
        return e.message; // Retorna mensagem de erro genérica
      }
    }

    
  }

  Future<String?> loginUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
      return null; // Login bem-sucedido
    } on FirebaseAuthException catch (e) {
      print('Código de erro: ${e.code}'); // Para depuração
      // Retorna uma mensagem genérica para erros de login
      return 'Email ou senha inválida';
    } catch (e) {
      print('Erro: $e'); // Captura qualquer outro erro
      return 'Erro ao tentar fazer login';
    }
  }

  Future<void> islogout() async {
    await _firebaseAuth.signOut();
  }
}
