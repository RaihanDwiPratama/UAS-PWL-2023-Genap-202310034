import 'package:flutter/material.dart';
import 'package:nature_history/pages/detail/widgets/containerLeft.dart';
import 'package:nature_history/pages/detail/widgets/containerRight.dart';
import 'package:nature_history/pages/detail/widgets/description.dart';
import 'package:nature_history/pages/home/widgets/flower.dart';

class DetailBungaPage extends StatelessWidget {
  final Flower flower;

  const DetailBungaPage({
    required this.flower,
  }); // Gunakan objek Flower sebagai argumen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(180, 80, 180, 50),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerLeft(),
                  Spacer(),
                  ContainerRight(flower: flower),
                ],
              ),
              Description(flower: flower)
            ],
          ),
        ),
      ),
    );
  }
}
