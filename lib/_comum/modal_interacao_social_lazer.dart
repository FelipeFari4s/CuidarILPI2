import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicossociais/interacao_social_lazer_modelo.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:uuid/uuid.dart';

void mostrarModalInteracaoSocialLazer(BuildContext context, String idosoId, {InteracaoSocialLazerModelo? avaliacao}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(24),
      child: InteracaoSocialLazerModal(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class InteracaoSocialLazerModal extends StatefulWidget {
  final String idosoId;
  final InteracaoSocialLazerModelo? avaliacaoExistente;

  InteracaoSocialLazerModal({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _InteracaoSocialLazerModalState createState() => _InteracaoSocialLazerModalState();
}

class _InteracaoSocialLazerModalState extends State<InteracaoSocialLazerModal> {
  final _formKey = GlobalKey<FormState>();
  final _idosoService = IdosoService();
  bool isLoad = false;

  bool _participaAtividadesGrupo = false;
  bool _recebeVisita = false;
  final _visitantesController = TextEditingController();
  bool _solicitaVisita = false;
  bool _interageResidentes = false;
  bool _agrideResidentes = false;
  bool _sofreAgressao = false;
  bool _realizaPasseios = false;
  
  final List<String> _atividadesDisponiveis = [
    'Jogos',
    'Música',
    'Dança',
    'Artesanato',
    'Leitura',
    'Ações Educativas'
  ];
  
  List<String> _atividadesSelecionadas = [];
  final _outrasAtividadesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _participaAtividadesGrupo = widget.avaliacaoExistente!.participaAtividadesGrupo;
      _recebeVisita = widget.avaliacaoExistente!.recebeVisita;
      _visitantesController.text = widget.avaliacaoExistente!.visitantes;
      _solicitaVisita = widget.avaliacaoExistente!.solicitaVisita;
      _interageResidentes = widget.avaliacaoExistente!.interageResidentes;
      _agrideResidentes = widget.avaliacaoExistente!.agrideResidentes;
      _sofreAgressao = widget.avaliacaoExistente!.sofreAgressao;
      _realizaPasseios = widget.avaliacaoExistente!.realizaPasseios;
      _atividadesSelecionadas = List.from(widget.avaliacaoExistente!.atividadesPreferidas);
      _outrasAtividadesController.text = widget.avaliacaoExistente!.outrasAtividades;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Avaliação de Interação Social',
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
                _buildParticipacaoSection(),
                SizedBox(height: 16),
                _buildVisitasSection(),
                SizedBox(height: 16),
                _buildInteracoesSection(),
                SizedBox(height: 16),
                _buildAtividadesSection(),
              ],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.card3,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: isLoad ? null : _salvarAvaliacao,
            child: isLoad
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    'Salvar Avaliação',
                    style: TextStyle(fontSize: 16),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipacaoSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Participação em Grupo',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text(
                'Participa de atividades em grupo',
                style: TextStyle(color: Colors.white),
              ),
              value: _participaAtividadesGrupo,
              onChanged: (value) => setState(() => _participaAtividadesGrupo = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitasSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Visitas',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text(
                'Recebe visita',
                style: TextStyle(color: Colors.white),
              ),
              value: _recebeVisita,
              onChanged: (value) => setState(() => _recebeVisita = value),
            ),
            if (_recebeVisita)
              TextFormField(
                controller: _visitantesController,
                decoration: InputDecoration(
                  labelText: 'De quem?',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (_recebeVisita && (value == null || value.isEmpty)) {
                    return 'Por favor, informe quem visita';
                  }
                  return null;
                },
              ),
            SwitchListTile(
              title: Text(
                'Solicita visita',
                style: TextStyle(color: Colors.white),
              ),
              value: _solicitaVisita,
              onChanged: (value) => setState(() => _solicitaVisita = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteracoesSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interações com Residentes',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text(
                'Interage com outros residentes',
                style: TextStyle(color: Colors.white),
              ),
              value: _interageResidentes,
              onChanged: (value) => setState(() => _interageResidentes = value),
            ),
            SwitchListTile(
              title: Text(
                'Agride os residentes',
                style: TextStyle(color: Colors.white),
              ),
              value: _agrideResidentes,
              onChanged: (value) => setState(() => _agrideResidentes = value),
            ),
            SwitchListTile(
              title: Text(
                'Sofre agressão dos residentes',
                style: TextStyle(color: Colors.white),
              ),
              value: _sofreAgressao,
              onChanged: (value) => setState(() => _sofreAgressao = value),
            ),
            SwitchListTile(
              title: Text(
                'Realiza passeios',
                style: TextStyle(color: Colors.white),
              ),
              value: _realizaPasseios,
              onChanged: (value) => setState(() => _realizaPasseios = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAtividadesSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Atividades Preferidas',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _atividadesDisponiveis.map((atividade) {
                final isSelected = _atividadesSelecionadas.contains(atividade);
                return FilterChip(
                  label: Text(atividade),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _atividadesSelecionadas.add(atividade);
                      } else {
                        _atividadesSelecionadas.remove(atividade);
                      }
                    });
                  },
                  selectedColor: AppColors.card3,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _outrasAtividadesController,
              decoration: InputDecoration(
                labelText: 'Outras atividades',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = InteracaoSocialLazerModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      participaAtividadesGrupo: _participaAtividadesGrupo,
      recebeVisita: _recebeVisita,
      visitantes: _visitantesController.text,
      solicitaVisita: _solicitaVisita,
      interageResidentes: _interageResidentes,
      agrideResidentes: _agrideResidentes,
      sofreAgressao: _sofreAgressao,
      realizaPasseios: _realizaPasseios,
      atividadesPreferidas: _atividadesSelecionadas,
      outrasAtividades: _outrasAtividadesController.text,
      dataRegistro: DateTime.now(),
    );

    try {
      await _idosoService.salvarInteracaoSocialLazer(widget.idosoId, avaliacao);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar a avaliação')),
      );
    } finally {
      setState(() => isLoad = false);
    }
  }

  @override
  void dispose() {
    _visitantesController.dispose();
    _outrasAtividadesController.dispose();
    super.dispose();
  }
} 