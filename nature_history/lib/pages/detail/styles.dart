import 'package:flutter/material.dart';
import 'package:nature_history/utils/colors.dart';

class Styles {
  static TextStyle heading = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w500,
    fontSize: 30,
    color: AppColors.primary,
  );

  static TextStyle subHeading = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w900,
    fontSize: 26,
    color: AppColors.primary,
  );

  static TextStyle textDescription = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.normal,
    fontSize: 18,
    color: AppColors.secondary,
  );

  static TextStyle textClick = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.secondary,
  );

  static TextStyle textExperience = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.secondary,
  );

  static BoxDecoration containerVolume = BoxDecoration(
    color: AppColors.secondary,
    borderRadius: BorderRadius.circular(25),
  );

  static BoxDecoration containerImage = BoxDecoration(
    borderRadius: BorderRadius.circular(60),
    boxShadow: [
      BoxShadow(
        blurRadius: 70.0,
        color: Color(0xff8DA9DF).withOpacity(0.20),
        offset: Offset(2, 3),
      )
    ],
  );

  static BoxDecoration containerCircleWhite = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        blurRadius: 70.0,
        blurStyle: BlurStyle.outer,
        color: AppColors.primary.withOpacity(0.40),
        offset: Offset(1, 1),
      )
    ],
    color: AppColors.quaternery,
  );

  static BoxDecoration containerText = BoxDecoration(
    borderRadius: BorderRadius.circular(40),
    color: AppColors.quaternery,
    boxShadow: [
      BoxShadow(
        blurRadius: 70.0,
        blurStyle: BlurStyle.outer,
        color: Color(0xff8DA9DF).withOpacity(0.20),
        offset: Offset(2, 1),
      )
    ],
  );

  static TextStyle textPrimary = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w900,
    fontSize: 18,
    color: AppColors.primary,
    wordSpacing: 2,
  );

  static TextStyle textSecondary = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.normal,
    fontSize: 18,
    color: AppColors.secondary,
    wordSpacing: 2,
  );

  static TextStyle textSubPrimary = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w900,
      fontSize: 12,
      color: AppColors.primary,
      letterSpacing: 1);

  static TextStyle textSubSecondary = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: AppColors.secondary,
    letterSpacing: 1,
  );

  static BoxDecoration button = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(15),
  );

  static BoxDecoration textModal = BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(40),
    color: AppColors.quaternery,
  );

  static BoxDecoration buttonClose = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.deepOrange.shade300,
  );

  static BoxDecoration buttonVolume = BoxDecoration(
    color: AppColors.secondary,
    borderRadius: BorderRadius.circular(15),
  );

  static BoxDecoration buttonDropdown = BoxDecoration(
    border: Border.all(color: AppColors.primary),
    borderRadius: BorderRadius.circular(20),
  );

  static TextStyle textDropdown = TextStyle(
    fontFamily: "Lato",
    fontSize: 11,
    color: AppColors.primary,
  );
}
