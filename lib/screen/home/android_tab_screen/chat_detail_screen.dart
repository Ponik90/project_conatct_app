import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/contact_provider.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.contactList.length,
        itemBuilder: (context, index) => ListTile(
          leading: value.contactList[index].image == null ||
                  value.contactList[index].image!.isEmpty
              ? CircleAvatar(
                  child: Text(value.contactList[index].name![0]),
                )
              : CircleAvatar(
                  backgroundImage: FileImage(
                    File(value.contactList[index].image!),
                  ),
                ),
          title: Text("${value.contactList[index].name}"),
          subtitle: Text("${value.contactList[index].chat}"),
          trailing: Text(
              "${value.contactList[index].date!.day}/${value.contactList[index].date!.month}/${value.contactList[index].date!.year} ${value.contactList[index].time == null ? value.contactList[index].iosTime!.hour : value.contactList[index].time!.hour}:${value.contactList[index].time == null ? value.contactList[index].iosTime!.minute : value.contactList[index].time!.minute}"),
        ),
      ),
    );
  }
}
