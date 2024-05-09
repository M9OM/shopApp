import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../controller/home_controller.dart';
import '../models/Product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _items = [];
  final List<Product> _productCardList = [];
  final List<Product> _itemsSearched = [];
  List<Product> get productCardList => _productCardList;
  List<Product> get itemsSearched => _itemsSearched;

  CartProvider() {
    fetchProducts();
  }

  void addToCart(Product productCardList, BuildContext context) {
    _productCardList.add(productCardList);

    const snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green), // Add icon here
          SizedBox(width: 10), // Add spacing between icon and text
          Text('لقد تم اضافة السلعة في السلة!'),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    notifyListeners();
  }

  void clearList() {
    _productCardList.clear();

    notifyListeners();
  }
  void removeProduct(Product productCardList) {
    _productCardList.remove(productCardList);

    notifyListeners();
  }

  void removeProductAll(Product productCardList) {
    _productCardList.removeWhere((element) => element == productCardList);

    notifyListeners();
  }

  Future<void> fetchProducts() async {
    _items = await ProductController().fetchProducts();
    notifyListeners();
  }

  void filterSearchResults(String query) {
    _itemsSearched.clear();

    if (query.isNotEmpty) {
      _itemsSearched.addAll(
        _items.where(
            (item) => item.title.toLowerCase().contains(query.toLowerCase())),
      );
    }

    notifyListeners();
  }

  double getPrice() {
    double price = 0;

    for (var i = 0; i < productCardList.length; i++) {
      price += (productCardList[i].price);
    }
    return price;
  }
}
