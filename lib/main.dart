import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_change_contact/utils/screen_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(
    MaterialApp(
      routes: screen,
    ),
  );
}
