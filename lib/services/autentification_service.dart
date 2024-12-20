import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/usuario_modelo.dart';

class AutentificationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

      // Atualizar displayName
      await userCredential.user!.updateDisplayName(nome);

      final usuario = UsuarioModelo(
        uid: userCredential.user!.uid,
        nome: nome,
        email: email,
        telefone: telefone,
        genero: genero,
        categoria: categoria,
        anosExperiencia: anosExperiencia,
        dataCadastro: DateTime.now(),
      );

      await _firestore
          .collection('usuarios')
          .doc(userCredential.user!.uid)
          .set(usuario.toMap());
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'O email já está em uso'; // Retorna mensagem de erro
      } else {
        return e.message; // Retorna mensagem de erro genérica
      }
    } catch (e) {
      return 'Erro ao cadastrar usuário: $e';
    }
  }

  Future<String?> loginUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      print('Tentando fazer login com email: $email'); // Log para debug
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
      print('Login realizado com sucesso'); // Log para debug
      return null;
    } on FirebaseAuthException catch (e) {
      print('Erro FirebaseAuth: ${e.code} - ${e.message}'); // Log detalhado
      switch (e.code) {
        case 'user-not-found':
          return 'Usuário não encontrado';
        case 'wrong-password':
          return 'Senha incorreta';
        case 'invalid-email':
          return 'Email inválido';
        default:
          return 'Erro ao fazer login: ${e.message}';
      }
    } catch (e) {
      print('Erro genérico: $e'); // Log para erro genérico
      return 'Erro ao tentar fazer login';
    }
  }

  Future<void> islogout() async {
    await _firebaseAuth.signOut();
  }

  Future<UsuarioModelo?> getUsuarioAtual() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    final doc = await _firestore.collection('usuarios').doc(user.uid).get();
    if (!doc.exists) return null;

    return UsuarioModelo.fromMap(doc.data()!);
  }

  Future<void> atualizarUsuario(UsuarioModelo usuario) async {
    try {
      // Atualiza o displayName no Authentication
      User? currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        await currentUser.updateDisplayName(usuario.nome);
      }

      // Atualiza os dados no Firestore
      await _firestore
          .collection('usuarios')
          .doc(usuario.uid)
          .update(usuario.toMap());
    } catch (e) {
      throw Exception('Erro ao atualizar usuário: $e');
    }
  }
}
