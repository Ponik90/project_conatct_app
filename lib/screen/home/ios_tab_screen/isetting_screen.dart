import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../utils/global_provider.dart';

class ISettingScreen extends StatefulWidget {
  const ISettingScreen({super.key});

  @override
  State<ISettingScreen> createState() => _ISettingScreenState();
}

class _ISettingScreenState extends State<ISettingScreen> {
  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            CupertinoListTile(
              title: const Text("Profile"),
              subtitle: const Text("Update Profile Data"),
              leading: const Icon(CupertinoIcons.person),
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            CupertinoListTile(
              title: const Text("Theme"),
              subtitle: const Text("Change Theme"),
              leading: const Icon(CupertinoIcons.sun_max),
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
