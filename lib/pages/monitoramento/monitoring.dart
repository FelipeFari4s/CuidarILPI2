import 'package:cuidar_ilpi/services/idoso_service.dart';
import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/models/idoso_modelo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuidar_ilpi/_comum/modal_idoso.dart';
import 'package:cuidar_ilpi/utils/app_colors.dart';
import 'package:cuidar_ilpi/widgets/app_drawer.dart';
import 'package:cuidar_ilpi/widgets/idoso_card.dart';
import 'package:cuidar_ilpi/widgets/custom_app_bar.dart';

class MonitoringScreen extends StatefulWidget {
  final User user;
  MonitoringScreen({super.key, required this.user});

  @override
  _MonitoringScreenState createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  final IdosoService service = IdosoService();
  bool descending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      endDrawer: AppDrawer(user: widget.user),
      body: Column(
        children: [
          CustomAppBar(user: widget.user),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Monitoramento de Pessoas Idosas",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF707070),
                    fontFamily: 'Roboto',
                  ),
                ),
                IconButton(
                  icon: Icon(
                    descending ? Icons.sort_by_alpha_rounded : Icons.sort_by_alpha_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
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
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFF707070),
              thickness: 1,
            ),
          ),
          Expanded(
            child: StreamBuilder(
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
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () {
          mostrarModal(context);
        },
        label: const Text('Adicionar pessoa idosa'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
