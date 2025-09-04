import 'package:flutter_base_provider/helper/connection_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_provider/helper/provider_helper.dart';
import 'package:flutter_base_provider/provider/home_provider.dart';
import 'package:flutter_base_provider/utils/dimension.dart';
import 'package:flutter_base_provider/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_provider/view/widgets/prrimary_button.dart';
import 'package:flutter_base_provider/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_provider/view/widgets/extention/widget_extension.dart';
import 'package:flutter_base_provider/utils/app_styles/style.dart';
import 'package:flutter_base_provider/utils/app_styles/app_theme_colors.dart';

import 'package:flutter_base_provider/helper/router_navigator.dart';
import 'package:flutter_base_provider/helper/routes_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    callingAPIs();
    super.initState();
  }

  callingAPIs() {
    // Call APIs
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, controller, child) => SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home,
                        size: 64,
                        color: AppThemeColors.getPrimary(
                          ProviderHelper.themeProvider.currentThemeMode,
                        ),
                      ),
                      16.height,
                      'Welcome to Home Screen'.toText(
                        fontSize: 20,
                        fontWeight: AppStyle.w600,
                        textAlign: TextAlign.center,
                      ),
                      8.height,
                      'This is your base Flutter project with Provider and dark theme support'
                          .toText(
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                          ),
                      24.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              buttonName: 'Test Connection',
                              onPressed: () {
                                ConnectionManager().checkInternetConnection();
                              },
                            ),
                          ),
                          20.width,
                          Expanded(
                            child: PrimaryButton(
                              buttonName: 'Theme Demo',
                              onPressed: () {
                                goToNamed(RouterHelper.themeDemoScreen);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).center.paddingSymmetric(horizontal: isLandscapePossible ? 40.w : 20.w),
        ),
      ),
    );
  }
}
