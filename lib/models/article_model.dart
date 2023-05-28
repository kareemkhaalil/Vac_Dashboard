import 'package:project_management/models/icons_model.dart';
import 'package:project_management/models/tags_model.dart';

class ArticleModel {
  String? id;
  String? articleTitle;
  String? articleContent;
  int? articlesCount;
  List<TagsModel>? articleTags;
  IconsModel? articlesIcon;

  ArticleModel({
    this.id,
    this.articleTitle,
    this.articleContent,
    this.articlesCount,
    this.articleTags,
    this.articlesIcon,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      articleTitle: json['articleTitle'],
      articleContent: json['articleContent'],
      articlesCount: json['articlesCount'],
      articleTags: (json['articleTags'] as List<dynamic>?)
          ?.map((item) => TagsModel.fromJson(item))
          .toList(),
      articlesIcon: IconsModel.fromJson(json['articlesIcon']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'articleTitle': articleTitle,
      'articleContent': articleContent,
      'articlesCount': articlesCount,
      'articleTags': articleTags?.map((item) => item.toJson()).toList(),
      'articlesIcon': articlesIcon?.toJson(),
    };
  }
}
