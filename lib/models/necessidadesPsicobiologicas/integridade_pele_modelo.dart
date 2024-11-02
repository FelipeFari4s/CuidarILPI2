import 'package:cloud_firestore/cloud_firestore.dart';

class IntegridadePeleModelo {
  String id;
  String idosoId;
  String condicaoPele;
  bool presencaLesao;
  String localLesao;
  String coloracaoPele;
  String localColoracao;
  String nivelEdema;
  String localEdema;
  DateTime dataRegistro;

  IntegridadePeleModelo({
    required this.id,
    required this.idosoId,
    required this.condicaoPele,
    required this.presencaLesao,
    required this.localLesao,
    required this.coloracaoPele,
    required this.localColoracao,
    required this.nivelEdema,
    required this.localEdema,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'condicaoPele': condicaoPele,
      'presencaLesao': presencaLesao,
      'localLesao': localLesao,
      'coloracaoPele': coloracaoPele,
      'localColoracao': localColoracao,
      'nivelEdema': nivelEdema,
      'localEdema': localEdema,
      'dataRegistro': dataRegistro,
    };
  }

  factory IntegridadePeleModelo.fromMap(Map<String, dynamic> map) {
    return IntegridadePeleModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      condicaoPele: map['condicaoPele'] ?? '',
      presencaLesao: map['presencaLesao'] ?? false,
      localLesao: map['localLesao'] ?? '',
      coloracaoPele: map['coloracaoPele'] ?? '',
      localColoracao: map['localColoracao'] ?? '',
      nivelEdema: map['nivelEdema'] ?? '',
      localEdema: map['localEdema'] ?? '',
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 