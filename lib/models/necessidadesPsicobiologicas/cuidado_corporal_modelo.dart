import 'package:cloud_firestore/cloud_firestore.dart';

class CuidadoCorporalModelo {
  String id;
  String idosoId;
  String higieneCorporal;
  bool auxilioBanho;
  bool auxilioVestimenta;
  String higieneBucal;
  bool auxilioHigieneBucal;
  bool problemasDentarios;
  bool gengivites;
  DateTime dataRegistro;

  CuidadoCorporalModelo({
    required this.id,
    required this.idosoId,
    required this.higieneCorporal,
    required this.auxilioBanho,
    required this.auxilioVestimenta,
    required this.higieneBucal,
    required this.auxilioHigieneBucal,
    required this.problemasDentarios,
    required this.gengivites,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'higieneCorporal': higieneCorporal,
      'auxilioBanho': auxilioBanho,
      'auxilioVestimenta': auxilioVestimenta,
      'higieneBucal': higieneBucal,
      'auxilioHigieneBucal': auxilioHigieneBucal,
      'problemasDentarios': problemasDentarios,
      'gengivites': gengivites,
      'dataRegistro': dataRegistro,
    };
  }

  factory CuidadoCorporalModelo.fromMap(Map<String, dynamic> map) {
    return CuidadoCorporalModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      higieneCorporal: map['higieneCorporal'] ?? 'Satisfatória',
      auxilioBanho: map['auxilioBanho'] ?? false,
      auxilioVestimenta: map['auxilioVestimenta'] ?? false,
      higieneBucal: map['higieneBucal'] ?? 'Satisfatória',
      auxilioHigieneBucal: map['auxilioHigieneBucal'] ?? false,
      problemasDentarios: map['problemasDentarios'] ?? false,
      gengivites: map['gengivites'] ?? false,
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 