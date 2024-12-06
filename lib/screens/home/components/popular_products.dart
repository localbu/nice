import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/item_popular_product.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/provider/favorite_provider.dart';
import 'package:ui_ecommerce/screens/details/detail_screen.dart';
import 'package:ui_ecommerce/screens/home/components/section_title.dart';
import 'package:ui_ecommerce/size_config.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: const SectionTitle(title: "Popular Products"),
        ),
        SizedBox(height: getPropScreenHeight(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: getPropScreenHeight(230),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(10)),
              child: Consumer<FavoriteProvider>(
                builder: (context, fav, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      demoProducts.length, 
                      (index) {
                        final Product product = fav.product[index];
                        return ItemPopularProduct(
                          product: demoProducts[index], 
                          press: () => Navigator.pushNamed(
                            context, DetailScreen.routeName, 
                            arguments: product
                          ),
                        );
                      }
                    ),
                  );
                }
              ),
            ),
          ),
        )
      ],
    );
  }
}

