import 'package:flutter/material.dart';
import 'package:task2/Thems&colors/Colors.dart';

ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: scaffoldColor,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'OpenSans',
      fontSize:30,
      fontWeight: FontWeight.bold,
      color: blackColor,
    ),
    headline1: TextStyle(
      fontFamily: 'QuickSand',
      fontSize:23,
      fontWeight: FontWeight.bold,
      color: blackColor,
    ),
    caption: TextStyle(
      fontFamily: 'OpenSans',
      fontSize:18,
      color: Colors.grey,
    ),

    headline2: TextStyle(
      fontFamily: 'QuickSand',
      fontSize:20,
      fontWeight: FontWeight.w600,
      color: Colors.grey[500],
    ),
    bodyText2: TextStyle(
      fontFamily: 'OpenSans',
      fontSize:22,
      fontWeight: FontWeight.w800,
      color: blackColor,
    ),
    headline3: TextStyle(
      fontFamily: 'QuickSand',
      fontSize:20,
      fontWeight: FontWeight.w800,
      color: whiteColor,
    ),
    headline4: TextStyle(
      fontFamily: 'QuickSand',
      fontSize:16,
      fontWeight: FontWeight.w800,
      color: whiteColor,
    ),
    headline5: TextStyle(
    fontFamily: 'OpenSans',
    fontSize:20,
    fontWeight: FontWeight.bold,
    color: blackColor,
  ),
    headline6: TextStyle(
      fontFamily: 'OpenSans',
      fontSize:15,
      color: Colors.grey,
    ),
    subtitle1: TextStyle(
      fontSize: 15,
      fontFamily:'QuickSand',
      color: blackColor,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      fontFamily: 'OpenSans',
      fontSize:23,
      fontWeight: FontWeight.bold,
      color: whiteColor,
    ),

  ),
  iconTheme: IconThemeData(
    color: whiteColor,
  ),
);