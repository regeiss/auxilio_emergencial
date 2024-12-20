import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SobreAppScreen extends HookConsumerWidget {
  const SobreAppScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(Strings.ajustes),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _scaffoldKey.currentState?.closeEndDrawer();
                // Scaffold.of(context).closeEndDrawer();
                context.pop();
              },
              child: Text('OK'),
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
