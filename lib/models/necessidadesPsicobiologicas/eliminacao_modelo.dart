import 'package:cloud_firestore/cloud_firestore.dart';

class EliminacaoModelo {
  String id;
  String idosoId;
  List<String> tiposDiurese;
  String aspectoDiurese;
  String eliminacaoIntestinal;
  String aspectoFezes;
  DateTime dataRegistro;

  EliminacaoModelo({
    required this.id,
    required this.idosoId,
    required this.tiposDiurese, // Pode ser lista vazia
    required this.aspectoDiurese, // Pode ser string vazia
    required this.eliminacaoIntestinal, // Pode ser string vazia
    required this.aspectoFezes, // Pode ser string vazia
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'tiposDiurese': tiposDiurese,
      'aspectoDiurese': aspectoDiurese,
      'eliminacaoIntestinal': eliminacaoIntestinal,
      'aspectoFezes': aspectoFezes,
      'dataRegistro': dataRegistro,
    };
  }

  factory EliminacaoModelo.fromMap(Map<String, dynamic> map) {
    return EliminacaoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      tiposDiurese: List<String>.from(map['tiposDiurese'] ?? []),
      aspectoDiurese: map['aspectoDiurese'] ?? '',
      eliminacaoIntestinal: map['eliminacaoIntestinal'] ?? '',
      aspectoFezes: map['aspectoFezes'] ?? '',
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 