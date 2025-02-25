import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/result/question/text_question_result.dart';
import 'package:survey_kit/src/steps/identifier/step_identifier.dart';

part 'text_answer_format.g.dart';

@JsonSerializable()
class TextAnswerFormat implements AnswerFormat {
  final int? maxLines;
  @JsonKey(defaultValue: '')
  final String hint;

  final TextQuestionResult? savedResult;
  final bool isChildQuestion;
  final StepIdentifier? childQuestionId;

  /// Regular expression by which the text gets validated
  /// default: '^(?!\s*$).+' that checks if the entered text is empty
  /// to allow any type of an answer including an empty one;
  /// set it explicitly to null.
  ///
  @JsonKey(defaultValue: '^(?!\s*\$).+')
  final String? validationRegEx;

  const TextAnswerFormat({
    this.maxLines,
    this.hint = '',
    this.validationRegEx = '^(?!\s*\$).+',
    this.savedResult,
    this.isChildQuestion = false,
    this.childQuestionId,
  }) : super();

  factory TextAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$TextAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$TextAnswerFormatToJson(this);
}
