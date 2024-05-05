import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/contact_provider.dart';

class CallDetailScreen extends StatefulWidget {
  const CallDetailScreen({super.key});

  @override
  State<CallDetailScreen> createState() => _CallDetailScreenState();
}

class _CallDetailScreenState extends State<CallDetailScreen> {
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
          subtitle: Text("${value.contactList[index].phone}"),
        ),
      ),
    );
  }
}
