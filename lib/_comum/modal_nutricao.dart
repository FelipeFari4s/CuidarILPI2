import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:cuidar_ilpi/models/necessidadesPsicobiologicas/nutricao_modelo.dart';
import 'package:uuid/uuid.dart';

void mostrarModalNutricao(BuildContext context, String idosoId,
    {NutricaoModelo? avaliacao}) {
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
      child: ModalNutricao(
        idosoId: idosoId,
        avaliacaoExistente: avaliacao,
      ),
    ),
  );
}

class ModalNutricao extends StatefulWidget {
  final String idosoId;
  final NutricaoModelo? avaliacaoExistente;

  ModalNutricao({
    required this.idosoId,
    this.avaliacaoExistente,
  });

  @override
  _ModalNutricaoState createState() => _ModalNutricaoState();
}

class _ModalNutricaoState extends State<ModalNutricao> {
  final _formKey = GlobalKey<FormState>();
  bool isLoad = false;

  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();
  double _imc = 0.0;
  
  String? _aceitacaoAlimentar;
  bool _disfagia = false;
  bool _engasgo = false;
  bool _auxilioAlimentacao = false;
  String? _viaAdministracao;
  List<String> _dispositivosAlimentacao = [];
  bool _dietaEnteral = false;
  bool _usoProtese = false;

  final List<String> _opcoesAceitacao = ['Boa', 'Regular', 'Insuficiente'];
  final List<String> _opcoesViaAdministracao = ['Oral', 'Gástrica', 'Enteral'];
  final List<String> _opcoesDispositivo = ['SNG', 'SNE', 'Gastrostomia'];

  @override
  void initState() {
    super.initState();
    if (widget.avaliacaoExistente != null) {
      _alturaController.text = widget.avaliacaoExistente!.altura.toString();
      _pesoController.text = widget.avaliacaoExistente!.peso.toString();
      _imc = widget.avaliacaoExistente!.imc;
      _aceitacaoAlimentar = widget.avaliacaoExistente!.aceitacaoAlimentar;
      _disfagia = widget.avaliacaoExistente!.disfagia;
      _engasgo = widget.avaliacaoExistente!.engasgo;
      _auxilioAlimentacao = widget.avaliacaoExistente!.auxilioAlimentacao;
      _viaAdministracao = widget.avaliacaoExistente!.viaAdministracao;
      _dispositivosAlimentacao = widget.avaliacaoExistente!.dispositivoAlimentacao;
      _dietaEnteral = widget.avaliacaoExistente!.dietaEnteral;
      _usoProtese = widget.avaliacaoExistente!.usoProtese;
    }
  }

  void _calcularIMC() {
    if (_alturaController.text.isNotEmpty && _pesoController.text.isNotEmpty) {
      double altura = double.parse(_alturaController.text) / 100; // converter cm para m
      double peso = double.parse(_pesoController.text);
      setState(() {
        _imc = peso / (altura * altura);
      });
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
                'Avaliação Nutricional',
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
                _buildDadosAntropometricos(),
                SizedBox(height: 24),
                _buildAceitacaoAlimentar(),
                SizedBox(height: 24),
                _buildDeglutacao(),
                SizedBox(height: 24),
                _buildAlimentacao(),
                SizedBox(height: 24),
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

  Widget _buildDadosAntropometricos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dados Antropométricos',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (_) => _calcularIMC(),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (_) => _calcularIMC(),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'IMC: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _imc.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAceitacaoAlimentar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aceitação Alimentar',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: _opcoesAceitacao.map((opcao) => ChoiceChip(
            label: Text(opcao),
            selected: _aceitacaoAlimentar == opcao,
            onSelected: (selected) {
              setState(() {
                _aceitacaoAlimentar = selected ? opcao : null;
              });
            },
            selectedColor: AppColors.card3,
            labelStyle: TextStyle(
              color: _aceitacaoAlimentar == opcao ? Colors.white : Colors.black,
            ),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildDeglutacao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deglutição',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                title: Text('Disfagia', 
                    style: TextStyle(color: Colors.white)),
                value: _disfagia,
                onChanged: (value) {
                  setState(() {
                    _disfagia = value ?? false;
                  });
                },
              ),
            ),
            Expanded(
              child: CheckboxListTile(
                title: Text('Engasgo', 
                    style: TextStyle(color: Colors.white)),
                value: _engasgo,
                onChanged: (value) {
                  setState(() {
                    _engasgo = value ?? false;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAlimentacao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alimentação',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        CheckboxListTile(
          title: Text('Auxílio para se alimentar', 
              style: TextStyle(color: Colors.white)),
          value: _auxilioAlimentacao,
          onChanged: (value) {
            setState(() {
              _auxilioAlimentacao = value ?? false;
            });
          },
        ),
        SizedBox(height: 16),
        Text(
          'Via de administração',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: _opcoesViaAdministracao.map((opcao) => ChoiceChip(
            label: Text(opcao),
            selected: _viaAdministracao == opcao,
            onSelected: (selected) {
              setState(() {
                _viaAdministracao = selected ? opcao : null;
                if (_viaAdministracao != 'Enteral') {
                  _dispositivosAlimentacao = [];
                }
              });
            },
            selectedColor: AppColors.card3,
            labelStyle: TextStyle(
              color: _viaAdministracao == opcao ? Colors.white : Colors.black,
            ),
          )).toList(),
        ),
        if (_viaAdministracao == 'Enteral') ...[
          SizedBox(height: 16),
          Text(
            'Dispositivos para alimentação',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: _opcoesDispositivo.map((opcao) => CheckboxListTile(
                title: Text(opcao, 
                    style: TextStyle(color: Colors.white)),
                value: _dispositivosAlimentacao.contains(opcao),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _dispositivosAlimentacao.add(opcao);
                    } else {
                      _dispositivosAlimentacao.remove(opcao);
                    }
                  });
                },
                activeColor: Colors.white,
                checkColor: Colors.black,
                dense: true,
              )).toList(),
            ),
          ),
        ],
        CheckboxListTile(
          title: Text('Dieta enteral', 
              style: TextStyle(color: Colors.white)),
          value: _dietaEnteral,
          onChanged: (value) {
            setState(() {
              _dietaEnteral = value ?? false;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Uso de Prótese', 
              style: TextStyle(color: Colors.white)),
          value: _usoProtese,
          onChanged: (value) {
            setState(() {
              _usoProtese = value ?? false;
            });
          },
        ),
      ],
    );
  }

  void _salvarAvaliacao() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => isLoad = true);

    final avaliacao = NutricaoModelo(
      id: widget.avaliacaoExistente?.id ?? const Uuid().v1(),
      idosoId: widget.idosoId,
      altura: _alturaController.text.isEmpty ? 0 : double.parse(_alturaController.text),
      peso: _pesoController.text.isEmpty ? 0 : double.parse(_pesoController.text),
      imc: _imc,
      aceitacaoAlimentar: _aceitacaoAlimentar ?? '',
      disfagia: _disfagia,
      engasgo: _engasgo,
      auxilioAlimentacao: _auxilioAlimentacao,
      viaAdministracao: _viaAdministracao ?? '',
      dispositivoAlimentacao: _dispositivosAlimentacao,
      dietaEnteral: _dietaEnteral,
      usoProtese: _usoProtese,
      dataRegistro: DateTime.now(),
    );

    try {
      await IdosoService().salvarNutricao(widget.idosoId, avaliacao);
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