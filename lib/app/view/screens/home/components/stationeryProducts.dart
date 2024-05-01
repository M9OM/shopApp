import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stylish/app/models/Product.dart';
import 'package:stylish/app/view/screens/details/details_screen.dart';
import 'package:stylish/app/services/firebaseService.dart';

import '../../../../core/common/constants/size_constants.dart';
import '../../../../provider/cartProvider.dart';
import '../../../../provider/recently_browsed_provider.dart';
import 'product_card.dart';
import 'section_title.dart';

class StationeryProducts extends StatelessWidget {
  const StationeryProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: SizeConstants.defaultPadding),
          child: SectionTitle(
            title: "ذات صلة",
            pressSeeAll: () {},
          ),
        ),
        FutureBuilder<List<Product>>(
          future: FirebaseServices().fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: InkWell(
                    onTap: () => print(snapshot.error),
                    child: Text('Error: ${snapshot.error}')),
              );
            } else if (snapshot.data == null) {
              return const Center(
                child: Text('No data available'),
              );
            } else {
              final List<Product> products = snapshot.data!;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    products.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                          right: SizeConstants.defaultPadding),
                      child: Consumer<CartProvider>(
                          builder: (context, cardProvider, child) {
                        return Consumer<RecentlyBrowsed>(
                            builder: (context, recentlyBrowsed, _) {
                          return ProductCard(
                            addCart: () {
                              cardProvider.addToCart(products[index], context);
                            },
                            title: products[index].title.toString(),
                            image: products[index].image,
                            price: products[index].price.toDouble(),
                            available: products[index].available,
                            press: () {
                              recentlyBrowsed.addToRecentliy(products[index]);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(product: products[index]),
                                ),
                              );
                            },
                          );
                        });
                      }),
                    ),
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
