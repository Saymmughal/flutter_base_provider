import 'package:flutter/material.dart';

import 'package:flutter_base_provider/view/screens/home_screen/home_screen.dart';
import 'package:flutter_base_provider/view/screens/menu_screen/menu_screeen.dart';


class BottomNavigationProvider extends ChangeNotifier {
  int currentIndex = 0;
  // Screens List
  /*=========================================================================
      Define ther screens we are going to navigate from botton navigation bar
      in bottomNavigationIndex list
    ========================================================================*/
  List<Widget> bottomNavigationIndex = [
    const HomeScreen(),
    const MenuScreen()
  ];
  // set Current Index
  setCurrentIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  // Rest Index
  resetIndex() {
    currentIndex = 0;
    notifyListeners();
  }

/*=====================================
  APIs calling
 ======================================*/
  // Veriables
}