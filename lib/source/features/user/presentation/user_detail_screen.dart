import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gtk_flutter/source/features/common/extensions/column_extension.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/features/user/domain/user.dart';
import 'package:gtk_flutter/source/features/user/data/user_repository.dart';

class UserDetalheScreen extends ConsumerWidget {
  const UserDetalheScreen(
      {super.key, required this.userId, required this.user});

  final int userId;
  final User? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (user != null) {}
    // final userData = ref.watch(userDataProvider.future);
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
      // drawer: MainDrawer(),
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(user!.id.toString()),
            Text(user!.name),
            Text(user!.phone),
            Text(user!.address!.street),
            Text(user!.address!.suite),
            Text(user!.address!.geo!.lat),
            Text(user!.address!.geo!.lng),
            OverflowBar(
              spacing: 8,
              overflowAlignment: OverflowBarAlignment.end,
              overflowSpacing: 4,
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FilledButton(child: const Text('Cancelar'), onPressed: () {}),
                FilledButton(child: const Text('OK'), onPressed: () {}),
              ],
            ),
          ]).wrap(margin: 2.0),
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
