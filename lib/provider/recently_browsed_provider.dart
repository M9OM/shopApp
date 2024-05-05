import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/Product.dart';

class RecentlyBrowsed with ChangeNotifier {
  final List<Product> _productRecentlyList = [];
  List<Product> get productRecentlyList => _productRecentlyList;
 



  void addToRecentliy(Product productRecentlyList) {

if(!_productRecentlyList.contains(productRecentlyList)){    _productRecentlyList.add(productRecentlyList);
}



    notifyListeners();
  }

}
