import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class HomeController  {

Future<List<Product>> fetchProducts() async {
  final snapshot = await FirebaseFirestore.instance.collection('products').get();
  return snapshot.docs.map((doc) => Product.fromFirestore(doc.data(), doc.id)).toList();
}


}