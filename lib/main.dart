// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/firebase_options.dart';
import 'package:gtk_flutter/source/core/notifications/notificacao_service.dart';
import 'package:gtk_flutter/source/features/base/main_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:timezone/data/latest.dart' as timezone;
import 'package:app_badge_plus/app_badge_plus.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);
late final AppLifecycleListener listener;

Future<void> main() async {
  void registerErrorHandlers() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      debugPrint(details.toString());
    };

    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      debugPrint(error.toString());
      return true;
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Ocorreu um erro'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }

  // tratamento do ciclo de vida do app
  void onDetached() => logger.d('detached');
  void onResumed() {
    logger.d('resumed');
    AppBadgePlus.updateBadge(3);
  }

  void onInactive() => logger.d('inactive');
  void onHidden() => logger.d('hidden');
  void onPaused() => logger.d('paused');

  void onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        onDetached();
      case AppLifecycleState.resumed:
        onResumed();
      case AppLifecycleState.inactive:
        onInactive();
      case AppLifecycleState.hidden:
        onHidden();
      case AppLifecycleState.paused:
        onPaused();
    }
  }

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  listener = AppLifecycleListener(onStateChange: onStateChanged);
  registerErrorHandlers();
  await NotificationService.init();
  timezone.initializeTimeZones();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
  FlutterNativeSplash.remove();
}
