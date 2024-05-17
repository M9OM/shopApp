import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/controller/page_controller.dart';
import 'package:stylish/view/screens/cart/cart_screen.dart';
import 'package:stylish/view/screens/home/home_screen.dart';
import '../../core/common/constants/assets_constants.dart';
import '../../provider/cartProvider.dart';
import '../layouts/app_drawer.dart';
import '../layouts/bottomNavigationBar/bottomNavWidget.dart';
import '../layouts/bottomNavigationBar/bottomNavigation.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  int _selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    const ProfileScreen(),
    const CartScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return Scaffold(
        body: IndexedStack(
          children: pages,
          index: _selectedIndex,
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      );
    });
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomNavigationBar() => BottomNaviation(
        items: [
          BottomNavWidget(
            svgIcon: AssetsConstants.houseSvg,
            isSelected: _selectedIndex == 0,
            onTap: () {
              onItemTapped(0);
            },
          ),

          BottomNavWidget(
            svgIcon: AssetsConstants.personSvg,
            isSelected: _selectedIndex == 1,
            onTap: () {
              onItemTapped(1);
            },
          ),
          BottomNavWidget(
            svgIcon: AssetsConstants.cartSvg,
            isSelected: _selectedIndex == 2,
            onTap: () {
              onItemTapped(2);
            },
          ),
        ],
      );
}

