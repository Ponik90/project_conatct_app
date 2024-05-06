

import 'package:flutter/material.dart';
import 'package:platform_change_contact/screen/model/contact_modal.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModal> contactList = [];

  String image = "";
  DateTime? date = DateTime.now();
  DateTime? iosTime = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();

  void getImage(String path) {
    image = path;
    notifyListeners();
  }

  void selectedDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }

  void selectedIosTime(DateTime time) {
    iosTime = time;
    notifyListeners();
  }

  void selectedTime(TimeOfDay time )
  {
    this.time = time;
    notifyListeners();
  }

  void addContact(ContactModal data)
  {
    contactList.add(data);
    
    notifyListeners();
  }

  void deleteContact(index)
  {
    contactList.removeAt(index);

    notifyListeners();
  }
}
