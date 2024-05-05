import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/core/common/constants/assets_constants.dart';
import 'package:stylish/core/common/constants/size_constants.dart';
import 'package:stylish/provider/cartProvider.dart';
import 'package:stylish/view/layouts/app_drawer.dart';
import 'package:stylish/view/screens/cart/cart_screen.dart';
import 'package:stylish/view/screens/details/details_screen.dart';

import 'components/apbar.dart';
import 'components/categories.dart';
import 'components/header.dart';
import '../../layouts/product_card.dart';
import 'components/recentlyProducts.dart';
import 'components/resulte_search.dart';
import 'components/bestSellers.dart';
import '../../layouts/search_form.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return Scaffold(
        backgroundColor: Colors.indigoAccent,
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Image.asset(
                //   AssetsConstants.logoPng,
                // ),
         

                Header(),
                // cardProvider.itemsSearched.isNotEmpty
                //     ? const Resulte_Scacrh()
                //     : const SizedBox(),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      BestSellersProducts(),
                      const RecentlyProduct(),
                      // const BooksProducts(),
                      const SizedBox(
                        height: 140,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
