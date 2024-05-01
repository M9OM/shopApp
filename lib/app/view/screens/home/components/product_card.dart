import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/app/core/common/constants/assets_constants.dart';

import '../../../../core/common/constants/size_constants.dart';
import '../../../../core/theme/custom_colors.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key? key,
    required this.image,
    this.addCart,
    required this.title,
    required this.price,
    required this.press,
    required this.available,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  final double price;
  final List<String> image;
  final Function? addCart;
  final bool available;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
      bool added = false;

    return GestureDetector(
      onTap: widget.press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(SizeConstants.defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
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
                widget.image[0],
                opacity: AlwaysStoppedAnimation(widget.available ? 1 : 0.6),
                fit: BoxFit.cover,
                height: 132,
              ),
            ),
            const SizedBox(height: SizeConstants.defaultPadding / 2),
            Text(
              widget.title,
              maxLines: 2, // Adjust max lines as needed
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black),
            ),
            widget.available
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.price.toString()} ريال',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      IconButton(
                          onPressed: () {
                            widget.addCart!();
                          },
                          icon: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              switchInCurve: Curves.easeInOutBack,
                              transitionBuilder: (child, animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                );
                              },
                              child: SvgPicture.asset(
                                AssetsConstants.cartAddSvg,
                                key: UniqueKey(),
                                width: 22,
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
  }
}

class AnimatedCartIcon extends StatefulWidget {
  final VoidCallback onPressed;
  final bool added;

  const AnimatedCartIcon({
    Key? key,
    required this.onPressed,
    required this.added,
  }) : super(key: key);

  @override
  _AnimatedCartIconState createState() => _AnimatedCartIconState();
}

class _AnimatedCartIconState extends State<AnimatedCartIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.added) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return ScaleTransition(
      scale: _controller,
      child: IconButton(
        onPressed: widget.onPressed,
        icon: SvgPicture.asset(
          AssetsConstants.cartAddSvg,
          key: UniqueKey(),
          width: 22,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
