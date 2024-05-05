import 'package:flutter/material.dart';
import 'package:platform_change_contact/screen/home/android_tab_screen/add_detail_screen.dart';
import 'package:platform_change_contact/screen/home/android_tab_screen/call_detail_screen.dart';
import 'package:platform_change_contact/screen/home/android_tab_screen/chat_detail_screen.dart';
import 'package:platform_change_contact/screen/home/android_tab_screen/setting_screen.dart';
import 'package:platform_change_contact/utils/global_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalProvider? providerR;
  GlobalProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<GlobalProvider>();
    providerW = context.watch<GlobalProvider>();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Contact",style: TextStyle(fontSize: 18),),
            actions: [
              Switch(
                value: providerW!.isAndroid,
                onChanged: (value) {
                  providerR!.selectedPlatform();
                },
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.person_add_alt),
                ),
                Tab(
                  text: "Calls",
                ),
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "Settings",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AddDetailScreen(),
              CallDetailScreen(),
              ChatDetailScreen(),
              SettingScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
