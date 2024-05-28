// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_answer_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageAnswerFormat _$ImageAnswerFormatFromJson(Map<String, dynamic> json) =>
    ImageAnswerFormat(
      defaultValue: json['defaultValue'] as String?,
      buttonText: json['buttonText'] as String? ?? 'Image: ',
      useCamera: json['useCamera'] as bool? ?? true,
      useGallery: json['useGallery'] as bool? ?? true,
      hintImage: json['hintImage'] as String?,
      hintTitle: json['hintTitle'] as String?,
    );

Map<String, dynamic> _$ImageAnswerFormatToJson(ImageAnswerFormat instance) =>
    <String, dynamic>{
      'defaultValue': instance.defaultValue,
      'buttonText': instance.buttonText,
      'useCamera': instance.useCamera,
      'useGallery': instance.useGallery,
      'hintImage': instance.hintImage,
      'hintTitle': instance.hintTitle,
    };
