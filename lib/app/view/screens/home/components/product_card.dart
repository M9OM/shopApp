import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/app/core/common/constants/assets_constants.dart';

import '../../../../core/common/constants/size_constants.dart';
import '../../../../core/theme/custom_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
     this.addCart,
    required this.title,
    required this.price,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  final double price;
  final List<String> image;
  final Function? addCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(SizeConstants.defaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConstants.defaultBorderRadius)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColorCard,
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConstants.defaultBorderRadius),
                ),
              ),
              child: Image.network(
                image[0],
                fit: BoxFit.cover,
                height: 132,
              ),
            ),
            SizedBox(height: SizeConstants.defaultPadding / 2),
            Text(
              title,
              maxLines: 2, // Adjust max lines as needed
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${price.toString()} ريال',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                IconButton(
                    onPressed:() => addCart!(),
                    icon: SvgPicture.asset(
                      AssetsConstants.cartSvg,
                      width: 22,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
