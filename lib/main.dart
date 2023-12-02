import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pi/pages/Codigo.dart';
import 'package:pi/pages/CriarVotacao.dart';
import 'package:pi/pages/Login.dart';
import 'package:pi/Usuario.dart';
import 'package:pi/Aluno.dart';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:pi/pages/Principal.dart';
import 'package:pi/pages/TelaProfessor.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Inicializa o Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venelli Treinamentos',
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

class RoteadorTela extends StatelessWidget {
  const RoteadorTela({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String nomeUsuario = snapshot.data?.displayName ?? "";
          return Principal(
            nomeUsuario: nomeUsuario);
        } else {
          return LoginPage();
        }
      },
    );
  }
}
