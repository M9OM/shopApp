import 'package:flutter/material.dart';

import '../../common/constant/size_constants.dart';

class CustomTextThemes {
  CustomTextThemes._();

  static const veryLargeText = TextStyle(fontSize: SizeConstants.veryLargeText);
  static const largeText = TextStyle(fontSize: SizeConstants.largeText);
  static const largeBoldText =
      TextStyle(fontSize: SizeConstants.largeText, fontWeight: FontWeight.w700);
  static const midText = TextStyle(fontSize: SizeConstants.midText);
  static const midBoldText =
      TextStyle(fontSize: SizeConstants.midText, fontWeight: FontWeight.w700);
  static const smallText = TextStyle(fontSize: SizeConstants.smallText);
  static const smallBoldText =
      TextStyle(fontSize: SizeConstants.smallText, fontWeight: FontWeight.w700);
}
