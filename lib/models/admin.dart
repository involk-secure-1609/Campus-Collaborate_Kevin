import 'package:hive/hive.dart';

part 'admin.g.dart';

@HiveType(typeId: 3)
class Admin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? url;

  Admin({required this.id, required this.name, this.url});

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
      id: json['_id'] as String,
      name: json['name'] as String,
      url: json['url'] );

  Map<String, dynamic> toJson(Admin admin) =>
      <String, dynamic>{"_id": admin.id, "name": admin.name, "url": admin.url};
}
