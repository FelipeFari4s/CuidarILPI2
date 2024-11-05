class SinaisVitaisModelo {
  String id;
  String idosoId;
  DateTime dataRegistro;
  String temperatura;
  String frequenciaCardiaca;
  String respiracao;
  String pressaoArterial;
  String observacao;

  SinaisVitaisModelo({
    required this.id,
    required this.idosoId,
    required this.dataRegistro,
    required this.temperatura,
    required this.frequenciaCardiaca,
    required this.respiracao,
    required this.pressaoArterial,
    this.observacao = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'dataRegistro': dataRegistro.toIso8601String(),
      'temperatura': temperatura,
      'frequenciaCardiaca': frequenciaCardiaca,
      'respiracao': respiracao,
      'pressaoArterial': pressaoArterial,
      'observacao': observacao,
    };
  }

  factory SinaisVitaisModelo.fromMap(Map<String, dynamic> map) {
    return SinaisVitaisModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      dataRegistro: DateTime.parse(map['dataRegistro']),
      temperatura: map['temperatura'] ?? '',
      frequenciaCardiaca: map['frequenciaCardiaca'] ?? '',
      respiracao: map['respiracao'] ?? '',
      pressaoArterial: map['pressaoArterial'] ?? '',
      observacao: map['observacao'] ?? '',
    );
  }
} 