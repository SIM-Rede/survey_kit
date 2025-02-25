// by Antonio Bruno, Giacomo Ignesti and Massimo Martinelli

import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/result/question/star_question_result.dart';
import 'package:survey_kit/src/steps/identifier/step_identifier.dart';

part 'star_answer_format.g.dart';

@JsonSerializable()
class StarAnswerFormat implements AnswerFormat {
  final double? defaultValue;
  final String hint;

  final StarQuestionResult? savedResult;
  final bool isChildQuestion;
  final StepIdentifier? childQuestionId;

  const StarAnswerFormat({
    this.defaultValue,
    this.hint = '',
    this.savedResult,
    this.isChildQuestion = false,
    this.childQuestionId,
  }) : super();

  factory StarAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$StarAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$StarAnswerFormatToJson(this);
}
