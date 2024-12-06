import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/size_config.dart';

class itemHomePop extends StatelessWidget {
  const itemHomePop({
    super.key,
    required this.trigger,
    required this.text,
    required this.svgIcon,
  });

  final String? trigger;
  final String text;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 200,
          color: kPrimaryLightColor,
          child: ListTile(
            leading: SvgPicture.asset(
              svgIcon,
              height: getPropScreenWidth(16),
              width: getPropScreenWidth(16),
            ),
            title: Text(text),
          ),
        ),
        if (trigger != null && trigger != "0")
          Positioned(
            top: -3,
            right: 0,
            child: Container(
              width: getPropScreenWidth(16),
              height: getPropScreenWidth(16),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  trigger!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getPropScreenWidth(10),
                    height: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

