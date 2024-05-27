// by Antonio Bruno, Giacomo Ignesti and Massimo Martinelli

import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';

part 'star_answer_format.g.dart';

@JsonSerializable()
class StarAnswerFormat implements AnswerFormat {
  final double? defaultValue;
  final String hint;

  const StarAnswerFormat({
    this.defaultValue,
    this.hint = '',
  }) : super();

  factory StarAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$StarAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$StarAnswerFormatToJson(this);
}
