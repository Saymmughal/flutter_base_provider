import 'package:flutter/material.dart';
import 'package:flutter_base_provider/helper/provider_helper.dart';
import 'package:flutter_base_provider/utils/app_styles/style.dart';
import 'package:flutter_base_provider/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_provider/utils/app_styles/app_theme_colors.dart';
import 'package:flutter_base_provider/view/widgets/extention/widget_extension.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: 'Menu'.toText(fontSize: 18, fontWeight: AppStyle.w600),
        centerTitle: true,
        backgroundColor: AppThemeColors.getSurface(ProviderHelper.themeProvider.currentThemeMode),
      ),
      backgroundColor: AppThemeColors.getSurface(ProviderHelper.themeProvider.currentThemeMode),
      body: Container(child: 'Menu Screen'.toText()).center,
    );
  }
}
