import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/services/autentification_service.dart';

class AppDrawer extends StatelessWidget {
  final User user;

  const AppDrawer({Key? key, required this.user}) : super(key: key);

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? backgroundColor,
    bool isMainButton = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: Icon(
          icon,
          color: isMainButton ? const Color(0xFF707070) : Colors.grey[800],
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isMainButton ? const Color(0xFF707070) : Colors.grey[800],
            fontSize: 14,
            fontWeight: isMainButton ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: backgroundColor ?? Colors.transparent,
        hoverColor: Colors.grey[100],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage("assets/icons/app/logoApp.png"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    (user.displayName != null) ? user.displayName! : "Usuário",
                    style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    user.email!,
                    style: TextStyle(
                      color: Color(0xFF707070).withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              title: 'Perfil do Usuário',
              backgroundColor: Color(0xFFF9AAAA).withOpacity(0.7),
              isMainButton: true,
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            _buildDrawerItem(
              icon: Icons.health_and_safety,
              title: 'Monitoramento de Saúde',
              backgroundColor: Color(0xFFFAE3DD).withOpacity(0.7),
              isMainButton: true,
              onTap: () => Navigator.pushNamed(context, '/monitoramento'),
            ),
            _buildDrawerItem(
              icon: Icons.accessibility_new,
              title: 'Atividades Diárias',
              backgroundColor: Color(0xFFCAE5D1).withOpacity(0.7),
              isMainButton: true,
              onTap: () => Navigator.pushNamed(context, '/daily_activities'),
            ),
            _buildDrawerItem(
              icon: Icons.security,
              title: 'Segurança do Cuidado',
              backgroundColor: Color(0xFFFFDA8F).withOpacity(0.7),
              isMainButton: true,
              onTap: () => Navigator.pushNamed(context, '/safety'),
            ),
            _buildDrawerItem(
              icon: Icons.elderly,
              title: 'Funcionalidade Global',
              backgroundColor: Color(0xFFD3E6F2).withOpacity(0.7),
              isMainButton: true,
              onTap: () => Navigator.pushNamed(context, '/fun'),
            ),
            _buildDrawerItem(
              icon: Icons.library_books,
              title: 'Referências Bibliográficas',
              backgroundColor: Color(0xFFE0C7F9).withOpacity(0.7),
              isMainButton: true,
              onTap: () => Navigator.pushNamed(context, '/references'),
            ),
            Divider(color: Colors.grey.withOpacity(0.3)),
            _buildDrawerItem(
              icon: Icons.settings,
              title: 'Configurações',
              onTap: () {
                // Navegação para Configurações
              },
            ),
            _buildDrawerItem(
              icon: Icons.help_outline,
              title: 'Ajuda',
              onTap: () {
                // Navegação para Ajuda
              },
            ),
            Divider(color: Colors.grey.withOpacity(0.3)),
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Sair',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Confirmar saída'),
                    content: Text('Deseja realmente sair do aplicativo?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          AutentificationService().islogout();
                        },
                        child: Text('Sair'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
