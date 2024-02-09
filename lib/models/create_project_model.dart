import 'dart:io';
import 'package:mime/mime.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class CreateProjectModel{
  final String projectName;
  final String description;
  final List<dynamic> skills;
  final List<String>? urls;
  final String duration;
  final bool isActive;
  final String id;
  final List<String>? admin;
  final List<String>? starBy;
  final String owner;
  final List<File>? thumbnail;

  CreateProjectModel({
    required this.projectName,
    required this.description,
    required this.skills,
    required this.urls,
    required this.duration,
    required this.isActive,
    required this.id,
    required this.admin,
    required this.starBy,
    required this.owner,
    this.thumbnail
  });

  Future<Map<String, dynamic>> toJson(CreateProjectModel instance) async {
    final map= <String, dynamic>{
      'projectName': instance.projectName,
      'description': instance.description,
      'skills': instance.skills,
      'urls': instance.urls,
      'duration': instance.duration,
      'isActive': instance.isActive,
      '_id': instance.id,
      'admin': instance.admin,
      'starBy': instance.starBy,
      'owner': instance.owner,
      'thumbnail': await instance.getThumbnailFormData(instance.thumbnail)
    };
    return map;
  }
  Future<List<Map<String, dynamic>>> getThumbnailFormData(List<File>? thumbnails) async {
    if (thumbnails == null) return [];

    List<Map<String, dynamic>> formDataList = [];
    for (var file in thumbnails) {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType(
            'image',
            file.path.split('/').last.split('.').last,
          ),
        ),
      });
      formDataList.add(Map.fromEntries(formData.fields));
    }
    return formDataList;
  }
}