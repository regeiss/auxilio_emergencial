import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/constants/app_sizes.dart';
import 'package:gtk_flutter/source/constants/config.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/features/common/widgets/link_text_span.dart';

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
              Text(Strings.empresa, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
              Text(Strings.municipio, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('Fulanosky da Silva',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white))),
              Text('999.999.999-00', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
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
            title: const Text(Strings.mensagens),
            onTap: () {
              // context.push('/ajuda');
            },
          ),
          ListTile(
            title: const Text(Strings.politicaPrivacidade),
            onTap: () {
              //context.push('/ajuda');
            },
          ),
          ListTile(
            title: const Text(Strings.termoResponsabilidade),
            onTap: () {
              //context.push('/ajuda');
            },
          ),
          ListTile(
            title: const Text(Strings.sobreApp),
            onTap: () {
              _showDialog(context);
            },
          ),
        ],
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
