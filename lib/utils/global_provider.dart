import 'package:flutter/widgets.dart';
import 'package:platform_change_contact/utils/shared_preference.dart';

class GlobalProvider with ChangeNotifier {
  bool isAndroid = true;
  bool isTheme = true;

  void selectedPlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }

  void selectedTheme() async {
    isTheme = await getTheme();
    notifyListeners();
  }
}
