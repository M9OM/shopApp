import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/app/provider/cartProvider.dart';

import '../../../../core/common/constants/assets_constants.dart';
import '../../../../core/common/constants/size_constants.dart';


const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cardProvider, child) {
        return Form(
          child: TextFormField(

            onChanged: (value) {
            cardProvider.filterSearchResults(value);

            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "ابحث عن المنتج ..",
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(AssetsConstants.searchSvg),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConstants.defaultPadding, vertical: SizeConstants.defaultPadding / 2),
                child: SizedBox(
                  width: 48,
                  height: 48,
                  // child: ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: primaryColor,
                  //     shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: SvgPicture.asset("assets/icons/Filter.svg"),
                  // ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
