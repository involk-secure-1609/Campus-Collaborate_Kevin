import 'package:campuscollaborate/models/user_info.dart';
import 'package:campuscollaborate/services/user_services.dart';
import 'package:campuscollaborate/widgets/commonWidgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

import '../constants/skills.dart';
import '../widgets/commonWidgets/common_elevated_button.dart';
import '../widgets/createProjectScreen/multi_dropdown.dart';
class EditProfile extends StatefulWidget {
  final UserInfo userDetails;
  const EditProfile({super.key, required this.userDetails});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final MultiSelectController multiSelectController = MultiSelectController();
  final MultiSelectController multiSelectCourseController = MultiSelectController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: customAppBar('Edit Profile'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.userDetails.url != null ?
                    Image.network(widget.userDetails.url!,):
                    const Icon(
                      Icons.supervised_user_circle,
                      size: 120,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 40,),
                const Text(
                  'Skills',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5,),
                MultipleSelectionDropDown(multiSelectDropDown: multiSelectController),
                const SizedBox(height: 16,),
                const Text(
                  'Courses',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5,),
                MultipleSelectionCourseDropDown(multiSelectDropDown: multiSelectCourseController),
                const SizedBox(height: 20,),
                Center(
                    child: CommonElevatedButton(
                        onTap: () async{
                          print("Updating Skills");
                          await UserServices().updateSkills(context, getSelectedSkills(multiSelectController.selectedOptions));
                          print("Updated SKills");
                        },
                        text: 'Update Profile')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
List<String> getSelectedSkills(List<ValueItem> list){
  final List<String> listToBeReturned=[];
  for(int i=0; i<list.length;i++){
    listToBeReturned.add(list[i].value.toString());
  }
  return listToBeReturned;
}
