import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/view/screens/details/details_screen.dart';
import 'package:stylish/view/screens/home/components/section_title.dart';
import 'package:stylish/view/screens/product_list/product_list.dart';
import 'package:stylish/controller/home_controller.dart';
import 'package:stylish/core/common/constants/size_constants.dart';
import 'package:stylish/provider/cartProvider.dart';
import 'package:stylish/provider/recently_browsed_provider.dart';
import 'package:stylish/view/layouts/product_card.dart';

class BestSellersProducts extends StatefulWidget {
  const BestSellersProducts({Key? key}) : super(key: key);

  @override
  State<BestSellersProducts> createState() => _BestSellersProductsState();
}

class _BestSellersProductsState extends State<BestSellersProducts> {
  final ProductController controller = ProductController();
  late Future<List<Product>> _future;

  @override
  void initState() {
    _future = controller.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: SizeConstants.defaultPadding,
          ),
          child: SectionTitle(
            title: "الاكثر مبيعا",
            pressSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductList(future: _future),
                ),
              );
            },
          ),
        ),
        FutureBuilder<List<Product>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: InkWell(
                  onTap: () => print(snapshot.error),
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            } else if (snapshot.data == null) {
              return const Center(
                child: Text('No data available'),
              );
            } else {
              final List<Product> products = snapshot.data!;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    products.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConstants.defaultPadding,
                      ),
                      child: Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          return Consumer<RecentlyBrowsed>(
                            builder: (context, recentlyBrowsed, _) {
                              return ProductCard(
                                addCart: () {
                                  cartProvider.addToCart(
                                    products[index],
                                    context,
                                  );
                                },
                                title: products[index].title.toString(),
                                image: products[index].image,
                                price: products[index].price.toDouble(),
                                available: products[index].available,
                                press: () {
                                  recentlyBrowsed.addToRecentliy(
                                    products[index],
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        product: products[index],
                                      ),
                                    ),
                                  );
                                },
                                products: products[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
