import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/app/controller/page_controller.dart';
import 'package:stylish/app/view/screens/cart/cart_screen.dart';
import 'package:stylish/app/view/screens/home/home_screen.dart';
import '../layouts/bottomNavigationBar/bottomNavigation.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  List<Widget> screens = [
    const CartScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Consumer<PageControllerModel>(builder: (context, pageModel, child) {
        return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageModel.pageController,
            children: screens);
      }),
      bottomNavigationBar: const BottomNaviation(),
    );
  }
}
