import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/controller/page_controller.dart';
import 'package:stylish/core/common/constants/assets_constants.dart';
import 'package:stylish/core/theme/custom_colors.dart';
import 'bottomNavWidget.dart';

int _selectedIndex = 0;

class BottomNaviation extends StatelessWidget {
  const BottomNaviation(
      {Key? key, required this.items,})
      : super(key: key);
  final List<BottomNavWidget> items;
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal:3),
          height: 56,
          child: Consumer<PageControllerModel>(
              builder: (context, pageModel, child) {
            // int selected = pageModel.currentPageIndex;
            return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items,
            );
          }),
        ),
        padding: const EdgeInsets.all(10));
  }
}


