import 'package:cloud_firestore/cloud_firestore.dart';

class SonoRepousoModelo {
  String id;
  String idosoId;
  bool sonoPreservado;
  List<String> horarioSono;
  List<String> caracteristicasSono;
  bool usaMedicamento;
  String medicamentoUtilizado;
  DateTime dataRegistro;

  SonoRepousoModelo({
    required this.id,
    required this.idosoId,
    required this.sonoPreservado,
    required this.horarioSono,
    required this.caracteristicasSono,
    required this.usaMedicamento,
    required this.medicamentoUtilizado,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'sonoPreservado': sonoPreservado,
      'horarioSono': horarioSono,
      'caracteristicasSono': caracteristicasSono,
      'usaMedicamento': usaMedicamento,
      'medicamentoUtilizado': medicamentoUtilizado,
      'dataRegistro': dataRegistro,
    };
  }

  factory SonoRepousoModelo.fromMap(Map<String, dynamic> map) {
    return SonoRepousoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      sonoPreservado: map['sonoPreservado'] ?? false,
      horarioSono: List<String>.from(map['horarioSono'] ?? []),
      caracteristicasSono: List<String>.from(map['caracteristicasSono'] ?? []),
      usaMedicamento: map['usaMedicamento'] ?? false,
      medicamentoUtilizado: map['medicamentoUtilizado'] ?? '',
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 