import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/features/user/domain/user.dart';
import 'package:gtk_flutter/source/features/user/data/user_repository.dart';
import 'package:gtk_flutter/source/features/common/appbar_menu_action.dart';
import 'package:gtk_flutter/source/features/user/presentation/user_search_bar.dart';

class ListaUserScreen extends ConsumerWidget {
  const ListaUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider.future);
    final actions = AppBarPopUpMenuActions();

    return Scaffold(
      appBar: AppBar(
        title: UserSearchBar(),
        actions: <Widget>[
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(
          //         Icons.search,
          //         size: 26.0,
          //       ),
          //     )),
          PopupMenuButton<int>(
            onSelected: (item) => actions.handleClick(item, context, ref),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Logout')),
              PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
            ],
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: RefreshIndicator(
          child: FutureBuilder(
            future: userData,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<User> user = snapshot.data!;
                return ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: Key('item_${user[index].id}'),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          user.removeAt(index); // Update data source
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Item $index excluído')),
                          );
                        } else if (direction == DismissDirection.startToEnd) {}
                      },
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          // Show a confirmation dialog for delete action
                          final bool confirmDelete = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirme a exclusão'),
                                content:
                                    Text('Você quer mesmo excluir este item?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancelar'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                  ),
                                  TextButton(
                                    child: Text('Excluir'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                  ),
                                ],
                              );
                            },
                          );
                          return confirmDelete;
                        }
                        return true;
                      },
                      background: Container(
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.delete, color: Colors.white),
                            Text('Excluir',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      // secondaryBackground: Container(
                      //   color: Colors.yellow,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: <Widget>[
                      //       Icon(Icons.delete, color: Colors.white),
                      //       Text('Excluir',
                      //           style: TextStyle(color: Colors.white)),
                      //     ],
                      //   ),
                      // ),
                      child: ListTile(
                        title: Text(user[index].name),
                        subtitle: Text(user[index].email),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () => context.goNamed(
                          AppRoute.editresponsavel.name,
                          pathParameters: {'id': user[index].id.toString()},
                          extra: user[index],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Não foi possível obter os dados'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
          ),
          onRefresh: () async {
            ref.invalidate(userDataProvider);
            try {
              ref.read(userDataProvider);
            } catch (e) {
              // fail silently as the provider error state is handled inside the ListView
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Increment',
        onPressed: () => context.goNamed(
          AppRoute.addresponsavel.name,
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
