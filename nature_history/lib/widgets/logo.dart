import 'package:flutter/material.dart';
import 'package:nature_history/widgets/my_flutter_app_icons.dart';
import 'package:nature_history/utils/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          Icon(
            MyFlutterApp.leaf,
            color: Color(0xff29810B),
          ),
          Text(
            "Natural",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
                color: AppColors.primary),
          ),
          Text(
            "History",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
