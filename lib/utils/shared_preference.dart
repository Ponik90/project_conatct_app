import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedHelper helper = SharedHelper._();

  SharedHelper._();

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

  Future<void> setUserName(String name) async {
    print("=========+++++++++++++set==$name");
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setString('name', name);
  }

  Future<String> getUserName() async {
    String? name;
    SharedPreferences shr = await SharedPreferences.getInstance();
    name = shr.getString('name')!;
    print("=========+++++++++++++get==$name");
    return name;
  }

  Future<void> setUserBio(String bio) async {
    SharedPreferences shr = await SharedPreferences.getInstance();

    await shr.setString('bio', bio);
  }

  Future<String> getUserBio() async {
    String? bio;

    SharedPreferences shr = await SharedPreferences.getInstance();

    bio = shr.getString('bio')!;
    return bio;
  }

  Future<void> setUserImage(String image) async {
    SharedPreferences shr = await SharedPreferences.getInstance();

    await shr.setString('image', image);
  }

  Future<String> getUserImage() async {
    String? image;
    SharedPreferences shr = await SharedPreferences.getInstance();

    image = shr.getString('image')!;
    return image;
  }
}
