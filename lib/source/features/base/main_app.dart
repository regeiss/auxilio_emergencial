import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:gtk_flutter/source/theme/domain/theme_data.dart';
import 'package:gtk_flutter/source/theme/presentation/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import '../../core/router/app_router.dart';

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  void initState() {
    super.initState();
    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onShow: () => _handleTransition('show'),
      onResume: () => _handleTransition('resume'),
      onHide: () => _handleTransition('hide'),
      onInactive: () => _handleTransition('inactive'),
      onPause: () => _handleTransition('pause'),
      onDetach: () => _handleTransition('detach'),
      onRestart: () => _handleTransition('restart'),
      // This fires for each state change. Callbacks above fire only for
      // specific state transitions.
      onStateChange: _handleStateChange,
    );
    if (_state != null) {
      _states.add(_state!.name);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final appThemeState = ref.watch(appThemeStateNotifier);
    late final AppLifecycleListener _listener;
    final List<String> _states = <String>[];
    late AppLifecycleState? _state;

    return MaterialApp.router(
      routerConfig: goRouter,
      locale: const Locale('pt'),
      supportedLocales: [const Locale('pt'), const Locale('en')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      themeMode: appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightblueWhale,
      darkTheme: AppTheme.darkblueWhale,
      highContrastTheme: FlexThemeData.dark(),
      highContrastDarkTheme: FlexThemeData.light(),
    );
  }
}
