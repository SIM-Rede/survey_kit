// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hand_draw_question_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandDrawQuestionResult _$HandDrawQuestionResultFromJson(
        Map<String, dynamic> json) =>
    HandDrawQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      valueIdentifier: json['valueIdentifier'] as String,
      result: json['result'] == null
          ? null
          : HandDrawQuestionSignatureResult.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HandDrawQuestionResultToJson(
        HandDrawQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'result': instance.result?.toJson(),
      'valueIdentifier': instance.valueIdentifier,
    };

HandDrawQuestionSignatureResult _$HandDrawQuestionSignatureResultFromJson(
        Map<String, dynamic> json) =>
    HandDrawQuestionSignatureResult(
      name: json['name'] as String,
      signatureImageUrl: json['signatureImageUrl'] as String,
    );

Map<String, dynamic> _$HandDrawQuestionSignatureResultToJson(
        HandDrawQuestionSignatureResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'signatureImageUrl': instance.signatureImageUrl,
    };
