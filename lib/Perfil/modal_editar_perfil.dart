import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cuidar_ilpi/models/usuario_modelo.dart';
import 'package:cuidar_ilpi/services/autentification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> mostrarModalEditarPerfil(BuildContext context, UsuarioModelo usuario) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ModalEditarPerfil(usuario: usuario),
  );
}

class ModalEditarPerfil extends StatefulWidget {
  final UsuarioModelo usuario;

  const ModalEditarPerfil({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  State<ModalEditarPerfil> createState() => _ModalEditarPerfilState();
}

class _ModalEditarPerfilState extends State<ModalEditarPerfil> {
  final _formKey = GlobalKey<FormState>();
  final AutentificationService _authService = AutentificationService();
  bool isLoading = false;

  late TextEditingController _nomeController;
  late TextEditingController _telefoneController;
  late TextEditingController _categoriaController;
  late TextEditingController _experienciaController;
  String? _generoSelecionado;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.usuario.nome);
    _telefoneController = TextEditingController(text: widget.usuario.telefone);
    _categoriaController = TextEditingController(text: widget.usuario.categoria);
    _experienciaController = TextEditingController(
        text: widget.usuario.anosExperiencia.toString());
    _generoSelecionado = widget.usuario.genero;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _categoriaController.dispose();
    _experienciaController.dispose();
    super.dispose();
  }

  Future<void> _atualizarPerfil() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        final usuarioAtualizado = UsuarioModelo(
          uid: widget.usuario.uid,
          nome: _nomeController.text,
          email: widget.usuario.email,
          telefone: _telefoneController.text,
          genero: _generoSelecionado ?? widget.usuario.genero,
          categoria: _categoriaController.text,
          anosExperiencia: int.parse(_experienciaController.text),
          dataCadastro: widget.usuario.dataCadastro,
        );

        await FirebaseAuth.instance.currentUser?.updateDisplayName(_nomeController.text);
        await _authService.atualizarUsuario(usuarioAtualizado);
        
        if (mounted) {
          Navigator.pop(context, true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Perfil atualizado com sucesso!')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar perfil: $e')),
        );
      } finally {
        if (mounted) {
          setState(() => isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField(
                      controller: _nomeController,
                      label: 'Nome Completo',
                      icon: FontAwesomeIcons.user,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Campo obrigatório' : null,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _telefoneController,
                      label: 'Telefone',
                      icon: FontAwesomeIcons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Campo obrigatório' : null,
                    ),
                    const SizedBox(height: 16),
                    _buildGeneroDropdown(),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _categoriaController,
                      label: 'Categoria Profissional',
                      icon: FontAwesomeIcons.userTie,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Campo obrigatório' : null,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _experienciaController,
                      label: 'Anos de Experiência',
                      icon: FontAwesomeIcons.clock,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value?.isEmpty ?? true) return 'Campo obrigatório';
                        if (int.tryParse(value!) == null) {
                          return 'Digite um número válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    _buildSaveButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Editar Perfil',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildGeneroDropdown() {
    return DropdownButtonFormField<String>(
      value: _generoSelecionado,
      decoration: InputDecoration(
        labelText: 'Gênero',
        prefixIcon: const Icon(FontAwesomeIcons.venusMars, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      items: ['Masculino', 'Feminino', 'Outro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _generoSelecionado = newValue;
        });
      },
      validator: (value) =>
          value == null ? 'Selecione um gênero' : null,
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: isLoading ? null : _atualizarPerfil,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF9AAAA),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text(
              'Salvar Alterações',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }
} 