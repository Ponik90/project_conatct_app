import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../utils/global_provider.dart';
import '../../model/contact_modal.dart';
import '../../provider/contact_provider.dart';

class IAddDetailScreen extends StatefulWidget {
  const IAddDetailScreen({super.key});

  @override
  State<IAddDetailScreen> createState() => _IAddDetailScreenState();
}

class _IAddDetailScreenState extends State<IAddDetailScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;
  String path = "";
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 10,
            right: 10,
          ),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      path = image!.path;
                      providerR!.getImage(image.path);
                    },
                    child: path.isEmpty
                        ? const CircleAvatar(
                            radius: 50,
                            child: Icon(Icons.linked_camera_outlined),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(
                              File(path),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(CupertinoIcons.person),
                    Flexible(
                      child: CupertinoTextFormFieldRow(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                        controller: txtName,
                        textInputAction: TextInputAction.next,
                        placeholder: "Full Name",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(CupertinoIcons.phone),
                    Flexible(
                      child: CupertinoTextFormFieldRow(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Number is required";
                          } else if (value.length != 10) {
                            return "Enter the 10 digit";
                          }
                          return null;
                        },
                        controller: txtPhone,
                        textInputAction: TextInputAction.next,
                        placeholder: "Phone Number",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(CupertinoIcons.person),
                    Flexible(
                      child: CupertinoTextFormFieldRow(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Chat is required";
                          }
                          return null;
                        },
                        controller: txtChat,
                        textInputAction: TextInputAction.next,
                        placeholder: "Chat Conversation",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CupertinoButton(
                      child: const Icon(CupertinoIcons.calendar),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (value) {
                                  providerR!.selectedDate(value);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Text(
                        "${providerW!.date!.day}/${providerW!.date!.month}/${providerW!.date!.year}"),
                  ],
                ),
                Row(
                  children: [
                    CupertinoButton(
                      child: const Icon(CupertinoIcons.calendar),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (value) {
                                  providerR!.selectedIosTime(value);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Text(
                        "${providerW!.iosTime!.hour}:${providerW!.iosTime!.minute}"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                      if (formkey.currentState!.validate()) {
                        ContactModal data = ContactModal(
                            image: path,
                            name: txtName.text,
                            phone: txtPhone.text,
                            chat: txtChat.text,
                            date: providerW!.date,
                            iosTime: providerW!.iosTime);

                        providerR?.addContact(data);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
