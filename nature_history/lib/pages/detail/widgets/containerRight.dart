import 'package:flutter/material.dart';
import 'package:nature_history/pages/detail/styles.dart';
import 'package:nature_history/pages/detail/widgets/containerBenangsari.dart';
import 'package:nature_history/pages/detail/widgets/containerKelopak.dart';
import 'package:nature_history/pages/detail/widgets/containerTangkai.dart';
import 'package:nature_history/pages/home/widgets/flower.dart';
import 'package:nature_history/utils/colors.dart';

class ContainerRight extends StatelessWidget {
  final Flower flower; // Ubah menjadi objek Flower

  const ContainerRight({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Click the bullets ',
                      style: Styles.textClick,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'area\nfor new experience',
                          style: Styles.textExperience,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: Styles.containerVolume,
                    child: Icon(
                      Icons.volume_up,
                      color: AppColors.quaternery,
                      size: 26,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 30),
              Stack(
                children: [
                  Container(
                    height: 390,
                    width: 272,
                    decoration: Styles.containerImage,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          flower.imagePath,
                          fit: BoxFit.fill,
                        )),
                  ),
                  Positioned(
                    top: 150,
                    left: 100,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: Styles.containerCircleWhite,
                    ),
                  ),
                  Positioned(
                    top: 155,
                    left: 105,
                    child: ContainerBenangsari(),
                  ),
                  Positioned(
                    top: 120,
                    left: 220,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: Styles.containerCircleWhite,
                    ),
                  ),
                  Positioned(
                    top: 125,
                    left: 225,
                    child: ContainerKelopak(),
                  ),
                  Positioned(
                    top: 270,
                    left: 70,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: Styles.containerCircleWhite,
                    ),
                  ),
                  Positioned(
                    top: 275,
                    left: 75,
                    child: ContainerTangkai(),
                  )
                ],
              )
            ],
          ),
          Positioned(
              left: 190,
              top: 50,
              child: Image.asset(
                "assets/images/line.png",
                width: 100,
                height: 140,
              )),
        ],
      ),
    );
  }
}