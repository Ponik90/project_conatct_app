import 'package:flutter/cupertino.dart';
import 'package:platform_change_contact/screen/home/ios_tab_screen/iadd_detail_screen.dart';
import 'package:platform_change_contact/screen/home/ios_tab_screen/icall_detail_screen.dart';
import 'package:platform_change_contact/screen/home/ios_tab_screen/ichat_detail_screen.dart';
import 'package:platform_change_contact/screen/home/ios_tab_screen/isetting_screen.dart';

class IHomeScreen extends StatefulWidget {
  const IHomeScreen({super.key});

  @override
  State<IHomeScreen> createState() => _IHomeScreenState();
}

class _IHomeScreenState extends State<IHomeScreen> {
  @override
  Widget build(BuildContext context) {
    List iScreen = [
      const IAddDetailScreen(),
      const ICallDetailScreen(),
      const IChatDetailScreen(),
      const ISettingScreen(),
    ];

    return CupertinoTabScaffold(

      tabBar: CupertinoTabBar(
        items: const [

          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_badge_plus,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.phone,
            ),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble_2,
            ),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.settings,
            ),
            label: "Settings",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return iScreen[index];
      },
    );
  }
}
