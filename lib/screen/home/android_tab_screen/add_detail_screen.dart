import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_change_contact/screen/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import '../../model/contact_modal.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({super.key});

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  String path = "";
  ContactProvider? providerR;
  ContactProvider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: InkWell(
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
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                  hintText: "Full Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Chat is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  hintText: "Phone Number",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Chat is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat_outlined),
                  border: OutlineInputBorder(),
                  hintText: "Chat Conversation",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Chat is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: () async {
                  DateTime? d1 = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  );
                  if (d1 != null) {
                    providerR!.selectedDate(d1);
                  }
                },
                label: Text(
                    "${providerR!.date.day}-${providerR!.date.month}-${providerR!.date.year}"),
                icon: const Icon(Icons.calendar_month),
              ),
              TextButton.icon(
                onPressed: () async {
                  TimeOfDay? t1 = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (t1 != null) {
                    providerR!.selectedTime(t1);
                  }
                },
                label:
                    Text("${providerW!.time.hour}:${providerW!.time.minute}"),
                icon: const Icon(Icons.watch_later_outlined),
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
                        time: providerW!.time,
                      );

                      providerW!.contactList.add(data);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
