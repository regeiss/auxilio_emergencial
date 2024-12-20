import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CentralAjudaScreen extends HookConsumerWidget {
  const CentralAjudaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.centralAjuda),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {
                context.pop();
              },
              child: Text('OK', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.blue)),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Central de ajuda'),
        ));
  }
}
