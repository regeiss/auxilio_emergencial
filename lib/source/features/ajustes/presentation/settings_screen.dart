import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:gtk_flutter/source/features/common/appbar_menu_action.dart';

class AjustesScreen extends HookWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useDarkMode = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.ajustes),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.goNamed(AppRoute.home.name);
            },
            child: Text('OK'),
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
                onToggle: (value) {
                  useDarkMode.value = true;
                },
                initialValue: false,
                leading: Icon(Icons.format_paint),
                title: Text('Habilitar tema customizado'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: false,
                leading: Icon(Icons.dark_mode_outlined),
                title: Text('Habilitar tema esccuro'),
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
