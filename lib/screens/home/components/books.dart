import 'package:flutter/material.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/services/firebaseService.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class BooksProducts extends StatelessWidget {
  const BooksProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "كتب",
            pressSeeAll: () {},
          ),
        ),
        FutureBuilder<List<Product>>(
        future: FirebaseServices().fetchProducts(),
        builder: (context, snapshot) {
            final products = snapshot.data!;


          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } 
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  products.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: ProductCard(
                      title: products[index].title,
                      image: products[index].image,
                      price: products[index].price,
                      press: () {},
                    ),
                  ),
                ),
              ),
            );
          }
        )
      ],
    );
  }
}
