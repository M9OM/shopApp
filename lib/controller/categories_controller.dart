import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class CategoriesController  {

Future<List<Product>> fetchProducts(String field) async {
  final snapshot = await FirebaseFirestore.instance.collection('products').where('category', isEqualTo:field ).get();
  return snapshot.docs.map((doc) => Product.fromFirestore(doc.data(), doc.id)).toList();
}


}