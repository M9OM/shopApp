import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var colorIcon = Theme.of(context).iconTheme.color;
    Color _colorWidth =Theme.of(context).dividerColor;
double _width = 1.5;
    return Drawer(
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
      
            ListTile(
              onTap: () {
              },
              shape: Border(
                  bottom:
                      BorderSide(width: _width, color: _colorWidth)),
              leading: SvgPicture.asset(
                'assets/icons/user.svg',
                width: 30,
                color: colorIcon,
              ),
              title:  Text(
                'Profile',
              ),
            ),
            ListTile(
              shape: Border(
                  bottom:
                      BorderSide(width: _width, color: _colorWidth)),
              onTap: () {
      
              },
              leading: SvgPicture.asset(
                'assets/icons/user.svg',
                width: 30,
                color: colorIcon,
              ),
              title: 
               Text(
                '',
                
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}
