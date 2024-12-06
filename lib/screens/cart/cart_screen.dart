import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/provider/cart_provider.dart';
import 'package:ui_ecommerce/screens/cart/components/body.dart';
import 'package:ui_ecommerce/screens/cart/components/cart_bottom_navigation.dart';

class CartScreen extends StatelessWidget {
  static String routeName = 'cart_screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Body(),
      bottomNavigationBar: CartBottomNavigation(),
    );
  }

  AppBar customAppbar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cart Screen',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) =>
              Text(
              '${cart.cartItems.length} item',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
      centerTitle: false,
    );
  }
}
