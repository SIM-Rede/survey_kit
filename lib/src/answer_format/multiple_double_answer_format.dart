import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/answer_format/multi_double.dart';
import 'package:survey_kit/src/result/question/multiple_double_question_result.dart';
import 'package:survey_kit/src/steps/identifier/step_identifier.dart';

part 'multiple_double_answer_format.g.dart';

@JsonSerializable()
class MultipleDoubleAnswerFormat implements AnswerFormat {
  final List<MultiDouble>? defaultValue;
  @JsonKey(defaultValue: const [])
  final List<String> hints;

  final MultipleDoubleQuestionResult? savedResult;
  final bool isChildQuestion;
  final StepIdentifier? childQuestionId;

  const MultipleDoubleAnswerFormat({
    this.defaultValue,
    required this.hints,
    this.savedResult,
    this.isChildQuestion = false,
    this.childQuestionId,
  }) : super();

  factory MultipleDoubleAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$MultipleDoubleAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$MultipleDoubleAnswerFormatToJson(this);
}
