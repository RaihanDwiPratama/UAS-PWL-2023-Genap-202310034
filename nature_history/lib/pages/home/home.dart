import 'package:flutter/material.dart';
import 'package:nature_history/pages/home/widgets/header.dart';
import 'package:nature_history/pages/home/widgets/itemOne.dart';
import 'package:nature_history/pages/home/widgets/itemTwo.dart';
import 'package:nature_history/pages/home/widgets/navBar.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 180, vertical: 10),
          child: Column(
            children: [
              NavBar(),
              Header(),
              ItemOne(),
              ItemTwo(),
            ],
          ),
        ),
      ),
    );
  }
}