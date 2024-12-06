import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/components/rounded_icon_button.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/provider/cart_provider.dart';
import 'package:ui_ecommerce/provider/favorite_provider.dart';
import 'package:ui_ecommerce/screens/details/components/color_picker.dart';
import 'package:ui_ecommerce/screens/details/components/detail_description.dart';
import 'package:ui_ecommerce/screens/details/components/image_details.dart';
import 'package:ui_ecommerce/screens/details/components/rounded_container.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  int totalSelected = 1;
  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageDetails(product: product),
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailDescription(products: product),
                  SizedBox(
                    height: getPropScreenHeight(40),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getPropScreenWidth(20)),
                    child: SizedBox(
                      height: getPropScreenHeight(40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(
                            widget.product.colors.length,
                            (index) => GestureDetector(
                              onTap: () => setState(() {
                                currentIndex = index;
                              }),
                              child: ItemColorDot(
                                color: widget.product.colors[index],
                                isSelected: index == currentIndex,
                              ),
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              RoundedIconBtn(
                                showShadow: true,
                                icon: Icons.add,
                                press: () {
                                  setState(() {
                                    totalSelected++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: getPropScreenWidth(10),
                              ),
                              Text(
                                '$totalSelected',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              SizedBox(
                                width: getPropScreenWidth(10),
                              ),
                              RoundedIconBtn(
                                  showShadow: true,
                                  icon: Icons.remove,
                                  press: totalSelected > 1
                                      ? () {
                                          setState(() {
                                            totalSelected--;
                                          });
                                        }
                                      : null)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getPropScreenWidth(40),
                        horizontal: getPropScreenWidth(70)),
                    child: MyDefaultButton(
                      text: 'add to cart',
                      press: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addCartItem(
                          Cart(
                            product: product,
                            numOfItem: totalSelected,
                          ),
                        );
                        if (widget.product.isFavourite) {
                          Provider.of<FavoriteProvider>(context, listen: false)
                              .toggleFavoriteProducts(widget.product.id);
                        } else {}
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to Cart'),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
