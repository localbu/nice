import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/provider/cart_provider.dart';
import 'package:ui_ecommerce/size_config.dart';

class CartBottomNavigation extends StatelessWidget {
  const CartBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, -15),
          blurRadius: 20,
          color: Color.fromARGB(255, 218, 218, 218).withOpacity(0.15),
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(getPropScreenWidth(10)),
                  height: getPropScreenWidth(40),
                  width: getPropScreenWidth(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset('assets/icons/receipt.svg'),
                ),
                const Spacer(),
                const Text('add voucer code'),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<CartProvider>(builder: (context, cart, child) {
              return Row(
                children: [
                  // total harga
                  Text.rich(TextSpan(children: [
                    TextSpan(text: 'Total: \n', style: TextStyle()),
                    TextSpan(
                      text: '\$${cart.totalPrice}',
                    )
                  ])),
                  Spacer(),
                  SizedBox(
                    width: getPropScreenWidth(190),
                    // button
                    child: MyDefaultButton(
                      text: 'check out',
                      press: () {
                        cart.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('CheckOut Succes'),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
