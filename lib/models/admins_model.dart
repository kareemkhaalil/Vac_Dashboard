import 'package:project_management/models/article_model.dart';
import 'package:project_management/models/icons_model.dart';
import 'package:project_management/models/schadule_model.dart';
import 'package:project_management/models/tags_model.dart';

class AdminModel {
  String? id;
  String? userName;
  String? email;
  String? password;
  List<ArticleModel>? articles;
  List<TagsModel>? tags;
  List<ScheduleModel>? schedule;
  List<IconsModel>? icons;

  AdminModel({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.articles,
    this.tags,
    this.schedule,
    this.icons,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      password: json['password'],
      articles: (json['articles'] as List<dynamic>?)
          ?.map((item) => ArticleModel.fromJson(item))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((item) => TagsModel.fromJson(item))
          .toList(),
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((item) => ScheduleModel.fromJson(item))
          .toList(),
      icons: (json['icons'] as List<dynamic>?)
          ?.map((item) => IconsModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'password': password,
      'articles': articles?.map((item) => item.toJson()).toList(),
      'tags': tags?.map((item) => item.toJson()).toList(),
      'schedule': schedule?.map((item) => item.toJson()).toList(),
      'icons': icons?.map((item) => item.toJson()).toList(),
    };
  }
}
