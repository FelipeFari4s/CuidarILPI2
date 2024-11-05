class MedicacaoModelo {
  String id;
  String idosoId;
  String nome;
  String dose;
  String via;
  List<String> horarios;
  DateTime dataRegistro;
  bool checagem;
  String observacao;

  MedicacaoModelo({
    required this.id,
    required this.idosoId,
    required this.nome,
    required this.dose,
    required this.via,
    required this.horarios,
    required this.dataRegistro,
    this.checagem = false,
    this.observacao = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'nome': nome,
      'dose': dose,
      'via': via,
      'horarios': horarios,
      'dataRegistro': dataRegistro.toIso8601String(),
      'checagem': checagem,
      'observacao': observacao,
    };
  }

  factory MedicacaoModelo.fromMap(Map<String, dynamic> map) {
    return MedicacaoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      nome: map['nome'] ?? '',
      dose: map['dose'] ?? '',
      via: map['via'] ?? '',
      horarios: List<String>.from(map['horarios'] ?? []),
      dataRegistro: DateTime.parse(map['dataRegistro']),
      checagem: map['checagem'] ?? false,
      observacao: map['observacao'] ?? '',
    );
  }
} 