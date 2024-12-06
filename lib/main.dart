import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ecommerce/main_screen.dart';
import 'package:ui_ecommerce/provider/auth_provider.dart';
import 'package:ui_ecommerce/provider/cart_provider.dart';
import 'package:ui_ecommerce/provider/favorite_provider.dart';
import 'package:ui_ecommerce/provider/search_provider.dart';
import 'package:ui_ecommerce/provider/theme_provider.dart';
import 'package:ui_ecommerce/routes.dart';
import 'package:ui_ecommerce/screens/splash/splash_screen.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/theme.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FavoriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchProvider(),
          ),
        ],
        child: MainApp(isLoggedIn: isLoggedIn),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: themeData(theme.isDarkMode),
        darkTheme: ThemeData.dark(),
        home: isLoggedIn ? const MainScreen() : const SplashScreen(),
        routes: routes,
      ),
    );
  }
}
