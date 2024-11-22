import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/features/user/domain/user.dart';
import 'package:gtk_flutter/source/features/user/data/user_repository.dart';

class UserDetalheScreen extends ConsumerWidget {
  const UserDetalheScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider.future);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item, ref),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Logout')),
              PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
            ],
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: FutureBuilder(
        future: userData,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<User> user = snapshot.data!;
            return ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(user[index].name),
                  subtitle: Text(user[index].email),
                  // leading: Text(user[index].phone),
                  children: [Text(user[index].username)],
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
    );
  }

  void handleClick(int item, WidgetRef ref) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
