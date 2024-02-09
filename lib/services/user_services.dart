import 'dart:convert';

import 'package:campuscollaborate/constants/api_end_points.dart';
import 'package:campuscollaborate/constants/dio.dart';
import 'package:campuscollaborate/services/docs_and_images.dart';
import 'package:campuscollaborate/services/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/user_info.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
class UserServices {
  Future<UserInfo> getCurrentUserDetails(BuildContext context) async {
    try {
      final response = await dio.get('$globalApiPoint${userEndPoint}userById');
      print(response.data);
      final UserInfo userInfo = UserInfo.fromJson(response.data);
      context.read<UserProvider>().setUser(userInfo);
      return context
          .read<UserProvider>()
          .userInfo;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateSkills(BuildContext context, List<String> skills) async {
    try {
      final response = await dio.post('$globalApiPoint${userEndPoint}addSkills',
        data: {
          "skills": skills
        },
      );
      final UserInfo userInfo = UserInfo.fromJson(response.data);
      context.read<UserProvider>().setUser(userInfo);
      print("hi");
      print(response.data);
    } catch (e) {
      print("__________________");
      print(e.toString());
      rethrow;
    }
  }
  Future<void> updateCourses(BuildContext context,List<String> courses) async {
    try {
      final response = await dio.post('$globalApiPoint${userEndPoint}addCourses',
        data: {
          "courses": courses
        },
      );
      final UserInfo userInfo = UserInfo.fromJson(response.data);
      context.read<UserProvider>().setUser(userInfo);
      print("hi");
      print(response.data);
    } catch (e) {
      print("__________________");
      print(e.toString());
      rethrow;
    }
  }
  Future<void> updateDp(String imagePath) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imagePath, filename: "image.png"),
    });
    final response = await dio.post('$globalApiPoint${userEndPoint}changeDp',
      data: formData,
    );
    print("Success??");
    print(response.data);
  }


}