import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({Key? key, required this.onTap, required this.svgIcon})
      : super(key: key);
  String svgIcon;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => onTap(),
      child: SvgPicture.asset(svgIcon,color: Colors.white,),
    );
  }
}
