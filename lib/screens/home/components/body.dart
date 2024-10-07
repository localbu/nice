import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/home/components/categories.dart';
import 'package:ui_ecommerce/screens/home/components/discount_banner.dart';
import 'package:ui_ecommerce/screens/home/components/home_header.dart';
import 'package:ui_ecommerce/screens/home/components/popular_product.dart';
import 'package:ui_ecommerce/screens/home/components/special_offers.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            const DiscountBanner(),
            Categories(),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),

          ],
        ),
      ),
    );
  }
}
