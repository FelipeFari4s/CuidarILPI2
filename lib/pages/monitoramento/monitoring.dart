import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
//import 'package:cuidar_ilpi/pages/monitoramento/detail_idoso.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cuidar_ilpi/services/autentification_service.dart';
import 'package:cuidar_ilpi/_comum/modal_idoso.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/idoso_card.dart';

class Monitoramento extends StatefulWidget {
  final User user;
  Monitoramento({super.key, required this.user});

  @override
  _MonitoramentoState createState() => _MonitoramentoState();
}

class _MonitoramentoState extends State<Monitoramento> {
  final IdosoService service = IdosoService();
  bool descending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Monitoramento de Pessoas Idosas', style: TextStyle(color: AppColors.textLight)),
        actions: [
          IconButton(
            icon: Icon(
              descending ? Icons.sort_by_alpha_rounded : Icons.sort_by_alpha_outlined,
              color: AppColors.textLight,
            ),
            onPressed: () {
              setState(() {
                descending = !descending;
              });
            },
            tooltip: descending ? 'Ordem decrescente' : 'Ordem crescente',
          ),
        ],
      ),
      drawer: AppDrawer(user: widget.user),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () {
          mostrarModal(context);
        },
        label: const Text('Adicionar pessoa idosa'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
          stream: service.conectarStreamIdosos(descending),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar dados'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              List<IdosoModelo> listaIdoso = [];

              for (var doc in snapshot.data!.docs) {
                listaIdoso.add(IdosoModelo.fromMap(doc.data()));
              }

              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: listaIdoso.length + 1,
                itemBuilder: (context, index) {
                  if (index == listaIdoso.length) {
                    return SizedBox(height: 80);
                  }
                  IdosoModelo idoso = listaIdoso[index];
                  return IdosoCard(
                    idoso: idoso,
                    onEdit: (idoso) {
                      mostrarModal(context, idoso: idoso);
                    },
                    onDelete: (idoso) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Confirmar exclusão'),
                          content: Text('Deseja realmente excluir ${idoso.nome}?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                service.deleteIdoso(idosoId: idoso.id);
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              child: Text('Excluir'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return Center(child: Text('Nenhum idoso encontrado'));   
            }
          })
          );
  }

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
}
