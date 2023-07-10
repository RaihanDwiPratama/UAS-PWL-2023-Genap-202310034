import 'package:flutter/material.dart';
import 'package:nature_history/pages/auth/signin.dart';
import 'package:nature_history/pages/auth/signup.dart';
import 'package:nature_history/pages/detail/detailBungaPage.dart';
import 'package:nature_history/pages/home/home.dart';
import 'package:nature_history/pages/home/widgets/flower.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'signin',
      routes: {
        'home': (context) => Home(),
        'signin': (context) => SignIn(),
        'signup': (context) => SignUp(),
        'detail': (context) {
          final flower = ModalRoute.of(context)?.settings.arguments as Flower;
          return DetailBungaPage(flower: flower);
        },
        
      },
    );
  }
}