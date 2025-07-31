import 'package:json_annotation/json_annotation.dart';
part 'answer_input_model.g.dart';

@JsonSerializable()
class UserAnswerInptModel {
  @JsonKey(name: 'answers')
  final List<UserAnswerInptModel>? answers;
  @JsonKey(name: 'time')
  final int? time;

  UserAnswerInptModel({this.answers, this.time});
  Map<String, dynamic> toJson() => _$UserAnswerInptModelToJson(this);
}
