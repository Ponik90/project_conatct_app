import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:platform_change_contact/screen/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/global_provider.dart';

class IChatDetailScreen extends StatefulWidget {
  const IChatDetailScreen({super.key});

  @override
  State<IChatDetailScreen> createState() => _IChatDetailScreenState();
}

class _IChatDetailScreenState extends State<IChatDetailScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Contact"),
        trailing: Consumer<GlobalProvider>(
          builder: (context, value, child) => CupertinoSwitch(
            onChanged: (value) {
              context.read<GlobalProvider>().selectedPlatform();
            },
            value: value.isAndroid,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: providerW!.contactList.length,
        itemBuilder: (context, index) {
          return CupertinoListTile(
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return providerW!.contactList.isEmpty
                      ? const SizedBox()
                      : CupertinoActionSheet(
                          title: Text("${providerW!.contactList[index].name}"),
                          message:
                              Text("${providerW!.contactList[index].chat}"),
                          actions: [
                            CupertinoActionSheetAction(
                              child: const Icon(CupertinoIcons.pen),
                              onPressed: () {
                                updateDialog(index);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Icon(CupertinoIcons.delete),
                              onPressed: () {
                                providerW!.deleteContact(index);
                                Navigator.pop(context);
                              },
                            ),
                          ],
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
                "${providerW!.contactList[index].date!.day}/${providerW!.contactList[index].date!.month}/${providerW!.contactList[index].date!.year} ${providerW!.contactList[index].iosTime == null ? providerW!.contactList[index].time!.hour : providerW!.contactList[index].iosTime!.hour}:${providerW!.contactList[index].iosTime == null ? providerW!.contactList[index].time!.minute : providerW!.contactList[index].iosTime!.minute}"),
          );
        },
      ),
    );
  }

  void updateDialog(int index) {
    txtName.text = providerW!.contactList[index].name!;
    txtPhone.text = providerW!.contactList[index].phone!;
    txtChat.text = providerW!.contactList[index].chat!;
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Update Contact"),
        actions: [
          Column(
            children: [
              providerW!.contactList[index].image == null ||
                      providerW!.contactList[index].image!.isEmpty
                  ? CircleAvatar(
                      radius: 30,
                      child: Text(
                        providerW!.contactList[index].name![0],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(
                        File(providerW!.contactList[index].image!),
                      ),
                    ),
              CupertinoTextFormFieldRow(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                controller: txtName,
                textInputAction: TextInputAction.next,
              ),
              CupertinoTextFormFieldRow(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                controller: txtChat,
                textInputAction: TextInputAction.next,
              ),
              CupertinoTextFormFieldRow(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                controller: txtPhone,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      providerR!.updateContact(
                          index: index,
                          name: txtName.text,
                          phone: txtPhone.text,
                          chat: txtChat.text);
                      Navigator.pop(context);
                    },
                    child: const Text("Update"),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("cancel"),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
