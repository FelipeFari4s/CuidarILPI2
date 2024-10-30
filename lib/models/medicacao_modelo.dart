class MedicacaoModelo {
  final String id;
  final String idIdoso;
  final String nome;
  final String dosagem;
  final String via;
  final String horario;
  bool checado;
  String observacao;
  final DateTime data;

  MedicacaoModelo({
    required this.id,
    required this.idIdoso,
    required this.nome,
    required this.dosagem,
    required this.via,
    required this.horario,
    this.checado = false,
    this.observacao = '',
    required this.data,
  });
} 