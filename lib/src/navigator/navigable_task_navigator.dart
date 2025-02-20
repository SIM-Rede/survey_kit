import 'package:survey_kit/src/navigator/rules/conditional_navigation_rule.dart';
import 'package:survey_kit/src/navigator/rules/direct_navigation_rule.dart';
import 'package:survey_kit/src/navigator/rules/navigation_rule.dart';
import 'package:survey_kit/src/navigator/task_navigator.dart';
import 'package:survey_kit/src/result/question_result.dart';
import 'package:survey_kit/src/steps/step.dart';
import 'package:survey_kit/src/task/navigable_task.dart';
import 'package:survey_kit/src/task/task.dart';

class NavigableTaskNavigator extends TaskNavigator {
  NavigableTaskNavigator(Task task) : super(task);

  @override
  Step? nextStep({required Step step, QuestionResult? questionResult}) {
    record(step);
    final navigableTask = task as NavigableTask;
    NavigationRule? rule =
        navigableTask.getRuleByStepIdentifier(step.stepIdentifier);
    if (rule == null) {
      return nextInList(step);
    }
    switch (rule.runtimeType) {
      case DirectNavigationRule:
        return task.steps.firstWhere(
          (element) =>
              element.stepIdentifier ==
              (rule as DirectNavigationRule).destinationStepIdentifier,
        );
      case ConditionalNavigationRule:
        return evaluateNextStep(
          step,
          rule as ConditionalNavigationRule,
          questionResult,
        );
    }
    return nextInList(step);
  }

  @override
  Step? previousInList(Step? step) {
    if (history.isEmpty) {
      return null;
    }
    return history.removeLast();
  }

  Step? evaluateNextStep(
    Step? step,
    ConditionalNavigationRule rule,
    QuestionResult<dynamic>? questionResult,
  ) {
    if (questionResult == null) {
      return nextInList(step);
    }
    final nextStepIdentifier =
        rule.resultToStepIdentifierMapper(questionResult.valueIdentifier);
    if (nextStepIdentifier == null) {
      return nextInList(step);
    }
    return task.steps
        .firstWhere((element) => element.stepIdentifier == nextStepIdentifier);
  }

  @override
  Step? firstStep() {
    final previousStep = peekHistory();
    if (previousStep != null) {
      return nextStep(step: previousStep, questionResult: null);
    } else {
      if (task.initalStep != null) {
        return task.initalStep;
      } else if (task.initalStepIdentifier != null) {
        Step? returnedStep;
        for (final step in task.steps) {
          if (step.stepIdentifier == task.initalStepIdentifier) {
            returnedStep = step;
          }
        }
        if (returnedStep != null) {
          return returnedStep;
        } else {
          throw new StateError(
              'Step with provided StepIdentifier was not found.');
        }
      }
    }
    return task.steps.first;
  }
}
