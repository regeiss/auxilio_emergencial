import 'package:flutter/material.dart';
import 'package:gtk_flutter/source/common_widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class AjustesScreen extends ConsumerWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.homePage),
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
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Comuns'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Linguagem'),
                value: Text('Português'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Habiltar tema customizado'),
              ),
            ],
          ),
        ],
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
