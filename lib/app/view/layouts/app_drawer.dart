import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/app/core/common/constants/assets_constants.dart';
import 'package:stylish/app/models/drawer_models.dart';

// ignore: must_be_immutable
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
    children: [
      DrawerHeader(
        child: Image.asset(AssetsConstants.logoPng, width: 100),
      ),
      ...DrawerModel().drawerListTile,
    ],
  ),

    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        width: 18,
      ),
      title: Text(
        title,
      ),
    );
  }
}
