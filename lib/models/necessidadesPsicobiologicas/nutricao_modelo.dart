import 'package:cloud_firestore/cloud_firestore.dart';

class NutricaoModelo {
  String id;
  String idosoId;
  double altura;
  double peso;
  double imc;
  String aceitacaoAlimentar;
  bool disfagia;
  bool engasgo;
  bool auxilioAlimentacao;
  String viaAdministracao;
  List<String> dispositivoAlimentacao;
  bool dietaEnteral;
  bool usoProtese;
  DateTime dataRegistro;

  NutricaoModelo({
    required this.id,
    required this.idosoId,
    required this.altura,
    required this.peso,
    required this.imc,
    required this.aceitacaoAlimentar,
    required this.disfagia,
    required this.engasgo,
    required this.auxilioAlimentacao,
    required this.viaAdministracao,
    required this.dispositivoAlimentacao,
    required this.dietaEnteral,
    required this.usoProtese,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'altura': altura,
      'peso': peso,
      'imc': imc,
      'aceitacaoAlimentar': aceitacaoAlimentar,
      'disfagia': disfagia,
      'engasgo': engasgo,
      'auxilioAlimentacao': auxilioAlimentacao,
      'viaAdministracao': viaAdministracao,
      'dispositivoAlimentacao': dispositivoAlimentacao,
      'dietaEnteral': dietaEnteral,
      'usoProtese': usoProtese,
      'dataRegistro': dataRegistro,
    };
  }

  factory NutricaoModelo.fromMap(Map<String, dynamic> map) {
    return NutricaoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      altura: map['altura']?.toDouble() ?? 0.0,
      peso: map['peso']?.toDouble() ?? 0.0,
      imc: map['imc']?.toDouble() ?? 0.0,
      aceitacaoAlimentar: map['aceitacaoAlimentar'] ?? '',
      disfagia: map['disfagia'] ?? false,
      engasgo: map['engasgo'] ?? false,
      auxilioAlimentacao: map['auxilioAlimentacao'] ?? false,
      viaAdministracao: map['viaAdministracao'] ?? '',
      dispositivoAlimentacao: List<String>.from(map['dispositivoAlimentacao'] ?? []),
      dietaEnteral: map['dietaEnteral'] ?? false,
      usoProtese: map['usoProtese'] ?? false,
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 