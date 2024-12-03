import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/features/user/domain/user.dart';
import 'package:gtk_flutter/source/features/user/data/user_repository.dart';
import 'package:gtk_flutter/source/features/common/appbar_menu_action.dart';

class ListaUserScreen extends ConsumerWidget {
  const ListaUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider.future);
    final actions = AppBarPopUpMenuActions();

    return Scaffold(
        appBar: AppBar(
          title: const Text('User'),
          actions: <Widget>[
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
                      return ListTile(
                          title: Text(user[index].name),
                          subtitle: Text(user[index].email),
                          trailing: Icon(Icons.more_vert),
                          onTap: () => context.goNamed(
                                AppRoute.editresponsavel.name,
                                pathParameters: {
                                  'id': user[index].id.toString()
                                },
                                extra: user[index],
                              ));
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
            }));
  }
}
