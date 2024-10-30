class AntecedentesPessoaisModelo {
  String id;
  String idosoId;
  Map<String, bool> comorbidades;
  String outrasComorbidades;
  bool internacaoUltimosSeisMeses;
  bool etilista;
  bool tabagista;

  AntecedentesPessoaisModelo({
    required this.id,
    required this.idosoId,
    required this.comorbidades,
    required this.outrasComorbidades,
    required this.internacaoUltimosSeisMeses,
    required this.etilista,
    required this.tabagista,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idosoId': idosoId,
      'comorbidades': comorbidades,
      'outrasComorbidades': outrasComorbidades,
      'internacaoUltimosSeisMeses': internacaoUltimosSeisMeses,
      'etilista': etilista,
      'tabagista': tabagista,
    };
  }

  factory AntecedentesPessoaisModelo.fromMap(Map<String, dynamic> map) {
    return AntecedentesPessoaisModelo(
      id: map['id'] ?? '',
      idosoId: map['idosoId'] ?? '',
      comorbidades: Map<String, bool>.from(map['comorbidades'] ?? {}),
      outrasComorbidades: map['outrasComorbidades'] ?? '',
      internacaoUltimosSeisMeses: map['internacaoUltimosSeisMeses'] ?? false,
      etilista: map['etilista'] ?? false,
      tabagista: map['tabagista'] ?? false,
    );
  }
}
