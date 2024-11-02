import 'package:cloud_firestore/cloud_firestore.dart';

class SegurancaFisicaModelo {
  String id;
  String idosoId;
  bool usoCorrimao;
  bool gradesCama;
  DateTime dataRegistro;

  SegurancaFisicaModelo({
    required this.id,
    required this.idosoId,
    required this.usoCorrimao,
    required this.gradesCama,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'usoCorrimao': usoCorrimao,
      'gradesCama': gradesCama,
      'dataRegistro': dataRegistro,
    };
  }

  factory SegurancaFisicaModelo.fromMap(Map<String, dynamic> map) {
    return SegurancaFisicaModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      usoCorrimao: map['usoCorrimao'] ?? false,
      gradesCama: map['gradesCama'] ?? false,
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 