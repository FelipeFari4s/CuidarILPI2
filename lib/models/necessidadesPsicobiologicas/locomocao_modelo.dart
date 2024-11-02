import 'package:cloud_firestore/cloud_firestore.dart';

class LocomocaoModelo {
  String id;
  String idosoId;
  bool deambula;
  String condicaoMobilidade; // 'Normal', 'Acamado', 'Cadeirante'
  bool auxilioDeambular;
  List<String> usoOrtese; // 'Andador', 'Cadeira de rodas', 'Bengala'
  bool equilibrioPreservado;
  bool exercicioFisicoRegular;
  String tipoExercicio;
  bool limitacaoFisica;
  String tipoLimitacao;
  bool auxilioMovimentacao;
  bool rigidezPescoco;
  DateTime dataRegistro;

  LocomocaoModelo({
    required this.id,
    required this.idosoId,
    required this.deambula,
    required this.condicaoMobilidade,
    required this.auxilioDeambular,
    required this.usoOrtese,
    required this.equilibrioPreservado,
    required this.exercicioFisicoRegular,
    required this.tipoExercicio,
    required this.limitacaoFisica,
    required this.tipoLimitacao,
    required this.auxilioMovimentacao,
    required this.rigidezPescoco,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'deambula': deambula,
      'condicaoMobilidade': condicaoMobilidade,
      'auxilioDeambular': auxilioDeambular,
      'usoOrtese': usoOrtese,
      'equilibrioPreservado': equilibrioPreservado,
      'exercicioFisicoRegular': exercicioFisicoRegular,
      'tipoExercicio': tipoExercicio,
      'limitacaoFisica': limitacaoFisica,
      'tipoLimitacao': tipoLimitacao,
      'auxilioMovimentacao': auxilioMovimentacao,
      'rigidezPescoco': rigidezPescoco,
      'dataRegistro': dataRegistro,
    };
  }

  factory LocomocaoModelo.fromMap(Map<String, dynamic> map) {
    return LocomocaoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      deambula: map['deambula'] ?? false,
      condicaoMobilidade: map['condicaoMobilidade'] ?? 'Normal',
      auxilioDeambular: map['auxilioDeambular'] ?? false,
      usoOrtese: List<String>.from(map['usoOrtese'] ?? []),
      equilibrioPreservado: map['equilibrioPreservado'] ?? false,
      exercicioFisicoRegular: map['exercicioFisicoRegular'] ?? false,
      tipoExercicio: map['tipoExercicio'] ?? '',
      limitacaoFisica: map['limitacaoFisica'] ?? false,
      tipoLimitacao: map['tipoLimitacao'] ?? '',
      auxilioMovimentacao: map['auxilioMovimentacao'] ?? false,
      rigidezPescoco: map['rigidezPescoco'] ?? false,
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 