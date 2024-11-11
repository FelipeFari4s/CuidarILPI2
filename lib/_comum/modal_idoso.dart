import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:uuid/uuid.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
mostrarModal(BuildContext context, {IdosoModelo? idoso}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primary,
      isDismissible: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
      builder: (context) {
        return ModalIdoso(idosoModelo: idoso);
      });
}

class ModalIdoso extends StatefulWidget {
  final IdosoModelo? idosoModelo;
  const ModalIdoso({super.key, this.idosoModelo});

  @override
  State<ModalIdoso> createState() => _ModalIdosoState();
}

class _ModalIdosoState extends State<ModalIdoso> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController religiaoController = TextEditingController();
  TextEditingController escolaridadeController = TextEditingController();
  TextEditingController ocupacaoAnteriorController = TextEditingController();
  TextEditingController aposentadoController = TextEditingController();
  TextEditingController dataInstitucionalizacaoController =
      TextEditingController();
  TextEditingController motivoInstitucionalizacaoController =
      TextEditingController();
  TextEditingController possuiFamiliaresController = TextEditingController();

  bool isLoad = false;

  final _dateFormat = DateFormat('dd/MM/yyyy');

  final IdosoService _idosoService = IdosoService();

  // Adicione esta chave para o formulário
  final _formKey = GlobalKey<FormState>();

//fazendo para o update
  @override
  void initState() {
    if (widget.idosoModelo != null) {
      nomeController.text = widget.idosoModelo!.nome;
      nascimentoController.text = widget.idosoModelo!.nascimento;
      idadeController.text = widget.idosoModelo!.idade;
      sexoController.text = widget.idosoModelo!.sexo;
      religiaoController.text = widget.idosoModelo!.religiao;
      escolaridadeController.text = widget.idosoModelo!.escolaridade;
      ocupacaoAnteriorController.text = widget.idosoModelo!.ocupacaoAnterior;
      aposentadoController.text = widget.idosoModelo!.aposentado;
      dataInstitucionalizacaoController.text = widget.idosoModelo!.dataInstitucionalizacao;
      motivoInstitucionalizacaoController.text = widget.idosoModelo!.motivoInstitucionalizacao;
      possuiFamiliaresController.text = widget.idosoModelo!.possuiFamiliares;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Cadastro de Pessoa Idosa',
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
              Divider(color: Colors.white.withOpacity(0.5)),
            ]),
            Expanded(
              child: ListView(
                children: [
                  _buildTextField(
                    controller: nomeController,
                    label: 'Nome',
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                  ),
                  _buildDateField(
                    controller: nascimentoController,
                    label: 'Data de Nascimento',
                    icon: Icons.cake,
                  ),
                  _buildTextField(
                    controller: idadeController,
                    label: 'Idade',
                    icon: Icons.elderly,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  _buildDropdownField(
                    controller: sexoController,
                    label: 'Sexo',
                    icon: Icons.wc,
                    items: ['Masculino', 'Feminino', 'Outro'],
                  ),
                  _buildTextField(
                    controller: religiaoController,
                    label: 'Religião',
                    icon: Icons.church,
                  ),
                  _buildDropdownField(
                    controller: escolaridadeController,
                    label: 'Escolaridade',
                    icon: Icons.school,
                    items: [
                      'Ensino Fundamental Incompleto',
                      'Ensino Fundamental Completo',
                      'Ensino Médio Incompleto',
                      'Ensino Médio Completo',
                      'Ensino Superior Incompleto',
                      'Ensino Superior Completo',
                      'Pós Graduação',
                      'Mestrado',
                      'Doutorado'
                    ],
                  ),
                  _buildTextField(
                    controller: ocupacaoAnteriorController,
                    label: 'Ocupação Anterior',
                    icon: Icons.work,
                  ),
                  _buildDropdownField(
                    controller: aposentadoController,
                    label: 'Aposentado',
                    icon: Icons.attach_money,
                    items: ['Sim', 'Não'],
                  ),
                  _buildDateField(
                    controller: dataInstitucionalizacaoController,
                    label: 'Data de Institucionalização',
                    icon: Icons.home,
                  ),
                  _buildTextField(
                    controller: motivoInstitucionalizacaoController,
                    label: 'Motivo da Institucionalização',
                    icon: Icons.help_outline,
                    maxLines: null,
                  ),
                  _buildDropdownField(
                    controller: possuiFamiliaresController,
                    label: 'Possui Familiares',
                    icon: Icons.family_restroom,
                    items: ['Sim', 'Não'],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.card3,
                foregroundColor: AppColors.textLight,
                padding: EdgeInsets.symmetric(vertical: 16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: isLoad ? null : () {
                enviarClicado();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoad) 
                    Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.only(right: 8),
                      child: CircularProgressIndicator(
                        color: AppColors.textLight,
                      ),
                    )
                  else ...[
                    Icon(Icons.save, color: AppColors.textLight),
                    SizedBox(width: 8),
                  ],
                  Text(
                    isLoad 
                      ? 'Salvando...' 
                      : (widget.idosoModelo != null 
                          ? 'Atualizar Cadastro' 
                          : 'Salvar Cadastro'),
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    var maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        validator: label == 'Nome' ? (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Nome é obrigatório';
          }
          return null;
        } : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.white70),
          labelStyle: TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          errorStyle: TextStyle(
            color: const Color.fromARGB(255, 255, 0, 0),
            fontSize: 12,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 255, 0, 0)!),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 255, 0, 0)!),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildDropdownField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: controller.text.isEmpty ? null : controller.text,
        onChanged: (value) {
          controller.text = value ?? '';
        },
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.white70),
          labelStyle: TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: TextStyle(color: Colors.white),
        dropdownColor: AppColors.primary,
      ),
    );
  }

  Widget _buildDateField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.white70),
          labelStyle: TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: TextStyle(color: Colors.white),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            String formattedDate = _dateFormat.format(pickedDate);
            controller.text = formattedDate;
          }
        },
      ),
    );
  }

  enviarClicado() async {
    // Primeiro verifica se o nome está preenchido
    if (nomeController.text.trim().isEmpty) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.primary,
            title: Text(
              'Campo obrigatório',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'O nome da pessoa idosa é obrigatório para o cadastro.',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          );
        },
      );
      return;
    }

    // Verifica se há outros campos vazios
    bool temCamposVazios = [
      nascimentoController,
      idadeController,
      sexoController,
      religiaoController,
      escolaridadeController,
      ocupacaoAnteriorController,
      aposentadoController,
      dataInstitucionalizacaoController,
      motivoInstitucionalizacaoController,
      possuiFamiliaresController,
    ].any((controller) => controller.text.trim().isEmpty);

    if (temCamposVazios) {
      bool? deveContinar = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.primary,
            title: Text(
              'Campos não preenchidos',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'Existem campos não preenchidos. Deseja continuar mesmo assim?',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Continuar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          );
        },
      );

      // Se o usuário cancelou ou fechou o diálogo
      if (deveContinar != true) {
        return;
      }
    }

    // Continua com o salvamento
    setState(() {
      isLoad = true;
    });

    String nome = nomeController.text;
    String nascimento = nascimentoController.text;
    String idade = idadeController.text;
    String sexo = sexoController.text;
    String religiao = religiaoController.text;
    String escolaridade = escolaridadeController.text;
    String ocupacaoAnterior = ocupacaoAnteriorController.text;
    String aposentado = aposentadoController.text;
    String dataInstitucionalizacao = dataInstitucionalizacaoController.text;
    String motivoInstitucionalizacao = motivoInstitucionalizacaoController.text;
    String possuiFamiliares = possuiFamiliaresController.text;

    IdosoModelo idoso = IdosoModelo( 
      id: const Uuid().v1(),
      nome: nome,
      nascimento: nascimento,
      idade: idade,
      sexo: sexo,
      religiao: religiao,
      escolaridade: escolaridade,
      ocupacaoAnterior: ocupacaoAnterior,
      aposentado: aposentado,
      dataInstitucionalizacao: dataInstitucionalizacao,
      motivoInstitucionalizacao: motivoInstitucionalizacao,
      possuiFamiliares: possuiFamiliares,
    );

    if (widget.idosoModelo != null) {
      idoso.id = widget.idosoModelo!.id;
    }

  _idosoService.createIdoso(idoso).then((value) {
      setState(() {
        isLoad = false;
      }); 
      Navigator.pop(context); // Fecha a modal após o cadastro
    });
  }
} 
