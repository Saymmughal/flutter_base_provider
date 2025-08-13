import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_provider/helper/provider_helper.dart';
import 'package:flutter_base_provider/utils/app_styles/colors.dart';
import 'package:flutter_base_provider/provider/bottom_navigation_provider.dart';
import 'package:flutter_base_provider/view/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppColors.systemUiOverlayStyle(context),
      child: Consumer<BottomNavigationProvider>(
        builder: (context, controller, child) => Scaffold(
          body: controller.bottomNavigationIndex[controller.currentIndex],
          bottomNavigationBar: BottomNavigation(
            currentIndex: 0,
            themeMode: ProviderHelper.themeProvider.currentThemeMode,
          ),
        ),
      ),
    );
  }
}
