import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';

part 'hand_draw_answer_format.g.dart';

@JsonSerializable()
class HandDrawAnswerFormat implements AnswerFormat {
  const HandDrawAnswerFormat() : super();

  factory HandDrawAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$HandDrawAnswerFormatFromJson(json);

  Map<String, dynamic> toJson() => _$HandDrawAnswerFormatToJson(this);
}
