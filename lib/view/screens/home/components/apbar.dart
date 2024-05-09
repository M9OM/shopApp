import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/provider/cartProvider.dart';

import '../../../../core/common/constants/assets_constants.dart';
import '../../cart/cart_screen.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              InkWell(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      AssetsConstants.cartSvg,
                      color: Colors.white,
                    )),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: Text(
                  cardProvider.productCardList.length.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
