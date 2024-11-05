class UsuarioModelo {
  final String uid;
  final String nome;
  final String email;
  final String telefone;
  final String genero;
  final String categoria;
  final int anosExperiencia;
  final DateTime dataCadastro;

  UsuarioModelo({
    required this.uid,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.genero,
    required this.categoria,
    required this.anosExperiencia,
    required this.dataCadastro,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'genero': genero,
      'categoria': categoria,
      'anosExperiencia': anosExperiencia,
      'dataCadastro': dataCadastro,
    };
  }

  factory UsuarioModelo.fromMap(Map<String, dynamic> map) {
    return UsuarioModelo(
      uid: map['uid'] ?? '',
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      telefone: map['telefone'] ?? '',
      genero: map['genero'] ?? '',
      categoria: map['categoria'] ?? '',
      anosExperiencia: map['anosExperiencia'] ?? 0,
      dataCadastro: map['dataCadastro']?.toDate() ?? DateTime.now(),
    );
  }
} 