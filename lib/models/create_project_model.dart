import 'dart:io';


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

  Map<String, dynamic> toJson(CreateProjectModel instance) => <String, dynamic>{
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
    'thumbnail':instance.thumbnail
  };

}