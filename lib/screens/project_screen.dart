import 'package:campuscollaborate/constants/themes.dart';
import 'package:campuscollaborate/models/project.dart';
import 'package:campuscollaborate/widgets/commonWidgets/app_bar.dart';
import 'package:campuscollaborate/widgets/commonWidgets/bottom_nav_bar.dart';
import 'package:campuscollaborate/widgets/commonWidgets/contributors_container.dart';
import 'package:campuscollaborate/widgets/commonWidgets/skills_container.dart';
import 'package:campuscollaborate/widgets/commonWidgets/custom_floating_action_button.dart';
import 'package:campuscollaborate/widgets/image_collage.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  final Project project;
  const ProjectScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {},
        icon: Image.asset('assets/star.png'),
      ),
      appBar: customAppBar(project.projectName),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              project.thumbnail == null || project.thumbnail!.isEmpty
                  ? const SizedBox(
                height: 0,
              ):CustomImageCollage(imagesLink: project.thumbnail!),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.projectName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Time Taken: ${project.duration}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color:
                              Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Image.asset(
                        'assets/share_button.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SkillsListView(skillsList: project.skills),
              project.admin == null || project.admin!.isEmpty
                  ? const SizedBox(
                      height: 0,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contributors',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        ContributorListView(contributorsList: project.admin!)
                      ],
                    ),
              const SizedBox(
                height: 10,
              ),
              Text(
                project.description,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
