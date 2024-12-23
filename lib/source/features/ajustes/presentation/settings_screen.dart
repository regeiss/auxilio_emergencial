// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/constants/app_sizes.dart';
import 'package:gtk_flutter/source/constants/config.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/features/common/widgets/link_text_span.dart';
import 'package:gtk_flutter/source/theme/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class AjustesScreen extends HookConsumerWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SettingsGroup(
              backgroundColor: Colors.blue,
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.edit_square,
                  iconStyle: IconStyle(),
                  title: 'Aparência',
                  subtitle: "Make Ziar'App yours",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.black,
                  ),
                  title: 'Modo escuro ',
                  subtitle: "Automático",
                  trailing: Switch.adaptive(
                    value: appThemeState.isDarkModeEnabled,
                    onChanged: (enabled) {
                      if (enabled) {
                        appThemeState.setDarkTheme();
                      } else {
                        appThemeState.setLightTheme();
                      }
                    },
                  ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.text_increase,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Modo alto contraste ',
                  subtitle: "HC",
                  trailing: Switch.adaptive(
                    value: appThemeState.isHighContrastEnabled,
                    onChanged: (enabled) {
                      if (enabled) {
                        appThemeState.setHighContrast();
                      } else {
                        appThemeState.unsetHighContrast();
                      }
                    },
                  ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    _showDialog(context);
                  },
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Sobre',
                  subtitle: "Informações do app",
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Conta",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  title: "Sair",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.delete_forever,
                  title: "Excluir conta",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.bodyLarge!;
    final TextStyle footerStyle = themeData.textTheme.bodySmall!;
    final TextStyle linkStyle = themeData.textTheme.bodyLarge!.copyWith(color: themeData.primaryColor);

    showAboutDialog(
      context: context,
      applicationName: 'Flutter',
      applicationIcon: FlutterLogo(),
      applicationVersion: '1.0.0',
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: AppInsets.l),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: aboutTextStyle,
                  text: 'This app demos FlexColorScheme theming, '
                      'together with Riverpod and three different '
                      'settings persistence implementations, volatile memory, '
                      'SharedPreferences and Hive.\n\n'
                      'Check out FlexColorScheme package on ',
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: AppConst.packageUri,
                  text: 'pub.dev',
                ),
                TextSpan(
                  style: aboutTextStyle,
                  text: '.\n\n',
                ),
                TextSpan(
                  style: footerStyle,
                  text: 'Built with Flutter ${AppConst.flutterVersion}, using '
                      'FlexColorScheme package ${AppConst.packageVersion}\n\n',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
