import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../utils/global_provider.dart';

class IAddDetailScreen extends StatefulWidget {
  const IAddDetailScreen({super.key});

  @override
  State<IAddDetailScreen> createState() => _IAddDetailScreenState();
}

class _IAddDetailScreenState extends State<IAddDetailScreen> {
  GlobalProvider? providerR;
  GlobalProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<GlobalProvider>();
    providerW = context.watch<GlobalProvider>();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text("Contact"),
          trailing: CupertinoSwitch(
            onChanged: (value) {
              providerR!.selectedPlatform();
            },
            value: providerW!.isAndroid,
          ),
        ),
        child: const Center(),);
  }
}
