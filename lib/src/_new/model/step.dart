import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/_new/model/answer/answer.dart';
import 'package:survey_kit/src/_new/model/content/content.dart';
import 'package:survey_kit/src/_new/model/module.dart';

@JsonSerializable()
class Step extends Module {
  final bool isMandatory;
  final Answer? answer;

  const Step({
    required super.id,
    required super.title,
    required super.content,
    super.description,
    super.imageUrl,
    this.isMandatory = true,
    this.answer,
  });

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
  Map<String, dynamic> toJson() => _$StepToJson(this);

  static Step _$StepFromJson(Map<String, dynamic> json) => Step(
        id: json['id'] as String,
        title: json['title'] as String,
        content: (json['content'] as List<dynamic>)
            .map((dynamic e) => Content.fromJson(e as Map<String, dynamic>))
            .toList(),
        description: json['description'] as String?,
        imageUrl: json['imageUrl'] as String?,
        isMandatory: json['isMandatory'] as bool? ?? true,
        answer: json['answer'] == null
            ? null
            : Answer.fromJson(json['answer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
        'id': instance.id,
        'title': instance.title,
        'content': instance.content,
        'description': instance.description,
        'imageUrl': instance.imageUrl,
        'isMandatory': instance.isMandatory,
        'answer': instance.answer,
      };
}