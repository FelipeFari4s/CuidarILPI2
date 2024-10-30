class IdosoModelo {
  String id;
  String nome;
  String nascimento;
  String idade;
  String sexo;
  String religiao;
  String escolaridade;
  String ocupacaoAnterior;
  String aposentado;
  String dataInstitucionalizacao;
  String motivoInstitucionalizacao;
  String possuiFamiliares;

  IdosoModelo({
    required this.id,
    required this.nome,
    required this.nascimento,
    required this.idade,
    required this.sexo,
    required this.religiao,
    required this.escolaridade,
    required this.ocupacaoAnterior,
    required this.aposentado,
    required this.dataInstitucionalizacao,
    required this.motivoInstitucionalizacao,
    required this.possuiFamiliares,
  });

  IdosoModelo.fromMap(Map<String, dynamic> map) 
  : id = map['id'] ?? '',
    nome = map['nome'] ?? '',
    nascimento = map['nascimento'] ?? '',
    idade = map['idade'] ?? '',
    sexo = map['sexo'] ?? '',
    religiao = map['religiao'] ?? '',
    escolaridade = map['escolaridade'] ?? '',
    ocupacaoAnterior = map['ocupacaoAnterior'] ?? '',
    aposentado = map['aposentado'] ?? '',
    dataInstitucionalizacao = map['dataInstitucionalizacao'] ?? '',
    motivoInstitucionalizacao = map['motivoInstitucionalizacao'] ?? '',
    possuiFamiliares = map['possuiFamiliares'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'nascimento': nascimento,
      'idade': idade,
      'sexo': sexo,
      'religiao': religiao,
      'escolaridade': escolaridade,
      'ocupacaoAnterior': ocupacaoAnterior,
      'aposentado': aposentado,
      'dataInstitucionalizacao': dataInstitucionalizacao,
      'motivoInstitucionalizacao': motivoInstitucionalizacao,
      'possuiFamiliares': possuiFamiliares,
    };
  }
}
