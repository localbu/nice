import 'package:ui_ecommerce/model/products.dart';

class Cart {
  Cart({
    required this.product,
    required this.numOfItem,
  });
  final Product product;
  int numOfItem;
}


