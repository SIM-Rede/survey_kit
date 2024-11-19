import 'package:survey_kit/src/steps/identifier/identifier.dart';
import 'package:survey_kit/src/result/question_result.dart';

import 'package:json_annotation/json_annotation.dart';

part 'star_question_result.g.dart';

@JsonSerializable(explicitToJson: true)
class StarQuestionResult extends QuestionResult<int?> {
  StarQuestionResult({
    required Identifier id,
    required DateTime startDate,
    required DateTime endDate,
    required String? valueIdentifier,
    required int? result,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: valueIdentifier ?? '0',
          result: result,
        );

  factory StarQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$StarQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$StarQuestionResultToJson(this);

  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];
}
