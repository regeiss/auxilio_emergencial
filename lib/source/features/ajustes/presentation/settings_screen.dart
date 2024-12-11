// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
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
            // User card
            BigUserCard(
              backgroundColor: Colors.red,
              userName: "Sistemas Internos  ",
              userProfilePic: AssetImage("assets/user.png"),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Modificar",
                subtitle: "Clique para alterar seus dados",
                onTap: () {
                  print("OK");
                },
              ),
            ),
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
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Sobre',
                  subtitle: "Learn more about Ziar'App",
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
}
      
      
      
      
      
//       Switch(
//       value: appThemeState.isDarkModeEnabled,
//       onChanged: (enabled) {
//          if (enabled) {
//           appThemeState.setDarkTheme();
//         } else {
//           appThemeState.setLightTheme();
//         }
//       },
//       ),
//     );
//   }
// }
