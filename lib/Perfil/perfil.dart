import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cuidar_ilpi/services/autentification_service.dart';
import 'package:cuidar_ilpi/models/usuario_modelo.dart';
import 'package:cuidar_ilpi/Perfil/modal_editar_perfil.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final AutentificationService _authService = AutentificationService();
  UsuarioModelo? usuario;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarDadosUsuario();
  }

  Future<void> _carregarDadosUsuario() async {
    setState(() => isLoading = true);
    try {
      final dadosUsuario = await _authService.getUsuarioAtual();
      setState(() {
        usuario = dadosUsuario;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  backgroundColor: const Color(0xFFF9AAAA),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFF9AAAA), Color(0xFFFAE3DD)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Text(
                              usuario?.nome.substring(0, 1).toUpperCase() ?? '?',
                              style: const TextStyle(
                                fontSize: 40,
                                color: Color(0xFFF9AAAA),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            usuario?.nome ?? 'Nome não disponível',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildInfoCard(),
                        const SizedBox(height: 20),
                        _buildActionButtons(),
                        const SizedBox(height: 20),
                        _buildMenuSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoItem(FontAwesomeIcons.envelope, 'Email', 
              usuario?.email ?? 'Não informado'),
          const Divider(height: 20),
          _buildInfoItem(FontAwesomeIcons.userTie, 'Categoria', 
              usuario?.categoria ?? 'Não informada'),
          const Divider(height: 20),
          _buildInfoItem(FontAwesomeIcons.clock, 'Experiência', 
              '${usuario?.anosExperiencia ?? 0} anos'),
          const Divider(height: 20),
          _buildInfoItem(FontAwesomeIcons.phone, 'Telefone', 
              usuario?.telefone ?? 'Não informado'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFF9AAAA), size: 24),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              if (usuario != null) {
                await mostrarModalEditarPerfil(context, usuario!);
                _carregarDadosUsuario();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF9AAAA),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "Editar Perfil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        _buildMenuItem(
          "Configurações",
          Icons.settings_rounded,
          const Color(0xFFCAE5D1),
          "Gerencie suas preferências do app",
          () {},
        ),
        const SizedBox(height: 12),
        _buildMenuItem(
          "Gerenciamento de Usuário",
          FontAwesomeIcons.userGear,
          const Color(0xFFFFDA8F),
          "Controle de acesso e permissões",
          () {},
        ),
        const SizedBox(height: 12),
        _buildMenuItem(
          "Sobre nós",
          FontAwesomeIcons.circleInfo,
          const Color(0xFFD3E6F2),
          "Conheça mais sobre o CuidarILPI",
          () {},
        ),
        const SizedBox(height: 20),
        _buildLogoutButton(),
      ],
    );
  }

  Widget _buildMenuItem(
    String title,
    IconData icon,
    Color iconBgColor,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: iconBgColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: iconBgColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D3142),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.red.shade50,
            Colors.red.shade100,
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await _authService.islogout();
            if (context.mounted) {
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.rightFromBracket,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Sair do Aplicativo",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Constantes para rotas
const String userDetailsRoute = "/userDetails";
