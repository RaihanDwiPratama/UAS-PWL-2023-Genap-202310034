import 'package:flutter/material.dart';
import 'package:nature_history/utils/colors.dart';

class Styles {
  static TextStyle textNavPrimary = TextStyle(
    color: AppColors.primary,
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textNavSecondary = TextStyle(
    color: AppColors.secondary,
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textProfile = TextStyle(
    color: AppColors.secondary,
    fontFamily: 'Lato',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textHeading = TextStyle(
    color: AppColors.primary,
    fontFamily: 'Lato',
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textHeadingPrimary = TextStyle(
    color: AppColors.primary,
    fontFamily: 'Lato',
    fontSize: 30,
    fontWeight: FontWeight.w900,
  );

  static TextStyle textDescription = TextStyle(
    color: AppColors.secondary,
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textBoxHeading = TextStyle(
    color: AppColors.tertiary,
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textBoxName = TextStyle(
    color: AppColors.primary,
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static TextStyle textBoxDescription = TextStyle(
    color: AppColors.secondary,
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static BoxDecoration containerBox = BoxDecoration(
    color: AppColors.quaternery,
    borderRadius: BorderRadius.circular(40),
    boxShadow: [
      BoxShadow(
        blurRadius: 70.0,
        blurStyle: BlurStyle.outer,
        color: Color(0xff8DA9DF).withOpacity(0.20),
        offset: Offset(2, 4),
      )
    ],
  );

  static InputDecoration containerSearch = InputDecoration(
    prefixIcon: Container(
      padding: EdgeInsets.only(left: 25, right: 10),
      child: Icon(Icons.search_outlined),
    ),
    prefixIconColor: AppColors.secondary,
    hintText: 'Search...',
    hintStyle: TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.normal,
      fontSize: 15,
      color: AppColors.secondary,
    ),
    contentPadding: EdgeInsets.fromLTRB(100, 0, 0, 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: AppColors.primary),
    ),
  );

  static BoxDecoration containerImage = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withOpacity(0.10), // Warna shadow
        blurRadius: 15.0, // Jarak blur
        offset: Offset(5, 0) // Posisi offset
      ),
    ],
  );

  static BoxDecoration containerModalDescription = BoxDecoration(
    color: AppColors.quaternery,
    borderRadius: BorderRadius.circular(20),
  );

  static TextStyle textTitle = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    fontSize: 11,
    color: AppColors.primary,
  );

  static TextStyle textSubtitle = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.normal,
    fontSize: 10,
    color: AppColors.secondary,
  );

  static BoxDecoration boxProfile = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withOpacity(0.10), // Warna shadow
        blurRadius: 30.0, // Jarak blur
        offset: Offset(1, 1), // Posisi offset
      ),
    ],
  );

  static TextStyle textTitleItem = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontSize: 20,
  );
}
