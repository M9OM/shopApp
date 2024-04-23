import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
  }) : super(key: key);
  final String  title;
  final VoidCallback press;
  final int price;
  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColorCard,
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
              ),
              child: Image.asset(
                image[0],
                fit: BoxFit.cover,
                height: 132,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: defaultPadding / 4),
                Text(
                 price.toString()+ " ريال"  ,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
