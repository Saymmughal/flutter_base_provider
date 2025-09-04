import 'package:flutter/material.dart';
import 'package:flutter_base_provider/helper/provider_helper.dart';
import 'package:flutter_base_provider/utils/app_styles/colors.dart';
import 'package:flutter_base_provider/provider/bottom_navigation_provider.dart';
import 'package:flutter_base_provider/view/widgets/bottom_navigation.dart';
import 'package:flutter_base_provider/view/widgets/extention/annotated_widget.dart';
import 'package:flutter_base_provider/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_provider/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_provider/utils/dimension_manager.dart';
import 'package:flutter_base_provider/utils/font_scaling_manager.dart';
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
    // Initialize dimension manager and font scaling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      DimensionManager.instance.initialize(context);
      FontScalingManager.instance.preCalculateCommonSizes();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update dimension manager when screen size changes
    DimensionManager.instance.forceRefresh(context);
  }

  @override
  Widget build(BuildContext context) {
    return annotatedRegionWidget(
      context: context,
      child: Consumer<BottomNavigationProvider>(
        builder: (context, controller, child) => OrientationBuilder(
          builder: (context, orientation) {
            // Mark dimension manager for refresh on orientation change
            DimensionManager.instance.markForRefresh();
            // Clear font scaling cache on orientation change
            FontScalingManager.instance.clearCache();

            return Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: controller
                    .bottomNavigationIndexNameList[controller.currentIndex]
                    .toText(fontSize: 18, fontWeight: FontWeight.w600),
                centerTitle: true,
                backgroundColor: AppColors.transparentColor,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: controller.currentIndex == 1
                      ? AppColors.whitePrimary
                      : AppColors.blackDark,
                  weight: 14.w,
                ),
                systemOverlayStyle: AppColors.whiteStatusBar,
              ),
              body: controller.bottomNavigationIndex[controller.currentIndex],
              bottomNavigationBar: BottomNavigation(
                currentIndex: 0,
                themeMode: ProviderHelper.themeProvider.currentThemeMode,
              ),
            );
          },
        ),
      ),
    );
  }
}
