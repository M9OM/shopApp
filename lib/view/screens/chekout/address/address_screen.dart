import 'package:flutter/material.dart';
import 'package:stylish/core/theme/custom_text.dart';
import 'package:stylish/view/screens/chekout/address/address_form.dart';
import 'package:stylish/view/screens/chekout/address/components/address_card.dart';
import 'package:stylish/view/screens/chekout/address/location_picker.dart';

import '../../../../core/theme/custom_colors.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('عنوان الشحن', style: CustomTextThemes.largeText),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LocationPickerScreen(),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: bgCard,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'تعديل',
                        style: TextStyle(
                            color: iconColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const AddressCard(),
          ],
        ),
      ),
    );
  }
}
