import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';



class ItemColorDot extends StatelessWidget {
  final color;
  final bool isSelected;
  const ItemColorDot({
    super.key,
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultDuration,
      transformAlignment: Alignment(0, 0),
      margin: EdgeInsets.only(right: getPropScreenWidth(10)),
      padding: EdgeInsets.all(getPropScreenWidth(8)),
      height: getPropScreenWidth(isSelected ? 30 : 20),
      width: getPropScreenWidth(isSelected ? 30 : 20),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? kPrimaryColor : Colors.transparent,
            width: 1.5,
          )),
    );
  }
}
