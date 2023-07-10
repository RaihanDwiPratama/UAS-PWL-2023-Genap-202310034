import 'package:flutter/material.dart';
import 'package:nature_history/utils/colors.dart';

class AuthStyles {
  static TextStyle heading = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato',
    color: AppColors.primary,
  );

  static TextStyle subHeading = TextStyle(
    fontSize: 20,
    fontFamily: 'Lato',
    color: AppColors.secondary,
    fontWeight: FontWeight.w400,
  );

  static InputDecoration inputFullname = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(25, 15, 0, 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
    ),
    hintText: 'Fullname',
    hintStyle: TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.secondary,
    ),
  );

  static InputDecoration inputUsername = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(25, 15, 0, 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
    ),
    hintText: 'Email',
    hintStyle: TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.secondary,
    ),
  );

  static InputDecoration inputPassword = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(25, 15, 0, 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
    ),
    hintText: 'Password',
    hintStyle: TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.secondary,
    ),
  );

  static TextStyle rememberMe = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    color: AppColors.secondary,
    fontWeight: FontWeight.w400,
  );

  static TextStyle forgotPassword = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );

  static ButtonStyle button = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    backgroundColor: AppColors.primary,
  );

  static TextStyle textButton = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    color: AppColors.quaternery,
    fontSize: 24,
  );

  static TextStyle textAccount = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    color: AppColors.secondary,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textSign = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
}
