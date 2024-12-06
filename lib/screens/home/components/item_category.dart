import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key, required this.name, required this.icon,
  });

  final String name, icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getPropScreenWidth(55),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(getPropScreenWidth(15)),
            height: getPropScreenWidth(55),
            width: getPropScreenWidth(55),
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 5),
          Text(name, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
