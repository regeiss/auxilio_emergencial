import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/constants/strings.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            curve: Curves.bounceInOut,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(Strings.empresa, style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white))
            ]),
          ),
          ListTile(
            title: Text(
              Strings.login,
            ),
            onTap: () {
              context.push('/signin');
            },
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
