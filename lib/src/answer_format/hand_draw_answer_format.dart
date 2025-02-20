import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/result/question/hand_draw_question_result.dart';

part 'hand_draw_answer_format.g.dart';

@JsonSerializable()
class HandDrawAnswerFormat implements AnswerFormat {
  final HandDrawQuestionResult? savedResult;
  const HandDrawAnswerFormat({this.savedResult}) : super();

  factory HandDrawAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$HandDrawAnswerFormatFromJson(json);

  Map<String, dynamic> toJson() => _$HandDrawAnswerFormatToJson(this);
}
