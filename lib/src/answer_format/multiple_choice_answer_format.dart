import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/answer_format/text_choice.dart';
import 'package:survey_kit/src/result/question/multiple_choice_question_result.dart';
import 'package:survey_kit/src/steps/identifier/step_identifier.dart';

part 'multiple_choice_answer_format.g.dart';

@JsonSerializable()
class MultipleChoiceAnswerFormat implements AnswerFormat {
  final List<TextChoice> textChoices;
  @JsonKey(defaultValue: const [])
  final List<TextChoice> defaultValue;
  MultipleChoiceQuestionResult? savedResult;
  @JsonKey(defaultValue: false)
  final bool otherField;
  @JsonKey(defaultValue: 100)
  final int maxAnswers;

  final bool isChildQuestion;
  final StepIdentifier? childQuestionId;

  MultipleChoiceAnswerFormat({
    required this.textChoices,
    this.defaultValue = const [],
    this.otherField = false,
    this.maxAnswers = 100,
    this.savedResult,
    this.isChildQuestion = false,
    this.childQuestionId,
  }) : super();

  factory MultipleChoiceAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$MultipleChoiceAnswerFormatToJson(this);
}
