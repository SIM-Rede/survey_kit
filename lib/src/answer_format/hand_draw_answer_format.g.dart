// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hand_draw_answer_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandDrawAnswerFormat _$HandDrawAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    HandDrawAnswerFormat(
      savedResult: json['savedResult'] == null
          ? null
          : HandDrawQuestionResult.fromJson(
              json['savedResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HandDrawAnswerFormatToJson(
        HandDrawAnswerFormat instance) =>
    <String, dynamic>{
      'savedResult': instance.savedResult,
    };
