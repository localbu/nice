import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

class BannerDiscountHome extends StatelessWidget {
  const BannerDiscountHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getPropScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getPropScreenWidth(20), 
        vertical: getPropScreenHeight(15)
      ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 138, 152, 50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            const TextSpan(text: "A Summer Surprise\n"),
            TextSpan(text: "Cashback 20%", style: TextStyle(fontSize: getPropScreenWidth(24), fontWeight: FontWeight.bold))
          ]
        )
      ),
    );
  }
}
