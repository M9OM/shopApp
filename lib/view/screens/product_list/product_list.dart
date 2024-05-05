import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stylish/view/layouts/product_card.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';

import '../../../models/Product.dart';
import '../../../provider/cartProvider.dart';

// ignore: must_be_immutable
class ProductList extends StatelessWidget {
  ProductList({Key? key,  this.future}) : super(key: key);

Future<List<Product>>? future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'كل المنتجات',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            FutureBuilder<List<Product>>(
              future: future!,
              builder: (context, snapshot) {
              List<Product> products = snapshot.data!;
                return Expanded(
                  // Wrap GridView.builder with Expanded
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 200,
                        child: Consumer<CartProvider>(
                            builder: (context, cardProvider, child) {
                          return ProductCard(
                            image: products[index].image,
                            title: products[index].title,
                            price: products[index].price,
                            press: () {},
                            available: products[index].available,
                            addCart: () {
                              cardProvider.addToCart(products[index], context);
                            },
                          );
                        }),
                      );
                    },
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
