import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CentralMensagensScreen extends HookConsumerWidget {
  const CentralMensagensScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.centralMensagens),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {
                context.goNamed(AppRoute.home.name);
              },
              child: Text('OK'),
            ),
          ],
        ),
        body: Center(
            child: Text(
          "Aguardando desenvolvimento",
          style: TextStyle(
            fontSize: 25,
            color: Colors.blue[800],
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        )));
  }
}
