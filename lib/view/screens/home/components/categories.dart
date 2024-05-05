import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/models/Category.dart';

import '../../../../core/common/constants/size_constants.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "تصنيفات",
          style: TextStyle(fontSize: 18, color: Colors.white, ),
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: demo_categories.length,
            itemBuilder: (context, index) => CategoryCard(
              icon: demo_categories[index].icon,
              title: demo_categories[index].title,
              press: () {},
            ),
            separatorBuilder: (context, index) =>
                const SizedBox(width: SizeConstants.defaultPadding),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: SizeConstants.defaultPadding / 2,
                  horizontal: SizeConstants.defaultPadding / 4),
              child: Column(
                children: [
                  Image.asset(
                    icon,
                    width: 30,
                  ),
                  const SizedBox(height: SizeConstants.defaultPadding / 2),
                ],
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
