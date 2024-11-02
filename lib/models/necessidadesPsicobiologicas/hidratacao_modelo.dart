import 'package:cloud_firestore/cloud_firestore.dart';

class HidratacaoModelo {
  String id;
  String idosoId;
  bool hidratado;
  String turgorElasticidade;
  String ingestaHidrica;
  bool solicitaIngesta;
  bool precisaAuxilio;
  DateTime dataRegistro;

  HidratacaoModelo({
    required this.id,
    required this.idosoId,
    required this.hidratado,
    required this.turgorElasticidade,
    required this.ingestaHidrica,
    required this.solicitaIngesta,
    required this.precisaAuxilio,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'hidratado': hidratado,
      'turgorElasticidade': turgorElasticidade,
      'ingestaHidrica': ingestaHidrica,
      'solicitaIngesta': solicitaIngesta,
      'precisaAuxilio': precisaAuxilio,
      'dataRegistro': dataRegistro,
    };
  }

  factory HidratacaoModelo.fromMap(Map<String, dynamic> map) {
    return HidratacaoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      hidratado: map['hidratado'] ?? true,
      turgorElasticidade: map['turgorElasticidade'] ?? '',
      ingestaHidrica: map['ingestaHidrica'] ?? '',
      solicitaIngesta: map['solicitaIngesta'] ?? false,
      precisaAuxilio: map['precisaAuxilio'] ?? false,
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 