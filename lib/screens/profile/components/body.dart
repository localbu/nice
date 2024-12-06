import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/provider/auth_provider.dart';
import 'package:ui_ecommerce/provider/theme_provider.dart';
import 'package:ui_ecommerce/screens/profile/components/item_button_profile.dart';
import 'package:ui_ecommerce/screens/profile/components/porfile_picture.dart';
import 'package:ui_ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLogOut = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<ThemeProvider, AuthProvider>(
          builder: (context, theme, auth, child) {
        return ListView(
          children: [
            PorfilePicture(),
            SizedBox(
              height: getPropScreenWidth(10),
            ),
            Text(
              '${auth.savedText}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getPropScreenWidth(20),
            ),
            ItemButtonProfile(
              title: 'My Account',
              sVgIcon: 'assets/icons/User Icon.svg',
              press: () {},
              color:
                  theme.isDarkMode ? Colors.grey.shade900 : Color(0xfff5f6f9),
            ),
            ItemButtonProfile(
              title: 'Notifications',
              sVgIcon: 'assets/icons/Bell.svg',
              press: () {},
              color:
                  theme.isDarkMode ? Colors.grey.shade900 : Color(0xfff5f6f9),
            ),
            ItemButtonProfile(
              title: 'Settings',
              sVgIcon: 'assets/icons/Settings.svg',
              press: () {},
              color:
                  theme.isDarkMode ? Colors.grey.shade900 : Color(0xfff5f6f9),
            ),
            ItemButtonProfile(
              title: 'Question',
              sVgIcon: 'assets/icons/Question mark.svg',
              press: () {},
              color:
                  theme.isDarkMode ? Colors.grey.shade900 : Color(0xfff5f6f9),
            ),
            SizedBox(
              height: getPropScreenWidth(20),
            ),
            Row(
              children: [
                Checkbox(
                    value: isLogOut,
                    onChanged: (context) {
                      setState(() {
                        isLogOut = !isLogOut;
                      });
                    }),
                Text('are you sure want to log out'),
              ],
            ),
            ItemButtonProfile(
              title: 'Log Out',
              sVgIcon: 'assets/icons/Log out.svg',
              press: isLogOut
                  ? () {
                      Provider.of<AuthProvider>(context, listen: false)
                          .setAuth(false);
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          SignInScreen.routeName,
                          (Route<dynamic> route) => false);
                    }
                  : null,
              color: isLogOut ? Colors.redAccent : kSecondaryColor,
            ),
          ],
        );
      }),
    );
  }
}
