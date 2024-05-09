import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardSetting extends StatelessWidget {
  const CardSetting({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap, this.subtitle,
  }) : super(key: key);

  final String icon;
  final String title;
  final VoidCallback onTap;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 1, color: Theme.of(context).dividerColor)),
      ),
      child:subtitle == null? ListTile(
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
        leading: SvgPicture.asset(
          icon,
          width: 22,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),

      ):ListTile(
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
        leading: SvgPicture.asset(
          icon,
          width: 22,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),

        subtitle:Text('$subtitle'),
      ),
    );
  }
}

