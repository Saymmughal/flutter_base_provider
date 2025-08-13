import 'dart:async';
import 'package:flutter_base_provider/helper/provider_helper.dart';
import 'package:flutter_base_provider/helper/router_navigator.dart';
import 'package:flutter_base_provider/helper/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_provider/utils/app_styles/style.dart';
import 'package:flutter_base_provider/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_provider/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_provider/utils/app_styles/app_theme_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routes();
  }

  void routes() async {
    Timer(const Duration(seconds: 3), () async {
      //   bool? isLogin = await LocalDb.getLogin;
      //   if (isLogin == true) {
      //   } else {
      goReplacementNamed(RouterHelper.logInScreen);
      //   }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppThemeColors.getPrimary(
                ProviderHelper.themeProvider.currentThemeMode,
              ),
              AppThemeColors.getSecondary(
                ProviderHelper.themeProvider.currentThemeMode,
              ),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon/Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppThemeColors.getTextOnPrimary(
                    ProviderHelper.themeProvider.currentThemeMode,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  Icons.flutter_dash,
                  size: 80,
                  color: AppThemeColors.getPrimary(
                    ProviderHelper.themeProvider.currentThemeMode,
                  ),
                ),
              ),
              32.height,

              // App Title
              'Base Project'.toText(
                fontSize: 28,
                fontWeight: AppStyle.w700,
                color: AppThemeColors.getTextOnPrimary(
                  ProviderHelper.themeProvider.currentThemeMode,
                ),
              ),
              8.height,

              // App Subtitle
              'Flutter + Riverpod + Dark Theme'.toText(
                fontSize: 16,
                color: AppThemeColors.getTextOnPrimary(
                  ProviderHelper.themeProvider.currentThemeMode,
                ).withValues(alpha: 204),
              ),
              48.height,

              // Loading Indicator
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppThemeColors.getTextOnPrimary(
                      ProviderHelper.themeProvider.currentThemeMode,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
