import 'package:flutter/material.dart';

class OboardingProvider with ChangeNotifier {
  // _ quiere decri  privado
  int _currentPage = 0;

  PageController _pageController = PageController(
    initialPage: 0,
  );
  //Se le agrego en Int para que no agarrarmarcar errores
  dynamic get currentPag => currentPag;
  get pageController => pageController;

  set currentPage(int value) {
    _currentPage = value;

    pageController.animateToPage(value,
        duration: Duration(milliseconds: 300), curve: Curves.easeInBack);
    notifyListeners();
  }
}
