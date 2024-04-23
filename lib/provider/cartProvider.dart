import 'package:flutter/foundation.dart';
import 'package:stylish/services/firebaseService.dart';
import '../models/Product.dart';

class CartProvider with ChangeNotifier {
  final FirebaseServices _firebaseServices = FirebaseServices();
  List<Product> _items = [];
  final List<Product> _productCardList = [];
  final List<Product> _itemsSearched = [];
  List<Product> get productCardList => _productCardList;
  List<Product> get itemsSearched => _itemsSearched;
  CartProvider() {
    fetchProducts();
  }

  void addToCart(Product productCardList) {
    _productCardList.add(productCardList);

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
    _items = await _firebaseServices.fetchProducts();
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

  int getPrice() {
    int price = 0;

    for (var i = 0; i < productCardList.length; i++) {
      price += productCardList[i].price;
    }
    return price;
  }
}
