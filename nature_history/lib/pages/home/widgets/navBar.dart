import 'package:flutter/material.dart';
import 'package:nature_history/pages/home/styles.dart';
import 'package:nature_history/utils/colors.dart';
import 'package:nature_history/widgets/logo.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      child: Row(
        children: [
          Logo(),
          Spacer(),
          Spacer(),
          Spacer(),
          Text("Dashboard", style: Styles.textNavPrimary),
          Spacer(),
          Text("Favorite", style: Styles.textNavSecondary),
          Spacer(),
          Text("Profile", style: Styles.textNavSecondary),
          Spacer(),
          Spacer(),
          Spacer(),
          Icon(Icons.notifications_none_outlined, color: AppColors.primary),
          SizedBox(width: 30),
          Row(
            children: [
              Container(
                decoration: Styles.boxProfile,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/cherry-blossom.jpg",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sofia Eleane", style: Styles.textNavPrimary),
                  Text("@sofia1", style: Styles.textProfile),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
