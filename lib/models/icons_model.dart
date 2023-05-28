import 'package:project_management/models/article_model.dart';
import 'package:project_management/models/schadule_model.dart';
import 'package:project_management/models/tags_model.dart';

class IconsModel {
  String? id;
  String? iconTitle;
  String? iconMedia;
  int? iconCount;
  List<ArticleModel>? iconArticles;
  List<ScheduleModel>? iconSchedule;
  List<TagsModel>? iconTags;

  IconsModel({
    this.id,
    this.iconTitle,
    this.iconMedia,
    this.iconCount,
    this.iconArticles,
    this.iconSchedule,
    this.iconTags,
  });

  factory IconsModel.fromJson(Map<String, dynamic> json) {
    return IconsModel(
      id: json['id'],
      iconTitle: json['iconTitle'],
      iconMedia: json['iconMedia'],
      iconCount: json['iconCount'],
      iconArticles: (json['iconArticles'] as List<dynamic>?)
          ?.map((item) => ArticleModel.fromJson(item))
          .toList(),
      iconSchedule: (json['iconSchedule'] as List<dynamic>?)
          ?.map((item) => ScheduleModel.fromJson(item))
          .toList(),
      iconTags: (json['iconTags'] as List<dynamic>?)
          ?.map((item) => TagsModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iconTitle': iconTitle,
      'iconMedia': iconMedia,
      'iconCount': iconCount,
      'iconArticles': iconArticles?.map((item) => item.toJson()).toList(),
      'iconSchedule': iconSchedule?.map((item) => item.toJson()).toList(),
      'iconTags': iconTags?.map((item) => item.toJson()).toList(),
    };
  }
}
