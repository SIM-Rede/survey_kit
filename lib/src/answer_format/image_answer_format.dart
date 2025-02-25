import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/result/question/image_question_result.dart';
import 'package:survey_kit/src/steps/identifier/step_identifier.dart';

part 'image_answer_format.g.dart';

@JsonSerializable()
class ImageAnswerFormat implements AnswerFormat {
  final String? defaultValue;
  final ImageQuestionResult? savedResult;
  final String buttonText;
  final bool useCamera;
  final bool useGallery;
  final String? hintImage;
  final String? hintTitle;

  final bool isChildQuestion;
  final StepIdentifier? childQuestionId;

  const ImageAnswerFormat({
    this.defaultValue,
    this.buttonText = 'Image: ',
    this.useCamera = true,
    this.useGallery = true,
    this.hintImage,
    this.hintTitle,
    this.savedResult,
    this.isChildQuestion = false,
    this.childQuestionId,
  }) : super();

  factory ImageAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$ImageAnswerFormatFromJson(json);

  Map<String, dynamic> toJson() => _$ImageAnswerFormatToJson(this);
}
