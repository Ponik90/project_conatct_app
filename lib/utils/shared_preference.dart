import 'package:shared_preferences/shared_preferences.dart';

class sheredTheme {
  Future<void> setTheme(bool themeData) async {
    SharedPreferences shered = await SharedPreferences.getInstance();
    await shered.setBool('true', themeData);
  }

  Future<bool> getTheme() async {
    bool? data;

    SharedPreferences shered = await SharedPreferences.getInstance();
    data = shered.getBool('true')!;
    return data;
  }
}
