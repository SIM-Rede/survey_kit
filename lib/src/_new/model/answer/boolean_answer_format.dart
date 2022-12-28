import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/_new/model/answer/answer.dart';

part 'boolean_answer_format.g.dart';

@JsonSerializable()
class BooleanAnswerFormat implements Answer {
  static const String type = 'bool';

  final String positiveAnswer;
  final String negativeAnswer;
  final BooleanResult result;

  const BooleanAnswerFormat({
    required this.positiveAnswer,
    required this.negativeAnswer,
    this.result = BooleanResult.none,
  }) : super();

  factory BooleanAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$BooleanAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$BooleanAnswerFormatToJson(this);
}

enum BooleanResult { none, positive, negative }