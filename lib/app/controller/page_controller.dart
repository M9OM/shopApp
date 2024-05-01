import 'package:flutter/material.dart';

class PageControllerModel extends ChangeNotifier {
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  void changePage(int index) {
    _currentPageIndex = index;
    _pageController.jumpToPage(
      index, // The index of the page to scroll to
    );
    notifyListeners();
  }
}
