import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/cuidado_corporal_modelo.dart';
import 'package:uuid/uuid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void mostrarModalCuidadoCorporal(BuildContext context, String idosoId,
    {CuidadoCorporalModelo? avaliacao}) {
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
      child: ModalCuidadoCorporal(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ModalCuidadoCorporal extends StatefulWidget {
  final String idosoId;
  final CuidadoCorporalModelo? avaliacaoExistente;

  ModalCuidadoCorporal({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalCuidadoCorporalState createState() => _ModalCuidadoCorporalState();
}

class _ModalCuidadoCorporalState extends State<ModalCuidadoCorporal> {
  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;

  String _higieneCorporal = 'Satisfatória';
  bool _auxilioBanho = false;
  bool _auxilioVestimenta = false;
  String _higieneBucal = 'Satisfatória';
  bool _auxilioHigieneBucal = false;
  bool _problemasDentarios = false;
  bool _gengivites = false;

  final List<String> _opcoesCondicao = ['Satisfatória', 'Insatisfatória'];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _higieneCorporal = widget.avaliacaoExistente!.higieneCorporal;
      _auxilioBanho = widget.avaliacaoExistente!.auxilioBanho;
      _auxilioVestimenta = widget.avaliacaoExistente!.auxilioVestimenta;
      _higieneBucal = widget.avaliacaoExistente!.higieneBucal;
      _auxilioHigieneBucal = widget.avaliacaoExistente!.auxilioHigieneBucal;
      _problemasDentarios = widget.avaliacaoExistente!.problemasDentarios;
      _gengivites = widget.avaliacaoExistente!.gengivites;
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
                'Avaliação do Cuidado Corporal',
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
                _buildHigieneCorporal(),
                SizedBox(height: 24),
                _buildHigieneBucal(),
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
      ),
    );
  }

  Widget _buildHigieneCorporal() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.bath, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Higiene Corporal',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Condição da Higiene',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _opcoesCondicao.map((opcao) => ChoiceChip(
                label: Text(opcao),
                selected: _higieneCorporal == opcao,
                onSelected: (selected) {
                  setState(() => _higieneCorporal = selected ? opcao : _higieneCorporal);
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _higieneCorporal == opcao ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
            SwitchListTile(
              title: Text('Auxílio para o banho',
                  style: TextStyle(color: Colors.white)),
              value: _auxilioBanho,
              onChanged: (value) {
                setState(() => _auxilioBanho = value);
              },
            ),
            SwitchListTile(
              title: Text('Auxílio para trocar a roupa',
                  style: TextStyle(color: Colors.white)),
              value: _auxilioVestimenta,
              onChanged: (value) {
                setState(() => _auxilioVestimenta = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHigieneBucal() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.tooth, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Higiene Bucal',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Condição da Higiene Bucal',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _opcoesCondicao.map((opcao) => ChoiceChip(
                label: Text(opcao),
                selected: _higieneBucal == opcao,
                onSelected: (selected) {
                  setState(() => _higieneBucal = selected ? opcao : _higieneBucal);
                },
                selectedColor: AppColors.card3,
                labelStyle: TextStyle(
                  color: _higieneBucal == opcao ? Colors.white : Colors.black,
                ),
              )).toList(),
            ),
            SwitchListTile(
              title: Text('Auxílio para higiene bucal',
                  style: TextStyle(color: Colors.white)),
              value: _auxilioHigieneBucal,
              onChanged: (value) {
                setState(() => _auxilioHigieneBucal = value);
              },
            ),
            SwitchListTile(
              title: Text('Problemas dentários',
                  style: TextStyle(color: Colors.white)),
              value: _problemasDentarios,
              onChanged: (value) {
                setState(() => _problemasDentarios = value);
              },
            ),
            SwitchListTile(
              title: Text('Gengivites',
                  style: TextStyle(color: Colors.white)),
              value: _gengivites,
              onChanged: (value) {
                setState(() => _gengivites = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => isLoad = true);

    final avaliacao = CuidadoCorporalModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      higieneCorporal: _higieneCorporal,
      auxilioBanho: _auxilioBanho,
      auxilioVestimenta: _auxilioVestimenta,
      higieneBucal: _higieneBucal,
      auxilioHigieneBucal: _auxilioHigieneBucal,
      problemasDentarios: _problemasDentarios,
      gengivites: _gengivites,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarCuidadoCorporal(widget.idosoId, avaliacao);
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