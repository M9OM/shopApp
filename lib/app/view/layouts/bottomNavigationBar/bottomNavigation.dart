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
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Consumer<PageControllerModel>(
              builder: (context,pageModel,child) {
                double? selected = pageModel.pageController.page;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavWidget(onTap: () {pageModel.changePage(0);}, svgIcon:selected==0? AssetsConstants.notificationSvg:AssetsConstants.settingsSvg),
                    BottomNavWidget(onTap: () {pageModel.changePage(1);}, svgIcon: AssetsConstants.settingsSvg),
                    // BottomNavWidget(onTap: () {pageModel.changePage(2);}, svgIcon: AssetsConstants.personSvg),
                    // BottomNavWidget(onTap: () {pageModel.changePage(3);}, svgIcon: AssetsConstants.cartSvg),
                  ],
                );
              }
            ),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 10),
          ),
          padding: const EdgeInsets.all(10)),
    );
  }
}
