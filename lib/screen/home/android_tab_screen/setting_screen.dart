import 'package:flutter/material.dart';
import 'package:platform_change_contact/utils/global_provider.dart';
import 'package:platform_change_contact/utils/shared_preference.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  GlobalProvider? providerR;
  GlobalProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<GlobalProvider>();
    providerR = context.read<GlobalProvider>();
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.person,
          ),
          title: const Text("Profile"),
          subtitle: const Text("Update Profile Data"),
          trailing: Switch(
            value: false,
            onChanged: (value) {},
          ),
        ),
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
              setTheme(value);
              providerR!.selectedTheme();
            },
          ),
        ),
      ],
    );
  }
}
