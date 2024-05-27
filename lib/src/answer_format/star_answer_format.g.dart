// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_answer_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarAnswerFormat _$StarAnswerFormatFromJson(Map<String, dynamic> json) =>
    StarAnswerFormat(
      defaultValue: (json['defaultValue'] as num?)?.toDouble(),
      hint: json['hint'] as String? ?? '',
    );

Map<String, dynamic> _$StarAnswerFormatToJson(StarAnswerFormat instance) =>
    <String, dynamic>{
      'defaultValue': instance.defaultValue,
      'hint': instance.hint,
    };
