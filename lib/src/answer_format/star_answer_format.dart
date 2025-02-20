// by Antonio Bruno, Giacomo Ignesti and Massimo Martinelli

import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/result/question/star_question_result.dart';

part 'star_answer_format.g.dart';

@JsonSerializable()
class StarAnswerFormat implements AnswerFormat {
  final double? defaultValue;
  final String hint;
  final StarQuestionResult? savedResult;

  const StarAnswerFormat({
    this.defaultValue,
    this.hint = '',
    this.savedResult,
  }) : super();

  factory StarAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$StarAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$StarAnswerFormatToJson(this);
}
