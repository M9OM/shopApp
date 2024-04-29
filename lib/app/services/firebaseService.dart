import '../models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseServices{

Future<List<Product>> fetchProducts() async {
  final snapshot = await FirebaseFirestore.instance.collection('products').get();
  return snapshot.docs.map((doc) => Product.fromFirestore(doc.data(), doc.id)).toList();
}

void addProduct(Product product) {
  FirebaseFirestore.instance.collection('products').add(product.fromFirestore());
}


}