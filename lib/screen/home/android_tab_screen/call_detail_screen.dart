import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/contact_provider.dart';

class CallDetailScreen extends StatefulWidget {
  const CallDetailScreen({super.key});

  @override
  State<CallDetailScreen> createState() => _CallDetailScreenState();
}

class _CallDetailScreenState extends State<CallDetailScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return ListView.builder(
      itemCount: providerW!.contactList.length,
        itemBuilder: (context, index) => ListTile(
              leading: Text("${providerW!.contactList[index].name}"),
            ),);
  }
}
