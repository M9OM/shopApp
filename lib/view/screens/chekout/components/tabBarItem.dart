import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/custom_colors.dart';


class TapBarItems extends StatelessWidget {
  TapBarItems(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onTap})
      : super(key: key);
  String title;
  bool isSelected;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          padding: EdgeInsets.all(4),
          width: 60,
          decoration: BoxDecoration(
            
              color: isSelected ?  enableColor: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            title,
          )),
    );
  }
}
