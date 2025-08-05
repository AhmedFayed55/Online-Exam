import 'package:json_annotation/json_annotation.dart';

import 'exams_dto.dart';
import 'meta_data_dto.dart';

part 'get_exams_on_subject_dto.g.dart';

@JsonSerializable()
class GetExamsOnSubjectDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "exams")
  final List<ExamsDto>? exams;

  GetExamsOnSubjectDto({this.message, this.metadata, this.exams});

  factory GetExamsOnSubjectDto.fromJson(Map<String, dynamic> json) {
    return _$GetExamsOnSubjectDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetExamsOnSubjectDtoToJson(this);
  }
}
