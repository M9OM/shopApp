import 'package:flutter/material.dart';

import '../../../../core/common/constants/size_constants.dart';
import '../../../../core/theme/custom_colors.dart';

class ProductAtCart extends StatelessWidget {
  const ProductAtCart({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    this.countItemOrder,
    required this.press,
    required this.remove,
    required this.addItem,
    required this.removeAll,
  }) : super(key: key);
  final  title;
  final VoidCallback press;
  final double price;
  final int? countItemOrder;
  final Function remove;
  final Function addItem;
  final Function removeAll;
  final List<String> image;

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(SizeConstants.defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(SizeConstants.defaultBorderRadius)),
        ),
        child: Row(
          children: [
            Container(
              width: 100, // Adjust the width of the image container as needed
              decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConstants.defaultBorderRadius)),
              ),
              child: Image.network(
                image[0],
                fit: BoxFit.fitWidth,
                height: 100,
              ),
            ),
            const SizedBox(
                width:
                    SizeConstants.defaultPadding / 2), // Add spacing between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                      height:
                          4), // Add vertical spacing between title and price
                  Text(
                    price.toString() + " ريال",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(
                      height:
                          4), // Add vertical spacing between title and price

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => remove(),
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).dividerColor)),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          countItemOrder.toString(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => addItem(),
                          child: const Icon(Icons.add, size: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            IconButton(
                onPressed: () => removeAll(),
                icon: const Icon(Icons.remove_circle_outline))
          ],
        ),
      ),
    );
  }
}
