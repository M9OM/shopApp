
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/provider/cartProvider.dart';
import 'package:stylish/view/layouts/app_drawer.dart';
import 'components/header.dart';
import 'components/recentlyProducts.dart';
import 'components/bestSellers.dart';
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
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Remove Expanded widget from here
                    BestSellersProducts(),
                    RecentlyProduct(),
                    SizedBox(height: 140),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
