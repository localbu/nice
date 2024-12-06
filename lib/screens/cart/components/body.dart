import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/provider/cart_provider.dart';
import 'package:ui_ecommerce/screens/cart/components/item_cart.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return ListView.builder(
        itemCount: cart.cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          final Cart cartVar = cart.cartItems[index];
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getPropScreenWidth(20),
                vertical: getPropScreenWidth(10)),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: getPropScreenWidth(20)),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              onDismissed: (direction) {
                cart.removeCartItem(cartVar);
              },
              key: Key(cartVar.product.id.toString()),
              child: ItemCart(cart: cartVar),
            ),
          );
        },
      );
    });
  }
}
