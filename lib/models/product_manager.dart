import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/models/product.dart';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    _loadAllProducts();
  }

  List<Product> _allProducts = [];

  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapProducts =
        await Firestore.instance.collection('products').getDocuments();

    _allProducts =
        snapProducts.documents.map((d) => Product.fromDocument(d)).toList();
  }

  notifyListeners();
}
