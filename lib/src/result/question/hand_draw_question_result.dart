import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/result/question_result.dart';
import 'package:survey_kit/src/steps/identifier/identifier.dart';

part 'hand_draw_question_result.g.dart';

@JsonSerializable(explicitToJson: true)
class HandDrawQuestionResult extends QuestionResult<List<String>?> {
  HandDrawQuestionResult({
    required Identifier id,
    required DateTime startDate,
    required DateTime endDate,
    required String valueIdentifier,
    required List<String>? result,
  }) : super(
          id: id,
          startDate: startDate,
          endDate: endDate,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory HandDrawQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$HandDrawQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$HandDrawQuestionResultToJson(this);

  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];
}
