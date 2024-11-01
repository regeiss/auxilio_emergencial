import 'package:flutter/material.dart';
import 'package:gtk_flutter/source/common_widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaceholderScreen extends ConsumerWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.placeholderPage),
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

  void handleClick(int item, WidgetRef ref) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
