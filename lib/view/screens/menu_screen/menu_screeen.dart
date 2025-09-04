import 'package:flutter/material.dart';
import 'package:flutter_base_provider/utils/dimension.dart';
import 'package:flutter_base_provider/view/widgets/extention/string_extension.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: safeAreaHeight,
      alignment: Alignment.center,
      child: 'Menu Screen'.toText(),
    );
  }
}
