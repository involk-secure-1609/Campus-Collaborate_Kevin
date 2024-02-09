import 'package:campuscollaborate/constants/api_end_points.dart';
import 'package:campuscollaborate/constants/dio.dart';
import 'package:campuscollaborate/models/project.dart';
import 'package:campuscollaborate/services/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/user_info.dart';

class UserServices{
  Future<UserInfo> getCurrentUserDetails(BuildContext context)async{
   try{
     final response= await dio.get('$globalApiPoint${userEndPoint}userById');
     final UserInfo userInfo= UserInfo.fromJson(response.data);
     final projectResponse= await dio.get('$globalApiPoint${projectEndPoint}getAllProject');
     final List<Project> projectList= [];
     print(projectResponse);
     for(int i=0;i<projectResponse.data.length; i++){
       print(projectResponse.data[i]['skills']);
       projectList.add(Project.fromJson(projectResponse.data[i]));
     }
     userInfo.addProjects(projectList);
     context.read<UserProvider>().setUser(userInfo);
     return context.read<UserProvider>().userInfo;
   }catch(e){
     rethrow;
   }
  }
}

