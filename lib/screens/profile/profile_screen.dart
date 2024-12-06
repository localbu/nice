import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/provider/theme_provider.dart';
import 'package:ui_ecommerce/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Consumer<ThemeProvider>(builder: (context, theme, child) {
            return IconButton(
              onPressed: () {
                theme.toggleTheme(!theme.isDarkMode);
              },
              icon: Icon(
                theme.isDarkMode
                    ? Icons.wb_sunny_rounded
                    : Icons.nightlight_round_outlined,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
            );
          })
        ],
      ),
      body: Body(),
    );

  }


}
