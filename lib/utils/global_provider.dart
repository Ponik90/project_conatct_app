import 'package:flutter/widgets.dart';

import 'package:platform_change_contact/utils/shared_preference.dart';

class GlobalProvider with ChangeNotifier {
  bool isAndroid = true;
  bool isTheme = true;
  bool isProfile = false;
  String image = "";
  String userName = "";
  String userBio = "";

  Future<void> setUserName() async {
    userName = await SharedHelper.helper.getUserName();
    print("=========+++++++++++++provider name==$userName");
    notifyListeners();
  }

  Future<void> setUserBio() async {
    userBio = await SharedHelper.helper.getUserBio();
    print("=========+++++++++++++provider bio==$userBio");
    notifyListeners();
  }

  Future<void> selectedImage() async {
    image = await SharedHelper.helper.getUserImage();
    print("=========+++++++++++++provider image==$image");
    notifyListeners();
  }

  void selectedPlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }

  void selectedTheme() async {
    isTheme = await SharedHelper.helper.getTheme();
    notifyListeners();
  }

  void selectedProfile() {
    isProfile = !isProfile;
    notifyListeners();
  }
}
