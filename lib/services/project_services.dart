import 'dart:convert';

import 'package:campuscollaborate/constants/api_end_points.dart';
import 'package:campuscollaborate/constants/headers.dart';
import 'package:campuscollaborate/models/create_project_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
class ProjectServices{
  final dio = Dio(
    BaseOptions(
      headers: headers,
    )
  );
  Future<void> createProject(CreateProjectModel projectModel)async{
    try{
      // print(projectModel.toJson(projectModel));
      // final response = await http.post(Uri.parse('$globalApiPoint${projectEndPoint}create'),
      //     headers: headers,
      //     body: {
      //       "projectName": "hdiwyuyyug",
      //       "description": "djisgwhwi",
      //       "skills": jsonEncode(["1","2"]),
      //       // "urls": ["bveuefue","jhj"],
      //       "duration": "4 Months",
      //       // "admin":["dveguvyg","ook"]
      //     }
      // );
      final response = await dio.post('$globalApiPoint${projectEndPoint}create',
          data: {
            "projectName": "hdiwyuyyug",
            "description": "djisgwhwi",
            "skills": ["1","2"],
            "urls": ["bveuefue","jhj"],
            "duration": "4 Months",
            "admin":["dveguvyg","ook"]
          }
      );
      print('body here');
      print(response.data);
    }catch(e){
      print(e.toString());
    }
  }
}