import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/core/common/constants/assets_constants.dart';
import 'package:stylish/core/common/constants/size_constants.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/view/screens/cart/cart_screen.dart';
import '../../../provider/cartProvider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/theme/custom_colors.dart';
import '../home/components/recentlyProducts.dart';
class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.product}) : super(key: key);
  PageController _controller = new PageController();

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: PageView.builder(
                    controller: _controller,
                    itemCount: product.image.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          product.image[index],
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.contain,
                        ),
                      );
                    }),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: product.image.length,
                  effect: const SlideEffect(
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey,
                      type: SlideType.slideUnder),
                ),
              ),
            ),
            const SizedBox(height: SizeConstants.defaultPadding * 1.5),
            Container(
              padding: const EdgeInsets.fromLTRB(
                  SizeConstants.defaultPadding,
                  SizeConstants.defaultPadding * 2,
                  SizeConstants.defaultPadding,
                  SizeConstants.defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConstants.defaultBorderRadius * 3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: SizeConstants.defaultPadding),
                      Text(
                        product.price.toString() + " ريال",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: SizeConstants.defaultPadding),
                    child: Text(
                      product.details,
                    ),
                  ),
                  const SizedBox(height: SizeConstants.defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          cardProvider.addToCart(product, context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const StadiumBorder()),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "اضافة الى السلة",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                AssetsConstants.cartSvg,
                                width: 20,
                                color: Colors.white,
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const RecentlyProduct(),
            ),
          ],
        ),
      );
    });
  }
}
