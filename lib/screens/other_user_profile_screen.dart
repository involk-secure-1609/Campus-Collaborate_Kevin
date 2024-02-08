import 'package:campuscollaborate/models/user_info.dart';
import 'package:campuscollaborate/widgets/commonWidgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../services/roll_number_decoder.dart';
import '../widgets/commonWidgets/app_bar.dart';
import '../widgets/commonWidgets/common_container.dart';
import '../widgets/commonWidgets/common_elevated_button.dart';
import '../widgets/commonWidgets/skills_container.dart';

class OtherUserProfileScreen extends StatefulWidget {
  final UserInfo userInfo;
  const OtherUserProfileScreen({super.key, required this.userInfo});

  @override
  State<OtherUserProfileScreen> createState() => _OtherUserProfileScreenState();
}

class _OtherUserProfileScreenState extends State<OtherUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final RollNumberDecoder rollNumberDecoder =
        RollNumberDecoder(rollNumber: int.parse(widget.userInfo.rollNumber));
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: customAppBar('Profile'),
        bottomNavigationBar: const BottomNavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.supervised_user_circle,
                          size: 90,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userInfo.name,
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              widget.userInfo.rollNumber,
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              rollNumberDecoder.getBranch(),
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.userInfo.program,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/chat_bubble.png',
                            width: 33.53,
                            height: 34.71,
                          ),
                          const Text(
                            'Message',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CommonContainer(children: [
                  const Text(
                    'Skills',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SkillsListView(skillsList: widget.userInfo.skills),
                ]),
                const SizedBox(
                  height: 20,
                ),
                CommonContainer(children: [
                  const Text(
                    'Courses',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SkillsListView(skillsList: widget.userInfo.courses),
                ]),
                const SizedBox(
                  height: 20,
                ),
                CommonGesturizedButton(
                    onPressed: () {},
                    buttonText: const Text(
                      'Projects',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 20,
                ),
                CommonGesturizedButton(
                    onPressed: () {},
                    buttonText: const Text(
                      'Course Reviews',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
