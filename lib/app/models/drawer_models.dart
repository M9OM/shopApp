import '../core/common/constants/assets_constants.dart';
import '../view/layouts/app_drawer.dart';

class DrawerModel {

  DrawerModel();

  List<DrawerListTile> drawerListTile = [
    DrawerListTile(
      title: "الملف الشخصي",
      svgSrc: AssetsConstants.personSvg,
      press: () {},
    ),
    DrawerListTile(
      title: "الاشعارات",
      svgSrc: AssetsConstants.notificationSvg,
      press: () {},
    ),
    DrawerListTile(
      title: "الاعدادات",
      svgSrc: AssetsConstants.settingsSvg,
      press: () {},
    ),
  ];
}
