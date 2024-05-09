import 'package:flutter/material.dart';

import '../core/common/constants/assets_constants.dart';

class SettingsModel {
  final String icon, title;

  SettingsModel({
    required this.icon,
    required this.title,
  });
}

List<SettingsModel> settingsItems = [
  SettingsModel(
    icon: AssetsConstants.heartSvg,
    title: "المفضلة",
  ),
  SettingsModel(
    icon: AssetsConstants.notificationSvg,
    title: "الاشعارات",
  ),
];
