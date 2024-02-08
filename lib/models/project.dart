import 'package:campuscollaborate/models/admin.dart';
import 'package:hive/hive.dart';

part 'project.g.dart';

@HiveType(typeId: 2)
class Project {
  @HiveField(0)
  final String projectName;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final List<dynamic> skills;
  @HiveField(3)
  final List<String>? urls;
  @HiveField(4)
  final String duration;
  @HiveField(5)
  final bool isActive;
  @HiveField(6)
  final String id;
  @HiveField(7)
  final List<Admin>? admin;
  @HiveField(8)
  final List<String>? starBy;
  @HiveField(9)
  final Admin owner;
  @HiveField(10)
  final List<String>? thumbnail;
  @HiveField(11)
  final List<String>? docs;

  Project(
      {required this.projectName,
      required this.description,
      required this.skills,
      required this.urls,
      required this.duration,
      required this.isActive,
      required this.id,
      required this.admin,
      required this.starBy,
      required this.owner,
      required this.docs,
        required this.thumbnail
      });
  factory Project.fromJson(Map<String, dynamic> json) => Project(
        projectName: json['projectName'] as String,
        description: json['description'] as String,
        skills: json['skills'] as List<dynamic>,
        urls:
            (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList(),
        duration: json['duration'] as String,
        isActive: json['isActive'] as bool,
        id: json['projectId'] as String,
        admin:
            (json['admin'] as List<dynamic>?)?.map((e) => Admin.fromJson(e as Map<String, dynamic>)).toList(),
        starBy: (json['starBy'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        owner: Admin.fromJson(json['owner']),
        thumbnail: (json['thumbnail'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        docs: (json['docs'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList()
      );

  Map<String, dynamic> toJson(Project instance) => <String, dynamic>{
        'projectName': instance.projectName,
        'description': instance.description,
        'skills': instance.skills,
        'urls': instance.urls,
        'duration': instance.duration,
        'isActive': instance.isActive,
        'projectId': instance.id,
        'admin': instance.admin,
        'starBy': instance.starBy,
        'owner': instance.owner,
      };
}
