import 'package:flutter/material.dart';

ThemeData lightThemeMode = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
    backgroundColor: Color(0xff0e97e1),
  ),
  colorSchemeSeed: const Color(0xff0e97e1),
  iconTheme: const IconThemeData(
    color: Colors.grey,
  ),
);
ThemeData darkThemeMode = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white),
    backgroundColor: Colors.black,
  ),
  colorSchemeSeed: Colors.white,
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(color: Colors.white),
    indicatorColor: Colors.white,
    unselectedLabelColor: Colors.grey,
  ),
  brightness: Brightness.dark,
);
