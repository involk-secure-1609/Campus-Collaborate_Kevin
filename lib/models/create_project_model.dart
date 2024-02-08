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
    'projectName': instance.projectName.toString(),
    'description': instance.description.toString(),
    'skills': instance.skills.toString(),
    'urls': instance.urls.toString(),
    'duration': instance.duration,
    'isActive': instance.isActive.toString(),
    '_id': instance.id.toString(),
    'admin': instance.admin.toString(),
    'starBy': instance.starBy.toString(),
    'owner': instance.owner.toString(),
    'thumbnail':instance.thumbnail.toString()
  };

}