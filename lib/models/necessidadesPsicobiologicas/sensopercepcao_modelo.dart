import 'package:cloud_firestore/cloud_firestore.dart';

class SensopercepcaoModelo {
  String id;
  String idosoId;
  bool acuidadeVisualDiminuida;
  bool usoLentesCorretivas;
  String condicaoAudicao;
  String usoProtese;
  bool dorEstimulacaoTatil;
  List<String> expressaoDor;
  DateTime dataRegistro;

  SensopercepcaoModelo({
    required this.id,
    required this.idosoId,
    required this.acuidadeVisualDiminuida,
    required this.usoLentesCorretivas,
    required this.condicaoAudicao,
    required this.usoProtese,
    required this.dorEstimulacaoTatil,
    required this.expressaoDor,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'acuidadeVisualDiminuida': acuidadeVisualDiminuida,
      'usoLentesCorretivas': usoLentesCorretivas,
      'condicaoAudicao': condicaoAudicao,
      'usoProtese': usoProtese,
      'dorEstimulacaoTatil': dorEstimulacaoTatil,
      'expressaoDor': expressaoDor,
      'dataRegistro': dataRegistro,
    };
  }

  factory SensopercepcaoModelo.fromMap(Map<String, dynamic> map) {
    return SensopercepcaoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      acuidadeVisualDiminuida: map['acuidadeVisualDiminuida'] ?? false,
      usoLentesCorretivas: map['usoLentesCorretivas'] ?? false,
      condicaoAudicao: map['condicaoAudicao'] ?? '',
      usoProtese: map['usoProtese'] ?? '',
      dorEstimulacaoTatil: map['dorEstimulacaoTatil'] ?? false,
      expressaoDor: List<String>.from(map['expressaoDor'] ?? []),
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 