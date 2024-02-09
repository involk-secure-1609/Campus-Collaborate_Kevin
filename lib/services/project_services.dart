import 'dart:io';
import 'package:campuscollaborate/constants/api_end_points.dart';
import 'package:campuscollaborate/models/create_project_model.dart';
import 'package:campuscollaborate/widgets/commonWidgets/snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constants/dio.dart';
class ProjectServices{
  Future<void> createProject(CreateProjectModel projectModel, BuildContext context, String? imagePath, List<File>? docs)async{
    try{
      var bodyToBeSent=projectModel.toJson(projectModel);
      final response = await dio.post('$globalApiPoint${projectEndPoint}create',
          data: bodyToBeSent
      );
      final String id=response.data['_id'];
     if(imagePath!=null){
       FormData formData = FormData.fromMap({
         "thumbnail": await MultipartFile.fromFile(imagePath, filename: "image.jpg"),
         "id":id
       });
       final thumbnailResponse = await dio.post('$globalApiPoint${projectEndPoint}addThumbnail',
           data: formData
       );
     }
     if(docs!=null&&docs.isNotEmpty){
       final FormData docsFormData = await projectModel.getDocsFormData(docs, id);
       final docsResponse =await dio.post('$globalApiPoint${projectEndPoint}addDocs',
           data: docsFormData
       );
     }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(showCommonSnackBar(e.toString()));
    }
  }
}