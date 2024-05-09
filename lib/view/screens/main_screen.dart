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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  int _selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: const AppDrawer(),
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {
        //       controlMenu();
        //     },
        //     icon: SvgPicture.asset(AssetsConstants.menuSvg),
        //   ),
        //   actions: [
        //     Stack(
        //       children: [
        //         IconButton(
        //           icon: Stack(
        //               children: [SvgPicture.asset(AssetsConstants.cartSvg)]),
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => const CartScreen(),
        //                 ));
        //           },
        //         ),
        //         Container(
        //           padding: const EdgeInsets.all(6),
        //           decoration: const BoxDecoration(
        //               color: Colors.red, shape: BoxShape.circle),
        //           child: Text(
        //             cardProvider.productCardList.length.toString(),
        //             textAlign: TextAlign.center,
        //             style: const TextStyle(
        //               color: Colors.white,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
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
            isSelected: _selectedIndex == 2,
            onTap: () {
              onItemTapped(2);
            },
          ),
          BottomNavWidget(
            svgIcon: AssetsConstants.cartSvg,
            isSelected: _selectedIndex == 3,
            onTap: () {
              onItemTapped(3);
            },
          ),
        ],
      );
}
