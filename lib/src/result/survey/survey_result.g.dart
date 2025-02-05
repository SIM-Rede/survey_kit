// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyResult _$SurveyResultFromJson(Map<String, dynamic> json) => SurveyResult(
      id: json['id'] == null
          ? null
          : Identifier.fromJson(json['id'] as Map<String, dynamic>),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      finishReason: $enumDecode(_$FinishReasonEnumMap, json['finishReason']),
      results: (json['results'] as List<dynamic>)
          .map((e) => StepResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      startExecution: DateTime.parse(json['startExecution'] as String),
      endExecution: DateTime.parse(json['endExecution'] as String),
      lastQuestionId: json['lastQuestionId'] as String?,
    );

Map<String, dynamic> _$SurveyResultToJson(SurveyResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'finishReason': _$FinishReasonEnumMap[instance.finishReason]!,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'startExecution': instance.startExecution.toIso8601String(),
      'endExecution': instance.endExecution.toIso8601String(),
      'lastQuestionId': instance.lastQuestionId,
    };

const _$FinishReasonEnumMap = {
  FinishReason.SAVED: 'SAVED',
  FinishReason.DISCARDED: 'DISCARDED',
  FinishReason.COMPLETED: 'COMPLETED',
  FinishReason.FAILED: 'FAILED',
};
