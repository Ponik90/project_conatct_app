import 'package:flutter/widgets.dart';

class GlobalProvider with ChangeNotifier {
  bool isAndroid = true;

  void selectedPlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}
