import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/provider/favorite_provider.dart';
import 'package:ui_ecommerce/screens/favorite/components/body.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = '/fav';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart Screen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Consumer<FavoriteProvider>(
              builder: (context, fav, child) => Text(
                '${fav.FavoriteProduct.length} item',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
        centerTitle: false,
      ),
      body: Body(),
    );
  }
}
