import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/seguranca_fisica_modelo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

class SegurancaFisicaPage extends StatefulWidget {
  final IdosoModelo idoso;

  SegurancaFisicaPage({Key? key, required this.idoso}) : super(key: key);

  @override
  _SegurancaFisicaPageState createState() => _SegurancaFisicaPageState();
}

class _SegurancaFisicaPageState extends State<SegurancaFisicaPage> {
  final IdosoService _idosoService = IdosoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Segurança Física e Meio Ambiente',
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
          stream: _idosoService.getSegurancaFisica(widget.idoso.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return _buildEmptyState();
            }

            final dados = snapshot.data!.data() as Map<String, dynamic>;
            final avaliacao = SegurancaFisicaModelo.fromMap(dados);

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(avaliacao),
                  SizedBox(height: 16),
                  _buildAvaliacaoCard(avaliacao),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.shieldHalved,
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

  Widget _buildHeader(SegurancaFisicaModelo avaliacao) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
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
                    fontSize: 16,
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
      ),
    );
  }

  Widget _buildAvaliacaoCard(SegurancaFisicaModelo avaliacao) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.shieldHalved, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Avaliação de Segurança',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildStatusChip(
              'Uso de Corrimão',
              avaliacao.usoCorrimao,
              FontAwesomeIcons.handHoldingHand,
            ),
            SizedBox(height: 8),
            _buildStatusChip(
              'Grades na Cama',
              avaliacao.gradesCama,
              FontAwesomeIcons.bed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String label, bool value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              FaIcon(icon, size: 16, color: AppColors.primary),
              SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: value ? Colors.green[100] : Colors.red[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                value ? FontAwesomeIcons.check : FontAwesomeIcons.xmark,
                size: 14,
                color: value ? Colors.green[700] : Colors.red[700],
              ),
              SizedBox(width: 4),
              Text(
                value ? 'Sim' : 'Não',
                style: TextStyle(
                  color: value ? Colors.green[700] : Colors.red[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year} ${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}';
  }

  void _mostrarModalAvaliacao(BuildContext context, {SegurancaFisicaModelo? avaliacao}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(24),
        child: ModalSegurancaFisica(
          idosoId: widget.idoso.id,
          avaliacaoExistente: avaliacao,
        ),
      ),
    );
  }
}

class ModalSegurancaFisica extends StatefulWidget {
  final String idosoId;
  final SegurancaFisicaModelo? avaliacaoExistente;

  ModalSegurancaFisica({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalSegurancaFisicaState createState() => _ModalSegurancaFisicaState();
}

class _ModalSegurancaFisicaState extends State<ModalSegurancaFisica> {
  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;

  bool _usoCorrimao = false;
  bool _gradesCama = false;

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _usoCorrimao = widget.avaliacaoExistente!.usoCorrimao;
      _gradesCama = widget.avaliacaoExistente!.gradesCama;
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
              Expanded(
                child: Text(
                  'Avaliação de Segurança',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(8),
                constraints: BoxConstraints(),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
          Divider(color: Colors.white),
          SwitchListTile(
            title: Text('Uso de Corrimão',
                style: TextStyle(color: Colors.white)),
            value: _usoCorrimao,
            onChanged: (value) {
              setState(() => _usoCorrimao = value);
            },
          ),
          SwitchListTile(
            title: Text('Grades na Cama',
                style: TextStyle(color: Colors.white)),
            value: _gradesCama,
            onChanged: (value) {
              setState(() => _gradesCama = value);
            },
          ),
          Spacer(),
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
      ),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = SegurancaFisicaModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      usoCorrimao: _usoCorrimao,
      gradesCama: _gradesCama,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarSegurancaFisica(widget.idosoId, avaliacao);
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