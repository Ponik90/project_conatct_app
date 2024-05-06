import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_change_contact/utils/global_provider.dart';
import 'package:platform_change_contact/utils/shared_preference.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  GlobalProvider? providerR;
  GlobalProvider? providerW;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<GlobalProvider>();
    providerR = context.read<GlobalProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: const Text("Profile"),
            subtitle: const Text("Update Profile Data"),
            trailing: Switch(
              value: providerW!.isProfile,
              onChanged: (value) {
                providerR!.selectedProfile();
              },
            ),
          ),
          providerW!.isProfile == true
              ? Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);

                          providerR!.selectedImage(image!.path);
                        },
                        child: providerW!.image.isEmpty
                            ? const CircleAvatar(
                                radius: 60,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 30,
                                ),
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage: FileImage(
                                  File(providerW!.image),
                                ),
                              ),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: "Enter you name",
                          enabledBorder: InputBorder.none,
                        ),
                        controller: txtName,
                        validator: (value) {
                          if (value == null) {
                            return "name is required";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            hintText: "Enter you bio",
                            enabledBorder: InputBorder.none),
                        controller: txtBio,
                        validator: (value) {
                          if (value == null) {
                            return "Bio is required";
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                SharedPreferences userList =
                                    await SharedPreferences.getInstance();
                                userList.setStringList('detail', [
                                  providerW!.image,
                                  providerW!.userName = txtName.text,
                                  providerW!.userName = txtBio.text
                                ]);
                                FocusManager.instance.primaryFocus!.unfocus();
                              }
                            },
                            child: const Text("save"),
                          ),
                          TextButton(
                            onPressed: () {
                              formKey.currentState!.reset();
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                            child: const Text("cancel"),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
          const Divider(
            endIndent: 10,
            indent: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.wb_sunny_outlined,
            ),
            title: const Text("Theme"),
            subtitle: const Text("Change Theme"),
            trailing: Switch(
              value: providerW!.isTheme,
              onChanged: (value) {
                sheredTheme shr = sheredTheme();
                shr.setTheme(value);

                providerR!.selectedTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
