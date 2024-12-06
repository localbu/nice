import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/provider/favorite_provider.dart';
import 'package:ui_ecommerce/size_config.dart';

class DetailDescription extends StatefulWidget {
  const DetailDescription({
    super.key,
    required this.products,
  });

  final Product products;

  @override
  State<DetailDescription> createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: Text(
            widget.products.title,
            style: TextStyle(
              fontSize: getPropScreenWidth(20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            width: getPropScreenWidth(64),
            decoration: BoxDecoration(
              color: widget.products.isFavourite
                  ? kPrimaryColor.withOpacity(0.5)
                  : kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Consumer<FavoriteProvider>(builder: (context, fav, child) {
              return GestureDetector(
                onTap: () {
                  fav.toggleFavoriteProducts(widget.products.id);
                },
                child: Icon(
                  Icons.favorite,
                  color: widget.products.isFavourite
                      ? Colors.red
                      : kSecondaryColor.withOpacity(0.5),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getPropScreenWidth(
              20,
            ),
            right: getPropScreenWidth(64),
          ),
          child: ReadMoreText(
            widget.products.description,
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: kPrimaryColor,
            trimCollapsedText: "\nShow More details >",
            trimExpandedText: "\nShow Less details >",
            moreStyle: seeMoreStyle,
            lessStyle: seeMoreStyle,
          ),
        )
      ],
    );
  }
}
