import 'package:cloud_firestore/cloud_firestore.dart';

class ComunicacaoModelo {
  String id;
  String idosoId;
  bool comunicacaoVerbalNormal;
  String causaPrejuizo;
  List<String> comunicacaoNaoVerbal; // 'Expressões Faciais', 'Gesto', 'Expressão Corporal'
  DateTime dataRegistro;

  ComunicacaoModelo({
    required this.id,
    required this.idosoId,
    required this.comunicacaoVerbalNormal,
    required this.causaPrejuizo,
    required this.comunicacaoNaoVerbal,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'comunicacaoVerbalNormal': comunicacaoVerbalNormal,
      'causaPrejuizo': causaPrejuizo,
      'comunicacaoNaoVerbal': comunicacaoNaoVerbal,
      'dataRegistro': dataRegistro,
    };
  }

  factory ComunicacaoModelo.fromMap(Map<String, dynamic> map) {
    return ComunicacaoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      comunicacaoVerbalNormal: map['comunicacaoVerbalNormal'] ?? true,
      causaPrejuizo: map['causaPrejuizo'] ?? '',
      comunicacaoNaoVerbal: List<String>.from(map['comunicacaoNaoVerbal'] ?? []),
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 