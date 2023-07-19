import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData themeEnglish = ThemeData(
  primaryColor: AppColor.primaryColor,
  appBarTheme: const AppBarTheme(
    color: AppColor.primaryColor
  ),
  floatingActionButtonTheme:const FloatingActionButtonThemeData(
    backgroundColor: AppColor.secondaryColor,
  ),
  fontFamily: "Lato",
  textTheme: const TextTheme(
    headline1: TextStyle(
        color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 20),
    headline2: TextStyle(
        color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 26),
    bodyText1: TextStyle(
        height: 1.5,
        color: AppColor.grey,
        fontSize: 15,
        fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
      height: 1.5,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  primaryColor: AppColor.primaryColor,
  appBarTheme: const AppBarTheme(
      color: AppColor.primaryColor
  ),
  floatingActionButtonTheme:const FloatingActionButtonThemeData(
    backgroundColor: AppColor.secondaryColor,
  ),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headline1: TextStyle(
        color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 20),
    headline2: TextStyle(
        color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 26),
    bodyText1: TextStyle(
        height: 1.5,
        color: AppColor.grey,
        fontSize: 15,
        fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
      height: 1.5,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
  primarySwatch: Colors.blue,
);
