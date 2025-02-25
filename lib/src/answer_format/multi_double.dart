import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/survey_kit.dart';

part 'multi_double.g.dart';

@JsonSerializable()
class MultiDouble implements AnswerFormat {
  final String text;
  final double value;

  final MultipleDoubleQuestionResult? savedResult;
  final bool isChildQuestion;
  final StepIdentifier? childQuestionId;

  MultiDouble({
    required this.text,
    required this.value,
    this.savedResult,
    this.isChildQuestion = false,
    this.childQuestionId,
  }) : super();

  factory MultiDouble.fromJson(Map<String, dynamic> json) =>
      _$MultiDoubleFromJson(json);
  Map<String, dynamic> toJson() => _$MultiDoubleToJson(this);

  bool operator ==(o) => o is MultiDouble && text == o.text && value == o.value;
  int get hashCode => text.hashCode ^ value.hashCode;
}
