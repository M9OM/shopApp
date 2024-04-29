import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/app/core/common/constants/assets_constants.dart';
import 'package:stylish/app/core/common/constants/size_constants.dart';
import 'package:stylish/app/provider/cartProvider.dart';
import 'package:stylish/app/view/layouts/app_drawer.dart';
import 'package:stylish/app/view/screens/cart/cart_screen.dart';
import 'package:stylish/app/view/screens/details/details_screen.dart';

import 'components/categories.dart';
import 'components/product_card.dart';
import 'components/resulte_search.dart';
import 'components/stationeryProducts.dart';
import 'components/books.dart';
import 'components/search_form.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: const AppDrawer(),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _openDrawer();
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(SizeConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsConstants.logoPng,
                width: 80,
              ),
              const Text(
                "كل ما يخص القرطاسيات",
                style: TextStyle(fontSize: 18),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConstants.defaultPadding),
                child: SearchForm(),
              ),
              cardProvider.itemsSearched.length != 0
                  ? Resulte_Scacrh()
                  : const SizedBox(),
              const Categories(),
              const StationeryProducts(),
              // const BooksProducts(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    });
  }
}
