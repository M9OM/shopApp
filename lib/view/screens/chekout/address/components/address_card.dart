import 'package:flutter/material.dart';

import '../../../../../core/theme/custom_colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mohammed Said'),
          Text('90979774'),
          Text('Muscat'),
        ],
      ),
      leading: Column(
        children: [
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgCard),
              child: Icon(
                Icons.location_on_outlined,
                color: iconColor,
              )),
        ],
      ),
    );
  }
}
