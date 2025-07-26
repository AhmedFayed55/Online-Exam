import 'package:json_annotation/json_annotation.dart';
import 'metadata.dart';
import 'subject.dart';
part 'subjects_dto.g.dart';

@JsonSerializable()
class SubjectsDto {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'metadata')
  final MetaData? metadata;
  @JsonKey(name: 'subjects')
  final List<Subject>? subjects;

  SubjectsDto({this.message, this.metadata, this.subjects});

  factory SubjectsDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectsDtoToJson(this);
}
