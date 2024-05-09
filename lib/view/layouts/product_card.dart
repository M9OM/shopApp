import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/core/common/constants/assets_constants.dart';
import 'package:stylish/models/Product.dart';

import '../../core/common/constants/size_constants.dart';
import '../../core/theme/custom_colors.dart';
import '../../provider/recently_browsed_provider.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.image,
    this.addCart,
    required this.products,
    required this.title,
    required this.price,
    required this.press,
    required this.available,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  final double price;
  final List<String> image;
  final Product products;
  final Function? addCart;
  final bool available;
  @override
  Widget build(BuildContext context) {
    UniqueKey _key = UniqueKey();

    bool added = false;

    return Consumer<RecentlyBrowsed>(builder: (context, recentlyBrowsed, _) {
      return GestureDetector(
        onTap: () {
         recentlyBrowsed.addToRecentliy(products);

          press();
        },
        child: Container(
          width: 170,
          padding: const EdgeInsets.all(SizeConstants.defaultPadding / 2),
          decoration: const BoxDecoration(
            color: bgColorCard,
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConstants.defaultBorderRadius)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: bgColorCard,
                  borderRadius: BorderRadius.all(
                    Radius.circular(SizeConstants.defaultBorderRadius),
                  ),
                ),
                child: Image.network(
                  image[0],
                  opacity: AlwaysStoppedAnimation(available ? 1 : 0.6),
                  fit: BoxFit.contain,
                  height: 170,
                ),
              ),
              const SizedBox(height: SizeConstants.defaultPadding / 2),
              Text(
                title,
                maxLines: 2, // Adjust max lines as needed
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black),
              ),
              available
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${price.toString()} ريال',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        IconButton(
                            onPressed: () {
                              addCart!();
                            },
                            icon: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                switchInCurve: Curves.easeInOutBack,
                                transitionBuilder: (child, animation) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: SvgPicture.asset(
                                  AssetsConstants.cartAddSvg,
                                  width: 22,
                                  key: _key,
                                )))
                      ],
                    )
                  : const Text(
                      'غير متوفر حاليا',
                      style: TextStyle(color: Colors.red),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
