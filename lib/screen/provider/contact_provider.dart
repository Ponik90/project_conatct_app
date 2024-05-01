import 'package:flutter/material.dart';
import 'package:platform_change_contact/screen/model/contact_modal.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModal> contactList = [];

  String image = "";
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  void getImage(String path) {
    image = path;
    notifyListeners();
  }

  void selectedDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }

  void selectedTime(TimeOfDay time )
  {
    this.time = time;
    notifyListeners();
  }
}
