import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/size_config.dart';

class PorfilePicture extends StatelessWidget {
  const PorfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: getPropScreenWidth(115),
        height: getPropScreenWidth(115),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/Profile Image.png'),
            ),
            Positioned(
                right: -16,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(13),
                  height: getPropScreenWidth(46),
                  width: getPropScreenWidth(46),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff5f6f9),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: SvgPicture.asset('assets/icons/Camera Icon.svg'),
                ))
          ],
        ),
      ),
    );
  }
}
