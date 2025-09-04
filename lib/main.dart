import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_provider/helper/provider_helper.dart';
import 'package:flutter_base_provider/utils/app_styles/app_theme_data.dart';
import 'package:flutter_base_provider/utils/app_styles/colors.dart';
import 'package:flutter_base_provider/utils/env_configuration/load_env_file.dart';
import 'package:flutter_base_provider/data/db/shared-preferences.dart';
import 'package:flutter_base_provider/utils/performance_monitor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base_provider/helper/routes_helper.dart';
import 'package:flutter_base_provider/helper/scroll_behaviour.dart';
import 'package:flutter_base_provider/provider/theme_provider.dart';

import 'helper/connection_manager.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize optimized SharedPreferences cache in background
  // Use unawaited to prevent blocking app startup
  unawaited(LocalDb.initializeCache());

  // Initialize performance monitoring
  PerformanceMonitor.instance.initialize();

  // Load environment variables
  await LoadEnvFile.load();
  // For Firebase Initialization
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseMessaging.instance.getToken().then((value) {
  //   debugPrint("Token =======================>>>>>>>>>>> : $value");
  // });
  // FirebaseMessaging.instance.requestPermission();
  // To initialize Push notifications
  // await NotificationService().initialize();
  // To edge to edge for android 15 and above ============================>
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // Optional: match system bar icon brightness to your theme dynamically.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
      systemNavigationBarColor: AppColors.transparentColor,
    ),
  );
  // To allow all orientation
  // if you don't want portraitDown but all other orientation then
  // remove SystemChrome.setPreferredOrientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectionManager().initialize();

    return MultiProvider(
      providers: ProviderHelper.providers,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child!,
                ),
              );
            },
            debugShowCheckedModeBanner: false,
            title: 'Base Project',
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: _getThemeMode(themeProvider.currentThemeMode),
            initialRoute: RouterHelper.initial,
            routes: RouterHelper.routes,
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}
