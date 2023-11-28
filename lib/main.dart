import 'package:flutter/material.dart';
import 'package:pi/pages/Login.dart';
import 'package:pi/Usuario.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venelli treinamentos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF242424, <int, Color>{
          50: Color(0xFF242424),
          100: Color(0xFF242424),
          200: Color(0xFF242424),
          300: Color(0xFF242424),
          400: Color(0xFF242424),
          500: Color(0xFF242424),
          600: Color(0xFF242424),
          700: Color(0xFF242424),
          800: Color(0xFF242424),
          900: Color(0xFF242424),
        }),
      ),
      home: LoginPage(),
    );
  }
}
