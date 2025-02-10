import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/result/question/scale_question_result.dart';

part 'scale_answer_format.g.dart';

@JsonSerializable()
class ScaleAnswerFormat implements AnswerFormat {
  final double maximumValue;
  final double minimumValue;
  final double defaultValue;
  final double step;
  final String maximumValueDescription;
  final String minimumValueDescription;
  final ScaleQuestionResult? savedResult;

  const ScaleAnswerFormat(
      {required this.maximumValue,
      required this.minimumValue,
      required this.defaultValue,
      required this.step,
      this.maximumValueDescription = '',
      this.minimumValueDescription = '',
      this.savedResult})
      : super();

  factory ScaleAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$ScaleAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$ScaleAnswerFormatToJson(this);
}
