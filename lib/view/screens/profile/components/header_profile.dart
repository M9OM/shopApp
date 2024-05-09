import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/common/constants/size_constants.dart';
import '../../../layouts/search_form.dart';

class HeaderProfile extends StatelessWidget {
  HeaderProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight*0.3,
      color: Colors.indigoAccent,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Positioned(
            top: -150,
            right: 190,
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
              Container(
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "الاعدادات",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
