import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/products.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _listProduct = demoProducts;
  List<Product> get product => _listProduct;
  List<Product> get FavoriteProduct =>
      _listProduct.where((product) => product.isFavourite).toList();

  void toggleFavoriteProducts(int id) {
    final productIndex = _listProduct.indexWhere(
      (product) => product.id == id,
    );
    _listProduct[productIndex].isFavourite =
        !_listProduct[productIndex].isFavourite;
    notifyListeners();
  }
}
