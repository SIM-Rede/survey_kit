import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/_new/model/answer/answer.dart';
import 'package:survey_kit/src/_new/model/answer/multi_double.dart';

part 'multiple_double_answer_format.g.dart';

@JsonSerializable()
class MultipleDoubleAnswerFormat implements Answer {
  static const String type = 'multiple_double';

  final List<MultiDouble>? defaultValues;
  @JsonKey(defaultValue: <String>[])
  final List<String> hints;

  const MultipleDoubleAnswerFormat({
    this.defaultValues,
    required this.hints,
  }) : super();

  factory MultipleDoubleAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$MultipleDoubleAnswerFormatFromJson(json);

  Map<String, dynamic> toJson() => _$MultipleDoubleAnswerFormatToJson(this);
}