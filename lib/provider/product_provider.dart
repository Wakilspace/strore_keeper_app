import 'package:flutter/material.dart';
import '../data/db_helper.dart';
import '../data/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<Product> _products = [];

  List<Product> get products => _products;

  // Load all products
  Future<void> loadProducts() async {
    _products = await _dbHelper.getProducts();
    notifyListeners();
  }

  // Add a new product
  Future<void> addProduct(Product product) async {
    await _dbHelper.insertProduct(product);
    await loadProducts();
  }

  // Update an existing product
  Future<void> updateProduct(Product product) async {
    await _dbHelper.updateProduct(product);
    await loadProducts();
  }

  // Delete a product
  Future<void> deleteProduct(int id) async {
    await _dbHelper.deleteProduct(id);
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}
