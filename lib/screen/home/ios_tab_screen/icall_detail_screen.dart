import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_change_contact/screen/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/global_provider.dart';

class ICallDetailScreen extends StatefulWidget {
  const ICallDetailScreen({super.key});

  @override
  State<ICallDetailScreen> createState() => _ICallDetailScreenState();
}

class _ICallDetailScreenState extends State<ICallDetailScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;

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
            subtitle: Text("${providerW!.contactList[index].phone}"),
          );
        },
      ),
    );
  }
}
