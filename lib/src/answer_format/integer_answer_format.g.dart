// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integer_answer_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntegerAnswerFormat _$IntegerAnswerFormatFromJson(Map<String, dynamic> json) =>
    IntegerAnswerFormat(
      defaultValue: (json['defaultValue'] as num?)?.toInt(),
      hint: json['hint'] as String? ?? '',
      savedResult: json['savedResult'] == null
          ? null
          : IntegerQuestionResult.fromJson(
              json['savedResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntegerAnswerFormatToJson(
        IntegerAnswerFormat instance) =>
    <String, dynamic>{
      'defaultValue': instance.defaultValue,
      'hint': instance.hint,
      'savedResult': instance.savedResult,
    };
