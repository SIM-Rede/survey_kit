// by Antonio Bruno, Giacomo Ignesti and Massimo Martinelli

import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/result/question/double_question_result.dart';
import 'package:survey_kit/src/steps/identifier/step_identifier.dart';

part 'double_answer_format.g.dart';

@JsonSerializable()
class DoubleAnswerFormat implements AnswerFormat {
  final double? defaultValue;
  final String hint;
  final DoubleQuestionResult? savedResult;
  final bool isChildQuestion;
  final StepIdentifier? childQuestionId;

  const DoubleAnswerFormat({
    this.defaultValue,
    this.hint = '',
    this.savedResult,
    this.isChildQuestion = false,
    this.childQuestionId,
  }) : super();

  factory DoubleAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$DoubleAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$DoubleAnswerFormatToJson(this);
}
