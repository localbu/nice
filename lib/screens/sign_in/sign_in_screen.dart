import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: Body(),
    );
  }
}