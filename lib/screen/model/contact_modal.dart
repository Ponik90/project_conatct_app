import 'package:flutter/material.dart';

class ContactModal {
  String? name, phone, chat, image;
  DateTime? date=DateTime.now();
  DateTime? iosTime=DateTime.now();
  TimeOfDay? time=TimeOfDay.now();


  ContactModal(
      {this.image, this.name, this.phone, this.chat, this.date, this.time,this.iosTime});
}
