import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/app/controller/MenuAppController.dart';
import 'package:stylish/app/controller/page_controller.dart';
import 'package:stylish/app/view/screens/cart/cart_screen.dart';
import 'package:stylish/app/view/screens/home/home_screen.dart';
import '../../core/common/constants/assets_constants.dart';
import '../../provider/cartProvider.dart';
import '../layouts/app_drawer.dart';
import '../layouts/bottomNavigationBar/bottomNavigation.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
  List<Widget> screens = [
    HomeScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return Scaffold(
        key:_scaffoldKey,
                drawer: const AppDrawer(),

        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
            controlMenu();
            },
            icon: SvgPicture.asset(AssetsConstants.menuSvg),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Stack(
                      children: [SvgPicture.asset(AssetsConstants.cartSvg)]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ));
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: Text(
                    cardProvider.productCardList.length.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        extendBody: true,
        body:
            Consumer<PageControllerModel>(builder: (context, pageModel, child) {
          return PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageModel.pageController,
              children: screens);
        }),
        bottomNavigationBar: const BottomNaviation(),
      );
    });
  }
}
