import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/enum.dart';
import 'package:ui_ecommerce/screens/favorite/favorite_screen.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/screens/profile/profile_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List namaPages = [HomeScreen(),FavoriteScreen() ,ProfileScreen()];
  int _currentIndex = 0;
  MenuState menu = MenuState.home;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: namaPages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(50)),
          padding: EdgeInsets.symmetric(
            vertical: getPropScreenWidth(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                    menu = MenuState.home;
                  });
                },
                icon: SvgPicture.asset(
                  'assets/icons/Shop Icon.svg',
                  color: MenuState.home == menu
                      ? const Color.fromARGB(255, 195, 255, 0)
                      : inactiveColor,
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                      menu = MenuState.favorite;
                    });
                  },
                  icon: SvgPicture.asset('assets/icons/Heart Icon.svg',
                      color: MenuState.favorite == menu
                          ? const Color.fromARGB(255, 195, 255, 0)
                          : inactiveColor)),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Chat bubble Icon.svg',
                    color: inactiveColor,
                  )),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                    menu = MenuState.profile;
                  });
                  ;
                },
                icon: SvgPicture.asset('assets/icons/User Icon.svg',
                    color: MenuState.profile == menu
                        ? const Color.fromARGB(255, 195, 255, 0)
                        : inactiveColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
