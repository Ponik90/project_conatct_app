import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_change_contact/utils/shared_preference.dart';
import 'package:provider/provider.dart';

import '../../../utils/global_provider.dart';

class ISettingScreen extends StatefulWidget {
  const ISettingScreen({super.key});

  @override
  State<ISettingScreen> createState() => _ISettingScreenState();
}

class _ISettingScreenState extends State<ISettingScreen> {
  GlobalProvider? providerR;
  GlobalProvider? providerW;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<GlobalProvider>().setUserName();
    context.read<GlobalProvider>().setUserBio();
    txtName.text = context.read<GlobalProvider>().userName;
    txtBio.text = context.read<GlobalProvider>().userBio;
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<GlobalProvider>();
    providerR = context.read<GlobalProvider>();
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
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              CupertinoListTile(
                title: const Text("Profile"),
                subtitle: const Text("Update Profile Data"),
                leading: const Icon(CupertinoIcons.person),
                trailing: CupertinoSwitch(
                  value: providerW!.isProfile,
                  onChanged: (value) {
                    providerR!.selectedProfile();
                  },
                ),
              ),
              if (providerW!.isProfile == true)
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          SharedHelper.helper.setUserImage(image!.path);
                          providerR!.selectedImage();
                        },
                        child: providerW!.image.isEmpty
                            ? const CircleAvatar(
                                radius: 60,
                                child: Icon(
                                  CupertinoIcons.camera,
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
                      CupertinoTextFormFieldRow(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide.none),
                        ),
                        controller: txtName,
                        placeholder: "Your Name",
                      ),
                      CupertinoTextFormFieldRow(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.name,
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide.none),
                        ),
                        controller: txtBio,
                        placeholder: "Your Bio",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CupertinoButton(
                            onPressed: () async {
                              SharedHelper.helper.setUserName(txtName.text);

                              SharedHelper.helper.setUserBio(txtBio.text);

                              providerR!.setUserName();
                              providerR!.setUserBio();
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                            child: const Text("save"),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              formKey.currentState!.reset();
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                            child: const Text("cancel"),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              else
                Container(),
              CupertinoListTile(
                title: const Text("Theme"),
                subtitle: const Text("Change Theme"),
                leading: const Icon(CupertinoIcons.sun_max),
                trailing: CupertinoSwitch(
                  value: providerW!.isTheme,
                  onChanged: (value) {
                    SharedHelper.helper.setTheme(value);
                    providerR!.selectedTheme();
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
