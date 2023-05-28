import 'package:project_management/models/article_model.dart';
import 'package:project_management/models/icons_model.dart';
import 'package:project_management/models/schadule_model.dart';

class TagsModel {
  String? id;
  String? tagTitle;
  int? tagsCount;
  List<ArticleModel>? tagArticles;
  List<ScheduleModel>? tagsSchedule;
  List<IconsModel>? tagsIcons;

  TagsModel({
    this.id,
    this.tagTitle,
    this.tagsCount,
    this.tagArticles,
    this.tagsSchedule,
    this.tagsIcons,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) {
    return TagsModel(
      id: json['id'],
      tagTitle: json['tagTitle'],
      tagsCount: json['tagsCount'],
      tagArticles: (json['tagArticles'] as List<dynamic>?)
          ?.map((item) => ArticleModel.fromJson(item))
          .toList(),
      tagsSchedule: (json['tagsSchedule'] as List<dynamic>?)
          ?.map((item) => ScheduleModel.fromJson(item))
          .toList(),
      tagsIcons: (json['tagsIcons'] as List<dynamic>?)
          ?.map((item) => IconsModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tagTitle': tagTitle,
      'tagsCount': tagsCount,
      'tagArticles': tagArticles?.map((item) => item.toJson()).toList(),
      'tagsSchedule': tagsSchedule?.map((item) => item.toJson()).toList(),
      'tagsIcons': tagsIcons?.map((item) => item.toJson()).toList(),
    };
  }
}
