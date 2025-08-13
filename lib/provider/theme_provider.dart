import 'package:flutter/material.dart';
import 'package:flutter_base_provider/data/db/shared-preferences.dart';

enum AppThemeMode { system, light, dark }

class ThemeProvider extends ChangeNotifier {
  AppThemeMode currentThemeMode = AppThemeMode.system;

  ThemeProvider() {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    try {
      final themeModeIndex = await LocalDb.getThemeMode;
      if (themeModeIndex != null &&
          themeModeIndex < AppThemeMode.values.length) {
        currentThemeMode = AppThemeMode.values[themeModeIndex];
        notifyListeners();
      }
    } catch (e) {
      // Fallback to system theme if there's an error
      currentThemeMode = AppThemeMode.system;
      notifyListeners();
    }
  }

  Future<void> setThemeMode(AppThemeMode themeMode) async {
    if (currentThemeMode != themeMode) {
      currentThemeMode = themeMode;
      // Store theme mode without blocking the main thread
      _storeThemeMode(themeMode.index);
    }

    notifyListeners();
  }

  Future<void> _storeThemeMode(int index) async {
    try {
      await LocalDb.storeThemeMode(index);
    } catch (e) {
      // Handle storage error silently
      debugPrint('Failed to store theme mode: $e');
    }
  }

  Future<void> toggleTheme() async {
    if (currentThemeMode == AppThemeMode.light) {
      await setThemeMode(AppThemeMode.dark);
    } else if (currentThemeMode == AppThemeMode.dark) {
      await setThemeMode(AppThemeMode.light);
    } else {
      // If system mode, check current system theme and switch to opposite
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      if (brightness == Brightness.light) {
        await setThemeMode(AppThemeMode.dark);
      } else {
        await setThemeMode(AppThemeMode.light);
      }
    }
  }

  bool get isDarkMode {
    if (currentThemeMode == AppThemeMode.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    }
    return currentThemeMode == AppThemeMode.dark;
  }
}
