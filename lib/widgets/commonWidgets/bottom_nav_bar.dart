import 'package:campuscollaborate/chats/dmchats.dart';
import 'package:campuscollaborate/constants/themes.dart';
import 'package:campuscollaborate/models/user_info.dart';
import 'package:campuscollaborate/sample_data.dart';
import 'package:campuscollaborate/screens/home_screen.dart';
import 'package:campuscollaborate/screens/new_course_review_screen.dart';
import 'package:campuscollaborate/screens/test_screen.dart';
import 'package:campuscollaborate/services/nav_bar_services.dart';
import 'package:campuscollaborate/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController controller =
        PersistentTabController(initialIndex: 0);
    return Consumer<NavBarService>(builder: (context, navBarService, child) {
      return PersistentTabView(
        context,
        backgroundColor: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
        decoration: NavBarDecoration(borderRadius: BorderRadius.circular(15.0)),
        navBarHeight: 65,
        navBarStyle: NavBarStyle.style7,
        items: [
          PersistentBottomNavBarItem(
              icon: Image.asset(
                'assets/home.png',
                width: 32,
              ),
              activeColorPrimary: Colors.black,
              activeColorSecondary: Colors.black,
              inactiveColorPrimary: Colors.black),
          PersistentBottomNavBarItem(
              icon: Image.asset('assets/course_review.png', width: 32),
              activeColorPrimary: Colors.black,
              activeColorSecondary: Colors.black,
              inactiveColorPrimary: Colors.black),
          PersistentBottomNavBarItem(
              icon: Image.asset('assets/hand_shake.png', width: 32),
              activeColorPrimary: Colors.black,
              activeColorSecondary: Colors.black,
              inactiveColorPrimary: Colors.black),
          PersistentBottomNavBarItem(
              icon: Image.asset('assets/chat.png', width: 32),
              activeColorPrimary: Colors.black,
              activeColorSecondary: Colors.black,
              inactiveColorPrimary: Colors.black)
        ],
        controller: controller,
        screens: [HomeScreen(userInfo: context.read<UserProvider>().userInfo),  const CourseReview(), const TestScreen(), DmChatScreen()],
      );
    });
  }
}
