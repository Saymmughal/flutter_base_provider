import 'package:flutter/material.dart';
import 'package:flutter_base_provider/helper/provider_helper.dart';
import 'package:flutter_base_provider/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_provider/provider/theme_provider.dart';
import 'package:flutter_base_provider/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_provider/utils/app_styles/style.dart';
import 'package:flutter_base_provider/utils/app_styles/app_theme_colors.dart';
import 'package:provider/provider.dart';

class ThemeToggleWidget extends StatelessWidget {
  final bool showLabel;
  final double size;
  final EdgeInsetsGeometry? padding;

  const ThemeToggleWidget({
    super.key,
    this.showLabel = true,
    this.size = 24.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, controller, child) => PopupMenuButton<AppThemeMode>(
        icon: Icon(
          _getThemeIcon(controller.currentThemeMode),
          size: size,
          color: AppThemeColors.getTextPrimary(controller.currentThemeMode),
        ),
        padding: padding ?? const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 8,
        onSelected: (AppThemeMode themeMode) {
          controller.setThemeMode(themeMode);
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<AppThemeMode>(
            value: AppThemeMode.system,
            child: Row(
              children: [
                Icon(
                  Icons.brightness_auto,
                  color: controller.currentThemeMode == AppThemeMode.system
                      ? AppThemeColors.getPrimary(controller.currentThemeMode)
                      : null,
                ),
                if (showLabel) ...[
                  12.width,
                  'System'.toText(
                    fontWeight:
                        controller.currentThemeMode == AppThemeMode.system
                        ? AppStyle.w600
                        : AppStyle.w400,
                    color: controller.currentThemeMode == AppThemeMode.system
                        ? AppThemeColors.getPrimary(controller.currentThemeMode)
                        : null,
                  ),
                ],
              ],
            ),
          ),
          PopupMenuItem<AppThemeMode>(
            value: AppThemeMode.light,
            child: Row(
              children: [
                Icon(
                  Icons.light_mode,
                  color: controller.currentThemeMode == AppThemeMode.light
                      ? AppThemeColors.getPrimary(controller.currentThemeMode)
                      : null,
                ),
                if (showLabel) ...[
                  12.width,
                  'Light'.toText(
                    fontWeight:
                        controller.currentThemeMode == AppThemeMode.light
                        ? AppStyle.w600
                        : AppStyle.w400,
                    color: controller.currentThemeMode == AppThemeMode.light
                        ? AppThemeColors.getPrimary(controller.currentThemeMode)
                        : null,
                  ),
                ],
              ],
            ),
          ),
          PopupMenuItem<AppThemeMode>(
            value: AppThemeMode.dark,
            child: Row(
              children: [
                Icon(
                  Icons.dark_mode,
                  color: controller.currentThemeMode == AppThemeMode.dark
                      ? AppThemeColors.getPrimary(controller.currentThemeMode)
                      : null,
                ),
                if (showLabel) ...[
                  12.width,
                  'Dark'.toText(
                    fontWeight: controller.currentThemeMode == AppThemeMode.dark
                        ? AppStyle.w600
                        : AppStyle.w400,
                    color: controller.currentThemeMode == AppThemeMode.dark
                        ? AppThemeColors.getPrimary(controller.currentThemeMode)
                        : null,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getThemeIcon(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
      case AppThemeMode.system:
        return Icons.brightness_auto;
    }
  }
}

// Simple theme toggle button for quick switching
class SimpleThemeToggle extends StatelessWidget {
  final double size;
  final EdgeInsetsGeometry? padding;

  const SimpleThemeToggle({super.key, this.size = 24.0, this.padding});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.brightness_6,
        size: size,
        color: AppThemeColors.getTextPrimary(
          ProviderHelper.themeProvider.currentThemeMode,
        ),
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
      onPressed: () {
        ProviderHelper.themeProvider.toggleTheme();
      },
      tooltip: 'Toggle theme',
    );
  }
}
