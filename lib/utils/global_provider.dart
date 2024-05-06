import 'package:flutter/widgets.dart';

import 'package:platform_change_contact/utils/shared_preference.dart';

class GlobalProvider with ChangeNotifier {

  bool isAndroid = true;
  bool isTheme = true;
  bool isProfile = false;
  String image = "";
  String userName="";
  String userBio="";

  void selectedPlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }

  void selectedTheme() async {
    sheredTheme shr = sheredTheme();
    isTheme = await shr.getTheme();
    notifyListeners();
  }

  void selectedProfile() {
    isProfile = !isProfile;
    notifyListeners();
  }

  void selectedImage(String path) {
    image = path;
    notifyListeners();
  }


}
