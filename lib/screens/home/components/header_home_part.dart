import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/provider/cart_provider.dart';
import 'package:ui_ecommerce/screens/cart/cart_screen.dart';
import 'package:ui_ecommerce/screens/home/components/icon_with_trigger.dart';
import 'package:ui_ecommerce/screens/home/components/item_home_pop.dart';
import 'package:ui_ecommerce/screens/home/components/search_field.dart';
import 'package:ui_ecommerce/size_config.dart';

class HeaderHomePart extends StatelessWidget {
  const HeaderHomePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => showPopUp(context),
            child: IconWithTrigger(
              svgIcon: "assets/icons/titikTiga.svg",
              trigger: "2",
            ),
          ),
          Consumer<CartProvider>(builder: (context, cart, child) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, CartScreen.routeName),
              child: IconWithTrigger(
                svgIcon: "assets/icons/Cart Icon.svg",
                trigger: cart.cartItems.length.toString(),
              ),
            );
          }),
          SearchField(),
        ],
      ),
    );
  }

  Future<Object?> showPopUp(BuildContext context) {
    return showPopover(
        context: context,
        direction: PopoverDirection.bottom,
        bodyBuilder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              // 1st menu option
              children: [
                itemHomePop(
                  trigger: '1',
                  text: 'Notification',
                  svgIcon: 'assets/icons/Bell.svg',
                ),
                itemHomePop(
                  trigger: '1',
                  text: 'Notification',
                  svgIcon: 'assets/icons/Bell.svg',
                ),
              ],
            ));
  }
}
