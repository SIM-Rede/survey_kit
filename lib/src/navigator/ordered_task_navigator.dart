import 'package:survey_kit/src/navigator/task_navigator.dart';
import 'package:survey_kit/src/result/question_result.dart';
import 'package:survey_kit/src/steps/step.dart';
import 'package:survey_kit/src/task/task.dart';

class OrderedTaskNavigator extends TaskNavigator {
  OrderedTaskNavigator(Task task) : super(task);

  @override
  Step? nextStep({required Step step, QuestionResult? questionResult}) {
    record(step);
    return nextInList(step);
  }

  @override
  Step? previousInList(Step step) {
    final currentIndex = task.steps
        .indexWhere((element) => element.stepIdentifier == step.stepIdentifier);
    return (currentIndex - 1 < 0) ? null : task.steps[currentIndex - 1];
  }

  @override
  Step? firstStep() {
    final previousStep = peekHistory();

    if (previousStep != null) {
      return nextInList(previousStep);
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
