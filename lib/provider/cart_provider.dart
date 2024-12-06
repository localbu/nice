import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/cart.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _listCart = [];
  List<Cart> get cartItems => _listCart;

  void removeCartItem(Cart cartItem) {
    _listCart.removeWhere(
      (item) => item.product.id == cartItem.product.id,
    );
    notifyListeners();
  }

  void addCartItem(Cart cartItem) {
    final index = _listCart.indexWhere(
      (item) => item.product.id == cartItem.product.id,
    );

    if (index != -1) {
      _listCart[index].numOfItem += cartItem.numOfItem;
    } else {
      _listCart.add(cartItem);
    }

    notifyListeners();
  }

  double get totalPrice => double.parse(
        _listCart
            .fold(
                0.0,
                (double total, current) =>
                    total + current.product.price * current.numOfItem)
            .toStringAsFixed(2),
      );

  void clearCart() {
    _listCart.clear();
    notifyListeners();
  }
}
