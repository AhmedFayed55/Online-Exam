import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  Subject({this.id, this.name, this.icon, this.createdAt});

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  SubjectEntity toEntity() =>
      SubjectEntity(id: id, name: name, image: icon, createdAt: createdAt);
}
