import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/app/controller/page_controller.dart';
import 'package:stylish/app/core/common/constants/assets_constants.dart';
import 'package:stylish/app/core/theme/custom_colors.dart';

import 'bottomNavWidget.dart';

class BottomNaviation extends StatelessWidget {
  const BottomNaviation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 56,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: primaryColor.withOpacity(0.5),
                  offset: Offset(0, 20),
                  blurRadius: 20)
            ], color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Consumer<PageControllerModel>(
                builder: (context, pageModel, child) {
              int selected = pageModel.currentPageIndex;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavWidget(
                      onTap: () {
                        pageModel.changePage(0);
                      },
                      svgIcon: selected == 0
                          ? AssetsConstants.houseFillSvg
                          : AssetsConstants.houseSvg),
                  BottomNavWidget(
                      onTap: () {
                        pageModel.changePage(1);
                      },
                      svgIcon: AssetsConstants.settingsSvg),
                  // BottomNavWidget(onTap: () {pageModel.changePage(2);}, svgIcon: AssetsConstants.personSvg),
                  // BottomNavWidget(onTap: () {pageModel.changePage(3);}, svgIcon: AssetsConstants.cartSvg),
                ],
              );
            }),
          ),
          padding: const EdgeInsets.all(10)),
    );
  }
}
