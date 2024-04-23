import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/provider/cartProvider.dart';
import 'package:stylish/screens/cart/components/product_cart.dart';
import '../../constants.dart';
import '../details/details_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cardProvider, child) {
        // Get unique values from the product list
        Set<Product> uniqueValues = cardProvider.productCardList.toSet();

        return Scaffold(
          appBar: AppBar(
            title: const Text('سلتي'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'دفع >',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: uniqueValues.map((item) {
                      int count = cardProvider.productCardList
                          .where((value) => value == item)
                          .length;

                      return Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5,
                                    color: Theme.of(context).dividerColor))),
                        child: ProductAtCart(
                          title: item.title,
                          image: item.image,
                          price: item.price,
                          countItemOrder: count,
                          
                          remove: () {
                            cardProvider.removeProduct(item);
                          },
                          removeAll:(){                            cardProvider.removeProductAll(item);
},
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  product: item,
                                ),
                              ),
                            );
                          }, addItem:(){ cardProvider.addToCart(item); }
,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[200],
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'السلع',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'المجموع:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'X' +
                                cardProvider.productCardList.length.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "OMR " + cardProvider.getPrice().toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
