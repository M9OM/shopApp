import 'package:flutter/material.dart';

class PageControllerModel extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void changePage(int index) {
    _currentPageIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
}
