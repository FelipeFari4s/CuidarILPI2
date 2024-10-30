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
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey[800],
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 16,
        ),
      ),
      onTap: onTap,
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.transparent,
      hoverColor: Colors.grey[100],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage("assets/icons/app/logoApp.png"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    (user.displayName != null) ? user.displayName! : "Usuário",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    user.email!,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.dashboard,
              title: 'Dashboard',
              onTap: () {
                // Navegação para Dashboard
              },
            ),
            _buildDrawerItem(
              icon: Icons.people,
              title: 'Gerenciar Idosos',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _buildDrawerItem(
              icon: Icons.calendar_today,
              title: 'Agenda',
              onTap: () {
                // Navegação para Agenda
              },
            ),
            _buildDrawerItem(
              icon: Icons.notifications,
              title: 'Notificações',
              onTap: () {
                // Navegação para Notificações
              },
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
