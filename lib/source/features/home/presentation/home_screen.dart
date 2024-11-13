import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:gtk_flutter/source/common_widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/features/auth/data/firebase_auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.homePage),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => handleClick(item, ref, context),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
                PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
              ],
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[100],
                    child: const Text("Area 1"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[200],
                    child: const Text('Area 2'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue[300],
                    child: const Text('Area 3'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue[400],
                    child: const Text('Area 4'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange[500],
                    child: const Text('Area 5'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange[600],
                    child: const Text('Area 6'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red[700],
                    child: const Text('Area 7'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red[800],
                    child: const Text('Area 8'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void handleClick(int item, WidgetRef ref, BuildContext context) {
    switch (item) {
      case 0:
        _showAlertDialog(context);
        // ref.read(firebaseAuthProvider).signOut();
        break;
      case 1:
        break;
    }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog Title'),
          content: Text('This is a simple alert dialog.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
