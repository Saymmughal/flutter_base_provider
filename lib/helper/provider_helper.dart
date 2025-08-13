import 'package:flutter_base_provider/main.dart';
import 'package:flutter_base_provider/provider/auth_privider.dart';
import 'package:flutter_base_provider/provider/bottom_navigation_provider.dart';
import 'package:flutter_base_provider/provider/home_provider.dart';
import 'package:flutter_base_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ProviderHelper {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
    ChangeNotifierProvider<BottomNavigationProvider>(
      create: (_) => BottomNavigationProvider(),
    ),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
  ];

  static final themeProvider = Provider.of<ThemeProvider>(
    navigatorKey.currentContext!,
    listen: true,
  );

  static final authProvider = Provider.of<AuthProvider>(
    navigatorKey.currentContext!,
    listen: false,
  );
  static final navProvider = Provider.of<BottomNavigationProvider>(
    navigatorKey.currentContext!,
    listen: false,
  );
  static final homeProvider = Provider.of<HomeProvider>(
    navigatorKey.currentContext!,
    listen: false,
  );
}
