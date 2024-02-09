import 'package:campuscollaborate/constants/api_end_points.dart';
import 'package:campuscollaborate/constants/http_handler.dart';
import 'package:campuscollaborate/constants/routing_constants.dart';
import 'package:campuscollaborate/locator.dart';
import 'package:campuscollaborate/models/create_project_model.dart';
import 'package:campuscollaborate/models/project.dart';
import 'package:campuscollaborate/services/user_services.dart';
import 'package:campuscollaborate/widgets/commonWidgets/snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constants/dio.dart';
class ProjectServices{
  Future<void> createProject(CreateProjectModel projectModel, BuildContext context, String imagePath)async{
    final UserServices userServices=UserServices();
    try{
      print('clicked');
      var bodyToBeSent=projectModel.toJson(projectModel);
      print('clicked after json');
      final response = await dio.post('$globalApiPoint${projectEndPoint}create',
          data: bodyToBeSent
      );
      print(response.data);
      //final String id=response.data['id'];
     // print(id);
      print("id not printed");
      // FormData formData = FormData.fromMap({
      //   "thumbnail": await MultipartFile.fromFile(imagePath, filename: "image.jpg"),
      // });
      // final thumbnailResponse = await dio.post('$globalApiPoint${projectEndPoint}addThumbnail',
      //     data: {
      //   "thumbnail": "formData",
      //       "id":id
      //     }
      // );
      // print('clicked after response');
      // await userServices.getCurrentUserDetails(context);
      // navigationService.pushScreen(Routes.navBarScreen);
      // await httpHandler(response, () async{
      //     ScaffoldMessenger.of(context).showSnackBar(showCommonSnackBar('Project Created Sucessfuly!'));
      //
      // }, context);

    }catch(e){
      print("error here");
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(showCommonSnackBar(e.toString()));
    }
  }
}