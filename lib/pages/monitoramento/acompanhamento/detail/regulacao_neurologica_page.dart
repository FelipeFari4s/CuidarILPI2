import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/regulacao_neurologica_modelo.dart';
import 'package:uuid/uuid.dart';

class RegulacaoNeurologicaPage extends StatefulWidget {
  final IdosoModelo idoso;

  RegulacaoNeurologicaPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _RegulacaoNeurologicaPageState createState() => _RegulacaoNeurologicaPageState();
}

class _RegulacaoNeurologicaPageState extends State<RegulacaoNeurologicaPage> {
  final IdosoService _idosoService = IdosoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Regulação Neurológica',
            style: TextStyle(color: AppColors.textLight)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, AppColors.primary.withOpacity(0.1)],
          ),
        ),
        child: StreamBuilder<DocumentSnapshot>(
          stream: _idosoService.getRegulacaoNeurologica(widget.idoso.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return _buildErrorState();
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return _buildEmptyState();
            }

            final dados = snapshot.data!.data() as Map<String, dynamic>;
            final avaliacao = RegulacaoNeurologicaModelo.fromMap(dados);

            return SafeArea(
              child: _buildContent(avaliacao),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.red),
          SizedBox(height: 16),
          Text(
            'Erro ao carregar dados',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.psychology_outlined, 
              size: 80, color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            'Nenhuma avaliação registrada',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _mostrarModalAvaliacao(context),
            icon: Icon(Icons.add),
            label: Text('Realizar Primeira Avaliação'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(RegulacaoNeurologicaModelo avaliacao) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(avaliacao),
          SizedBox(height: 24),
          _buildStatusCard('Nível de Consciência', avaliacao.nivelConsciencia),
          SizedBox(height: 16),
          _buildStatusCard('Memória', avaliacao.memoria),
        ],
      ),
    );
  }

  Widget _buildHeader(RegulacaoNeurologicaModelo avaliacao) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Última Atualização',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _formatarData(avaliacao.dataRegistro),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.edit, color: AppColors.primary),
                onPressed: () => _mostrarModalAvaliacao(context, avaliacao: avaliacao),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                title == 'Nível de Consciência' 
                    ? Icons.psychology 
                    : Icons.memory,
                color: AppColors.primary,
              ),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }

  void _mostrarModalAvaliacao(BuildContext context, {RegulacaoNeurologicaModelo? avaliacao}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(24),
        child: ModalRegulacaoNeurologica(
          idosoId: widget.idoso.id,
          avaliacaoExistente: avaliacao,
        ),
      ),
    );
  }
}

class ModalRegulacaoNeurologica extends StatefulWidget {
  final String idosoId;
  final RegulacaoNeurologicaModelo? avaliacaoExistente;

  ModalRegulacaoNeurologica({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalRegulacaoNeurologicaState createState() => _ModalRegulacaoNeurologicaState();
}

class _ModalRegulacaoNeurologicaState extends State<ModalRegulacaoNeurologica> {
  String? nivelConscienciaSelecionado;
  String? memoriaSelecionada;
  bool isLoad = false;

  final List<String> niveisConsciencia = [
    'Consciente',
    'Sonolento',
    'Torporoso',
    'Orientado',
    'Desorientado',
    'Confuso',
  ];

  final List<String> tiposMemoria = [
    'Preservada',
    'Prejudicada',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      nivelConscienciaSelecionado = widget.avaliacaoExistente!.nivelConsciencia;
      memoriaSelecionada = widget.avaliacaoExistente!.memoria;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nova Avaliação',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close, color: Colors.white),
            ),
          ],
        ),
        Divider(color: Colors.white),
        Expanded(
          child: ListView(
            children: [
              Text(
                'Nível de Consciência',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: niveisConsciencia.map((nivel) => ChoiceChip(
                  label: Text(nivel),
                  selected: nivelConscienciaSelecionado == nivel,
                  onSelected: (selected) {
                    setState(() {
                      nivelConscienciaSelecionado = selected ? nivel : null;
                    });
                  },
                  selectedColor: AppColors.card3,
                  labelStyle: TextStyle(
                    color: nivelConscienciaSelecionado == nivel
                        ? Colors.white
                        : Colors.black,
                  ),
                )).toList(),
              ),
              SizedBox(height: 24),
              Text(
                'Memória',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tiposMemoria.map((tipo) => ChoiceChip(
                  label: Text(tipo),
                  selected: memoriaSelecionada == tipo,
                  onSelected: (selected) {
                    setState(() {
                      memoriaSelecionada = selected ? tipo : null;
                    });
                  },
                  selectedColor: AppColors.card3,
                  labelStyle: TextStyle(
                    color: memoriaSelecionada == tipo
                        ? Colors.white
                        : Colors.black,
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.card3,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: isLoad ? null : _salvarAvaliacao,
          child: isLoad
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  'Salvar Avaliação',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
        ),
      ],
    );
  }

  void _salvarAvaliacao() async {
    if (nivelConscienciaSelecionado == null || memoriaSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
      return;
    }

    setState(() => isLoad = true);

    final avaliacao = RegulacaoNeurologicaModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      nivelConsciencia: nivelConscienciaSelecionado!,
      memoria: memoriaSelecionada!,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarRegulacaoNeurologica(widget.idosoId, avaliacao);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar a avaliação')),
      );
    } finally {
      setState(() => isLoad = false);
    }
  }
} 