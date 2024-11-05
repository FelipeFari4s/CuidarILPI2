import 'package:cloud_firestore/cloud_firestore.dart';

class EspiritualidadeModelo {
  String id;
  String idosoId;
  bool possuiReligiao;
  String qualReligiao;
  bool necessitaCerimonias;
  bool participaPraticasIntegrativas;
  String quaisPraticas;
  DateTime dataRegistro;

  EspiritualidadeModelo({
    required this.id,
    required this.idosoId,
    required this.possuiReligiao,
    required this.qualReligiao,
    required this.necessitaCerimonias,
    required this.participaPraticasIntegrativas,
    required this.quaisPraticas,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'possuiReligiao': possuiReligiao,
      'qualReligiao': qualReligiao,
      'necessitaCerimonias': necessitaCerimonias,
      'participaPraticasIntegrativas': participaPraticasIntegrativas,
      'quaisPraticas': quaisPraticas,
      'dataRegistro': dataRegistro,
    };
  }

  factory EspiritualidadeModelo.fromMap(Map<String, dynamic> map) {
    return EspiritualidadeModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      possuiReligiao: map['possuiReligiao'] ?? false,
      qualReligiao: map['qualReligiao'] ?? '',
      necessitaCerimonias: map['necessitaCerimonias'] ?? false,
      participaPraticasIntegrativas: map['participaPraticasIntegrativas'] ?? false,
      quaisPraticas: map['quaisPraticas'] ?? '',
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 