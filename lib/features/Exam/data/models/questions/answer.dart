import 'package:json_annotation/json_annotation.dart';
part 'answer.g.dart';

@JsonSerializable()
class Answer {
  @JsonKey(name: 'answer')
  final String? answer;
  @JsonKey(name: 'key')
  final String? key;
  Answer({required this.answer, required this.key});
  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
