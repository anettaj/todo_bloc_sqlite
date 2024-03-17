import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: lightThemeColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: lightThemeColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,

    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black
    )
  ),
  primarySwatch: Colors.deepOrange,
  iconTheme: const IconThemeData(color: Colors.deepOrange),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black
    )
  ),
  cardTheme: CardTheme(
    color: lightThemeColor,
    elevation: 15.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0)
    )
  )
);

ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: darkThemeColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkThemeColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,

        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white
        ),
        iconTheme: IconThemeData(
            color: Colors.white
        )
    ),
    primarySwatch: Colors.deepOrange,
    iconTheme: const IconThemeData(color: Colors.deepOrange),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white
        )
    ),
    cardTheme: CardTheme(
        color: darkThemeColor,
        elevation: 15.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        )
    )
);

const lightThemeColor=Colors.white;

const darkThemeColor=Color(0xff333739);