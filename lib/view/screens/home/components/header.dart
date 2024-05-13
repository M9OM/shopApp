import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/common/constants/size_constants.dart';
import 'apbar.dart';
import 'categories.dart';
import '../../../layouts/search_form.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Positioned(
          top: -50,
          right: 250,
          child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), shape: BoxShape.circle),
          ),
        ),
        Positioned(
          top: 100,
          right: 250,
          child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), shape: BoxShape.circle),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 50,
            ),
            const MyAppbar(),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "زاد",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  // const Text(
                  //   "قم بالتسوق في زاد و التوصيل لحد باب بيتك!",
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: SizeConstants.defaultPadding),
                  //   child: SearchForm(),
                  // ),
                  Categories(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
