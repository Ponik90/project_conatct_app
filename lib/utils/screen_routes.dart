import 'package:flutter/material.dart';

import '../screen/home/home_screen.dart';
import '../screen/home/ihome_screen.dart';

Map<String, WidgetBuilder> androidScreen = {
  '/': (context) => const HomeScreen(),
};

Map<String, WidgetBuilder> iosScreen = {
  '/': (context) => const IHomeScreen(),
};
