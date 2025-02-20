import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/src/answer_format/answer_format.dart';
import 'package:survey_kit/src/result/question/date_question_result.dart';

part 'date_answer_format.g.dart';

@JsonSerializable()
class DateAnswerFormat implements AnswerFormat {
  /// Default date which will be preselected on datepicker opening
  final DateTime? defaultValue;

  /// Lowest date which can be selected via the datepicker
  final DateTime? minDate;

  /// Highest date which can be selected via the datepicker
  final DateTime? maxDate;

  final DateQuestionResult? savedResult;

  DateAnswerFormat({
    this.defaultValue,
    this.minDate,
    this.maxDate,
    this.savedResult,
  })  : assert(minDate == null || maxDate == null || minDate.isBefore(maxDate)),
        assert(defaultValue == null ||
            minDate == null ||
            defaultValue.isAtSameMomentAs(minDate) ||
            defaultValue.isAfter(minDate)),
        assert(defaultValue == null ||
            maxDate == null ||
            defaultValue.isAtSameMomentAs(maxDate) ||
            defaultValue.isBefore(maxDate)),
        super();

  factory DateAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$DateAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$DateAnswerFormatToJson(this);
}
