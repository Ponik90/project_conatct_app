import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_change_contact/screen/provider/contact_provider.dart';
import 'package:platform_change_contact/utils/change_theme.dart';
import 'package:platform_change_contact/utils/global_provider.dart';
import 'package:platform_change_contact/utils/screen_routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GlobalProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ContactProvider(),
        )
      ],
      child: Consumer<GlobalProvider>(
        builder: (context, value, child) {
          value.selectedTheme();
          return value.isAndroid
              ? MaterialApp(
                  theme: lightThemeMode,
                  darkTheme: darkThemeMode,
                  themeMode:
                      value.isTheme == true ? ThemeMode.light : ThemeMode.dark,
                  routes: androidScreen,
                  debugShowCheckedModeBanner: false,
                )
              : CupertinoApp(
                  routes: iosScreen,
                  debugShowCheckedModeBanner: false,
                  theme: CupertinoThemeData(),
                );
        },
      ),
    ),
  );
}
