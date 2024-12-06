import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class ItemButtonProfile extends StatelessWidget {
  final String title, sVgIcon;
  final VoidCallback? press;
  final Color color;
  const ItemButtonProfile({
    super.key,
    required this.title,
    required this.sVgIcon,
    required this.press,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
            vertical: getPropScreenWidth(10)),
        padding: EdgeInsets.symmetric(
          horizontal: getPropScreenWidth(20),
          vertical: getPropScreenWidth(15),
        ),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SvgPicture.asset(
              sVgIcon,
              color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getPropScreenWidth(15),
                color: Colors.deepPurple,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.deepPurple,
            )
          ],
        ),
      ),
    );
  }
}
