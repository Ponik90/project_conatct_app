import 'package:flutter/cupertino.dart';

CupertinoThemeData lightThemeIos = const CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    navLargeTitleTextStyle:
    TextStyle(fontSize: 25, color: CupertinoColors.black),
    navTitleTextStyle: TextStyle(fontSize: 15, color: CupertinoColors.black),
  ),
  scaffoldBackgroundColor: CupertinoColors.white,
  brightness: Brightness.light,
  barBackgroundColor: CupertinoColors.white,
  primaryColor:(Color(0xff0e97e1)),
);

CupertinoThemeData darkThemeIos =  const CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    navLargeTitleTextStyle:
    TextStyle(fontSize: 25, color: CupertinoColors.white),
    navTitleTextStyle: TextStyle(fontSize: 15, color: CupertinoColors.white),
  ),
  scaffoldBackgroundColor: CupertinoColors.black,
  brightness: Brightness.dark,
  barBackgroundColor: CupertinoColors.black,
  primaryColor: Color(0xff0e97e1),
  applyThemeToAll: true
);