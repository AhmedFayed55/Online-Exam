import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/subject_exams/domain/entities/exams_on_subject_entity.dart';

part 'exams_dto.g.dart';

@JsonSerializable()
class ExamsDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  ExamsDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamsDto.fromJson(Map<String, dynamic> json) {
    return _$ExamsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsDtoToJson(this);
  }

  ExamsEntity toEntity() {
    return ExamsEntity(
      id: id,
      active: active,
      duration: duration,
      numberOfQuestions: numberOfQuestions,
      subject: subject,
      title: title,
    );
  }
}
