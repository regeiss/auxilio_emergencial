import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            curve: Curves.bounceInOut,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(Strings.empresa),
          ),
          ListTile(
            title: const Text(Strings.centralAjuda),
            onTap: () {
              context.push('/ajuda');
            },
          ),
          ListTile(
            title: const Text(Strings.sobreApp),
            onTap: () {
              context.push('/sobre');
            },
          ),
        ],
      ),
    );
  }
}
