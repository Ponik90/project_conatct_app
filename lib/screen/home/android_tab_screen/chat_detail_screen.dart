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
  ContactProvider? providerR;
  ContactProvider? providerW;

  String updateImage = "";
  TextEditingController txtName = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return ListView.builder(
      itemCount: providerW!.contactList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Text(
                      "${providerW!.contactList[index].name}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text("${providerW!.contactList[index].chat}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            providerR!.deleteContact(index);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        leading: providerW!.contactList[index].image == null ||
                providerW!.contactList[index].image!.isEmpty
            ? CircleAvatar(
                child: Text(providerW!.contactList[index].name![0]),
              )
            : CircleAvatar(
                backgroundImage: FileImage(
                  File(providerW!.contactList[index].image!),
                ),
              ),
        title: Text("${providerW!.contactList[index].name}"),
        subtitle: Text("${providerW!.contactList[index].chat}"),
        trailing: Text(
            "${providerW!.contactList[index].date!.day}/${providerW!.contactList[index].date!.month}/${providerW!.contactList[index].date!.year} ${providerW!.contactList[index].time == null ? providerW!.contactList[index].iosTime!.hour : providerW!.contactList[index].time!.hour}:${providerW!.contactList[index].time == null ? providerW!.contactList[index].iosTime!.minute : providerW!.contactList[index].time!.minute}"),
      ),
    );
  }


}
