import 'package:cloud_firestore/cloud_firestore.dart';

class RegulacaoNeurologicaModelo {
  final String id;
  final String idosoId;
  final String nivelConsciencia;
  final String memoria;
  final DateTime dataRegistro;

  RegulacaoNeurologicaModelo({
    required this.id,
    required this.idosoId,
    required this.nivelConsciencia,
    required this.memoria,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'nivelConsciencia': nivelConsciencia,
      'memoria': memoria,
      'dataRegistro': dataRegistro,
    };
  }

  factory RegulacaoNeurologicaModelo.fromMap(Map<String, dynamic> map) {
    return RegulacaoNeurologicaModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      nivelConsciencia: map['nivelConsciencia'] ?? '',
      memoria: map['memoria'] ?? '',
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 