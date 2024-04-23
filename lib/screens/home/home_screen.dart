import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/provider/cartProvider.dart';
import 'package:stylish/screens/cart/cart_screen.dart';
import 'package:stylish/screens/details/details_screen.dart';

import 'components/categories.dart';
import 'components/product_card.dart';
import 'components/stationeryProducts.dart';
import 'components/books.dart';
import 'components/search_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/menu.svg"),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Stack(children: [
                    SvgPicture.asset("assets/icons/shopping-cart.svg")
                  ]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ));
                  },
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Text(
                    cardProvider.productCardList.length.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " مكتبة البوصافي",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const Text(
                "كل ما يخص القرطاسيات",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: SearchForm(),
              ),
              cardProvider.itemsSearched.length != 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "نتائج البحث:",
                          style: TextStyle(fontSize: 15),
                        ),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: List.generate(
                                    cardProvider.itemsSearched.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(
                                          right: defaultPadding),
                                      child: ProductCard(
                                        title: cardProvider
                                            .itemsSearched[index].title,
                                        image: cardProvider
                                            .itemsSearched[index].image,
                                        price: cardProvider
                                            .itemsSearched[index].price,
                                        press: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsScreen(
                                                        product: cardProvider
                                                                .itemsSearched[
                                                            index]),
                                              ));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              const Categories(),
              const StationeryProducts(),
              // const BooksProducts(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    });
  }
}
