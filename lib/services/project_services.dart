import 'package:campuscollaborate/constants/api_end_points.dart';
import 'package:campuscollaborate/constants/http_handler.dart';
import 'package:campuscollaborate/constants/routing_constants.dart';
import 'package:campuscollaborate/locator.dart';
import 'package:campuscollaborate/models/create_project_model.dart';
import 'package:campuscollaborate/widgets/commonWidgets/snack_bar.dart';
import 'package:flutter/material.dart';

import '../constants/dio.dart';
class ProjectServices{
  Future<void> createProject(CreateProjectModel projectModel, BuildContext context)async{
    try{
      final response = await dio.post('$globalApiPoint${projectEndPoint}create',
          data: projectModel.toJson(projectModel)
      );
      await httpHandler(response, () {

      }, context);

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(showCommonSnackBar(e.toString()));
    }
  }
}