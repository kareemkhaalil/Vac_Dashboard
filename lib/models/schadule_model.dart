import 'package:project_management/models/icons_model.dart';
import 'package:project_management/models/tags_model.dart';

class ScheduleModel {
  String? id;
  String? scheduleTitle;
  String? scheduleTime;
  List<TagsModel>? scheduleTags;
  IconsModel? scheduleIcon;

  ScheduleModel({
    this.id,
    this.scheduleTitle,
    this.scheduleTime,
    this.scheduleTags,
    this.scheduleIcon,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'],
      scheduleTitle: json['scheduleTitle'],
      scheduleTime: json['scheduleTime'],
      scheduleTags: (json['scheduleTags'] as List<dynamic>?)
          ?.map((item) => TagsModel.fromJson(item))
          .toList(),
      scheduleIcon: IconsModel.fromJson(json['scheduleIcon']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'scheduleTitle': scheduleTitle,
      'scheduleTime': scheduleTime,
      'scheduleTags': scheduleTags?.map((item) => item.toJson()).toList(),
      'scheduleIcon': scheduleIcon?.toJson(),
    };
  }
}
