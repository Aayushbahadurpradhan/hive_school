import 'package:json_annotation/json_annotation.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';

@JsonSerializable()
class CourseAPIModel {
  @JsonKey(name: '_id')
  // Server ko name lai courseId sanga map gareko
  final String? courseId;
  // J name server ma cha tei name ya lekhne
  final String courseName;

  CourseAPIModel({this.courseId, required this.courseName});

  // To Json and fromJson without freezed
  factory CourseAPIModel.fromJson(Map<String, dynamic> json) {
    return CourseAPIModel(
      courseId: json['_id'],
      courseName: json['courseName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseName': courseName,
    };
  }

  // From entity to model
  factory CourseAPIModel.fromEntity(CourseEntity entity) {
    return CourseAPIModel(
      courseId: entity.courseId,
      courseName: entity.courseName,
    );
  }

  // From model to entity
  static CourseEntity toEntity(CourseAPIModel model) {
    return CourseEntity(
      courseId: model.courseId,
      courseName: model.courseName,
    );
  }
}
