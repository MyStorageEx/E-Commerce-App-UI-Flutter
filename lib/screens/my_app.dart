import 'package:ecommerce_shopping_app/screens/auth/login_screen.dart';
import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Shopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AssetsCustom.primaryColor,
      ),
      home: const LoginScreen(),
    );
  }
}
