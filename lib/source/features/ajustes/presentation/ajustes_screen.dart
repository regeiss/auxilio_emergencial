// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/notifications/notificacao_service.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/theme/presentation/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AjustesScreen extends HookConsumerWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    final notificacoesOn = useState(true);

    final platformsMap = <DevicePlatform, String>{
      DevicePlatform.device: 'Default',
      DevicePlatform.android: 'Android',
      DevicePlatform.iOS: 'iOS',
      DevicePlatform.web: 'Web',
      DevicePlatform.fuchsia: 'Fuchsia',
      DevicePlatform.linux: 'Linux',
      DevicePlatform.macOS: 'MacOS',
      DevicePlatform.windows: 'Windows',
    };

    DevicePlatform selectedPlatform = DevicePlatform.device;
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.ajustes),
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
              SettingsTile.navigation(
                leading: Icon(Icons.cloud_outlined),
                title: Text('Ambiente'),
                value: Text('Produção'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.devices_other),
                title: Text('Plataforma'),
                onPressed: (context) {},
                value: Text(platformsMap[selectedPlatform]!),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  if (value) {
                    appThemeState.setDarkTheme();
                  } else {
                    appThemeState.setLightTheme();
                  }
                },
                initialValue: appThemeState.isDarkModeEnabled,
                leading: Icon(Icons.format_paint),
                title: Text('Tema escuro'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Conta'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.phone),
                title: Text('Telefone'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.mail),
                title: Text('Email'),
                enabled: false,
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.logout),
                title: Text('Sair'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Segurança'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (_) {},
                initialValue: true,
                leading: Icon(Icons.phonelink_lock),
                title: Text('Bloquear app em background'),
              ),
              SettingsTile.switchTile(
                onToggle: (_) {},
                initialValue: true,
                leading: Icon(Icons.fingerprint),
                title: Text('Usar biometria'),
                description: Text(
                  'Autorizar acesso a biometria',
                ),
              ),
              SettingsTile.switchTile(
                onToggle: (_) {},
                initialValue: true,
                leading: Icon(Icons.lock),
                title: Text('Alterar senha'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  if (value) {
                    notificacoesOn.value = true;
                    NotificationService.showInstantNotification('Instant Notification', 'notificação habilitada');
                  } else {
                    notificacoesOn.value = false;
                    NotificationService.showInstantNotification('Instant Notification', 'notificação habilitada');
                  }
                },
                initialValue: notificacoesOn.value,
                leading: Icon(Icons.notifications_active),
                title: Text('Habilitar notificações'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Misc'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.description),
                title: Text('Termos de serviço'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.collections_bookmark),
                title: Text('Licença'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlatformPickerScreen extends StatelessWidget {
  const PlatformPickerScreen({
    super.key,
    required this.platform,
    required this.platforms,
  });

  final DevicePlatform platform;
  final Map<DevicePlatform, String> platforms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Platforms')),
      body: SettingsList(
        platform: platform,
        sections: [
          SettingsSection(
            title: Text('Select the platform you want'),
            tiles: platforms.keys.map((e) {
              final platform = platforms[e];

              return SettingsTile(
                title: Text(platform!),
                onPressed: (_) {
                  Navigator.of(context).pop(e);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
