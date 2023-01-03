import 'package:flutter/material.dart' hide Step;
import 'package:survey_kit/src/view/answer/boolean_answer_view.dart';
import 'package:survey_kit/src/view/answer/multiple_choice_auto_complete_answer_view.dart';
import 'package:survey_kit/src/view/content/content_widget.dart';
import 'package:survey_kit/src/view/step_view.dart';
import 'package:survey_kit/survey_kit.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({
    super.key,
    required this.answer,
    required this.step,
    required this.stepResult,
  });
  final AnswerFormat? answer;

  final Step step;
  final StepResult? stepResult;

  @override
  Widget build(BuildContext context) {
    if (answer == null) {
      return StepView(
        step: step,
        child: ContentWidget(
          content: step.content,
        ),
      );
    }

    return _buildAnswerView();
  }

  Widget _buildAnswerView() {
    switch (answer.runtimeType) {
      case MultipleChoiceAnswerFormat:
        return MultipleChoiceAnswerView(
          questionStep: step,
          result: stepResult as StepResult<List<Option>>?,
        );
      case IntegerAnswerFormat:
        return IntegerAnswerView(
          questionStep: step,
          result: stepResult as StepResult<int>?,
        );
      case BooleanAnswerFormat:
        return BooleanAnswerView(
          questionStep: step,
          result: stepResult as StepResult<BooleanResult>?,
        );
      case DateAnswerFormat:
        return DateAnswerView(
          questionStep: step,
          result: stepResult as StepResult<DateTime?>?,
        );
      case DoubleAnswerFormat:
        return DoubleAnswerView(
          questionStep: step,
          result: stepResult as StepResult<double>?,
        );
      case ImageAnswerFormat:
        return ImageAnswerView(
          questionStep: step,
          result: stepResult as StepResult<String>?,
        );
      case MultipleChoiceAutoCompleteAnswerFormat:
        return MultipleChoiceAutoCompleteAnswerView(
          questionStep: step,
          result: stepResult as StepResult<List<Option>>?,
        );
      case ScaleAnswerFormat:
        return ScaleAnswerView(
          questionStep: step,
          result: stepResult as StepResult<double>?,
        );
      case SingleChoiceAnswerFormat:
        return SingleChoiceAnswerView(
          questionStep: step,
          result: stepResult as StepResult<Option>?,
        );
      case TextAnswerFormat:
        return TextAnswerView(
          questionStep: step,
          result: stepResult as StepResult<String>?,
        );
      default:
        throw Exception('Answer type not supported: ${answer.runtimeType}');
    }
  }
}
