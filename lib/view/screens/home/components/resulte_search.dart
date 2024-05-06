import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/constants/size_constants.dart';
import '../../../../provider/cartProvider.dart';
import '../../details/details_screen.dart';
import '../../../layouts/product_card.dart';

class Resulte_Scacrh extends StatelessWidget {
  const Resulte_Scacrh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return Column(
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
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: List.generate(
                      cardProvider.itemsSearched.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(
                            right: SizeConstants.defaultPadding),
                        child: ProductCard(
                          products: cardProvider.itemsSearched[index],
                          title: cardProvider.itemsSearched[index].title,
                          image: cardProvider.itemsSearched[index].image,
                          price: cardProvider.itemsSearched[index].price,
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      product:
                                          cardProvider.itemsSearched[index]),
                                ));
                          },
                          available:
                              cardProvider.itemsSearched[index].available,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
