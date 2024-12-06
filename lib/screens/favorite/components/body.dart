import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/provider/cart_provider.dart';
import 'package:ui_ecommerce/provider/favorite_provider.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) => Consumer<FavoriteProvider>(
      builder: (context, fav, child) => ListView.builder(
            itemCount: fav.FavoriteProduct.length,
            itemBuilder: (BuildContext context, int index) {
              final Product favoriteItems = fav.FavoriteProduct[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getPropScreenWidth(20),
                    vertical: getPropScreenWidth(10)),
                child: Slidable(
                  direction: Axis.horizontal,
                  startActionPane:
                      ActionPane(motion: DrawerMotion(), children: [
                    SlidableAction(
                      spacing: 10,
                      onPressed: (context) =>
                          fav.toggleFavoriteProducts(favoriteItems.id),
                      icon: Icons.delete,
                      backgroundColor: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    
                    SlidableAction(
                      spacing: 10,
                      onPressed: (context) {
                        Provider.of<CartProvider>(context, listen: false)
                            .addCartItem(
                          Cart(product: favoriteItems, numOfItem: 1),
                        );
                        fav.toggleFavoriteProducts(favoriteItems.id);
                      },
                      icon: Icons.shopping_bag,
                      backgroundColor: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    )
                  ]),
                  key: Key(favoriteItems.id.toString()),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSecondaryColor.withOpacity(.2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: getPropScreenWidth(88),
                          child: AspectRatio(
                            aspectRatio: .88,
                            child: Container(
                              padding: EdgeInsets.all(getPropScreenWidth(20)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: kSecondaryColor.withOpacity(0.2),
                              ),
                              child: Image.asset(favoriteItems.images[0]),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getPropScreenWidth(20),
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: "${favoriteItems.title} \n",
                            ),
                            TextSpan(
                              text: "\£${favoriteItems.price} ",
                              style: TextStyle(
                                fontSize: getPropScreenWidth(14),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
}
