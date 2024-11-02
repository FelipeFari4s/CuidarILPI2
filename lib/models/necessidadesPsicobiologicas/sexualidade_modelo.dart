import 'package:cloud_firestore/cloud_firestore.dart';

class SexualidadeModelo {
  String id;
  String idosoId;
  bool refereDesejoSexual;
  bool presencaMasturbacao;
  DateTime dataRegistro;

  SexualidadeModelo({
    required this.id,
    required this.idosoId,
    required this.refereDesejoSexual,
    required this.presencaMasturbacao,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'refereDesejoSexual': refereDesejoSexual,
      'presencaMasturbacao': presencaMasturbacao,
      'dataRegistro': dataRegistro,
    };
  }

  factory SexualidadeModelo.fromMap(Map<String, dynamic> map) {
    return SexualidadeModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      refereDesejoSexual: map['refereDesejoSexual'] ?? false,
      presencaMasturbacao: map['presencaMasturbacao'] ?? false,
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 