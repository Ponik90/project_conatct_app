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
    if (await SharedHelper.helper.getUserName() != null) {
      userName = (await SharedHelper.helper.getUserName())!;
    } else {
      userName = "";
    }

    notifyListeners();
  }

  Future<void> setUserBio() async {
    if (await SharedHelper.helper.getUserBio() != null) {
      userBio = (await SharedHelper.helper.getUserBio())!;
    } else {
      userBio = "";
    }

    notifyListeners();
  }

  Future<void> selectedImage() async {
    if (await SharedHelper.helper.getUserImage() != null) {
      image = (await SharedHelper.helper.getUserImage())!;
    } else {
      image = "";
    }


    notifyListeners();
  }

  void selectedPlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }

  void selectedTheme() async {
    if (await SharedHelper.helper.getTheme() != null) {
      isTheme = (await SharedHelper.helper.getTheme())!;
    } else {
      isTheme = true;
    }

    notifyListeners();
  }

  void selectedProfile() {
    isProfile = !isProfile;
    notifyListeners();
  }
}
