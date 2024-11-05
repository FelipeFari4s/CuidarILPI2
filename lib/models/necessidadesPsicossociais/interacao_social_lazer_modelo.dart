import 'package:cloud_firestore/cloud_firestore.dart';

class InteracaoSocialLazerModelo {
  String id;
  String idosoId;
  bool participaAtividadesGrupo;
  bool recebeVisita;
  String visitantes;
  bool solicitaVisita;
  bool interageResidentes;
  bool agrideResidentes;
  bool sofreAgressao;
  bool realizaPasseios;
  List<String> atividadesPreferidas; // 'Jogos', 'Música', 'Dança', etc
  String outrasAtividades;
  DateTime dataRegistro;

  InteracaoSocialLazerModelo({
    required this.id,
    required this.idosoId,
    required this.participaAtividadesGrupo,
    required this.recebeVisita,
    required this.visitantes,
    required this.solicitaVisita,
    required this.interageResidentes,
    required this.agrideResidentes,
    required this.sofreAgressao,
    required this.realizaPasseios,
    required this.atividadesPreferidas,
    required this.outrasAtividades,
    required this.dataRegistro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'participaAtividadesGrupo': participaAtividadesGrupo,
      'recebeVisita': recebeVisita,
      'visitantes': visitantes,
      'solicitaVisita': solicitaVisita,
      'interageResidentes': interageResidentes,
      'agrideResidentes': agrideResidentes,
      'sofreAgressao': sofreAgressao,
      'realizaPasseios': realizaPasseios,
      'atividadesPreferidas': atividadesPreferidas,
      'outrasAtividades': outrasAtividades,
      'dataRegistro': dataRegistro,
    };
  }

  factory InteracaoSocialLazerModelo.fromMap(Map<String, dynamic> map) {
    return InteracaoSocialLazerModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      participaAtividadesGrupo: map['participaAtividadesGrupo'] ?? false,
      recebeVisita: map['recebeVisita'] ?? false,
      visitantes: map['visitantes'] ?? '',
      solicitaVisita: map['solicitaVisita'] ?? false,
      interageResidentes: map['interageResidentes'] ?? false,
      agrideResidentes: map['agrideResidentes'] ?? false,
      sofreAgressao: map['sofreAgressao'] ?? false,
      realizaPasseios: map['realizaPasseios'] ?? false,
      atividadesPreferidas: List<String>.from(map['atividadesPreferidas'] ?? []),
      outrasAtividades: map['outrasAtividades'] ?? '',
      dataRegistro: (map['dataRegistro'] as Timestamp).toDate(),
    );
  }
} 