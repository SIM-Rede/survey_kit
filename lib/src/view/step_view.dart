import 'package:flutter/material.dart' hide Step;
import 'package:provider/provider.dart';
import 'package:survey_kit/src/configuration/survey_configuration.dart';
import 'package:survey_kit/survey_kit.dart';

class StepView extends StatefulWidget {
  final Step step;
  final Widget child;
  final StepResult Function()? resultFunction;
  final bool isValid;
  final SurveyController? controller;

  const StepView({
    super.key,
    required this.step,
    required this.child,
    this.resultFunction,
    this.controller,
    this.isValid = true,
  });

  @override
  State<StepView> createState() => _StepViewState();
}

class _StepViewState extends State<StepView> {
  final startTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _surveyController =
        widget.controller ?? SurveyConfiguration.of(context).surveyController;

    return _content(_surveyController, context);
  }

  Widget _content(SurveyController surveyController, BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        color: Theme.of(context).colorScheme.background,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.child,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: OutlinedButton(
                  onPressed: widget.isValid || !widget.step.isMandatory
                      ? () => surveyController.nextStep(
                            context,
                            widget.resultFunction ??
                                () {
                                  return StepResult<void>(
                                    id: widget.step.id,
                                    result: null,
                                    endTime: DateTime.now(),
                                    startTime: startTime,
                                  );
                                },
                          )
                      : null,
                  child: Text(
                    context
                            .read<Map<String, String>?>()?['next']
                            ?.toUpperCase() ??
                        'Next',
                    style: TextStyle(
                      color: widget.isValid
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}