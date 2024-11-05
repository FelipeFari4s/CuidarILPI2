import 'package:cloud_firestore/cloud_firestore.dart';

class AtencaoAceitacaoModelo {
  String id;
  String idosoId;
  bool solicitaAtencao;
  String comoSolicitaAtencao;
  bool necessidadeAtencao;
  List<String> sentimentos; // 'Tristeza', 'Solidão', 'Felicidade'
  List<String> manifestacoes; // 'Choro', 'Deprimido', 'Isolamento', 'Irritado', 'Agressivo', 'Inquieto', 'Pensamento negativo'
  DateTime dataRegistro;

  AtencaoAceitacaoModelo({
    required this.id,
    required this.idosoId,
    required this.solicitaAtencao,
    required this.comoSolicitaAtencao,
    required this.necessidadeAtencao,
    required this.sentimentos,
    required this.manifestacoes,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'solicitaAtencao': solicitaAtencao,
      'comoSolicitaAtencao': comoSolicitaAtencao,
      'necessidadeAtencao': necessidadeAtencao,
      'sentimentos': sentimentos,
      'manifestacoes': manifestacoes,
      'dataRegistro': dataRegistro,
    };
  }

  factory AtencaoAceitacaoModelo.fromMap(Map<String, dynamic> map) {
    return AtencaoAceitacaoModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      solicitaAtencao: map['solicitaAtencao'] ?? false,
      comoSolicitaAtencao: map['comoSolicitaAtencao'] ?? '',
      necessidadeAtencao: map['necessidadeAtencao'] ?? false,
      sentimentos: List<String>.from(map['sentimentos'] ?? []),
      manifestacoes: List<String>.from(map['manifestacoes'] ?? []),
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 