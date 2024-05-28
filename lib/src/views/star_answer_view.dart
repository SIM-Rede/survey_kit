import 'package:flutter/material.dart';
import 'package:survey_kit/src/answer_format/star_answer_format.dart';
import 'package:survey_kit/src/result/question/star_question_result.dart';
import 'package:survey_kit/src/steps/predefined_steps/question_step.dart';
import 'package:survey_kit/src/views/widget/step_view.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    double currentRating = rating - index;

    if (currentRating >= 1) {
      icon = Icon(
        Icons.star,
        size: 40,
        color: color ?? Colors.amber,
      );
    } else if (currentRating >= 0.5) {
      icon = Icon(
        Icons.star_half,
        size: 40,
        color: color ?? Colors.amber,
      );
    } else {
      icon = Icon(
        Icons.star_border,
        size: 40,
        color: color ?? Colors.amber,
      );
    }

    return InkResponse(
      onTap: onRatingChanged == null
          ? null
          : () {
              double newRating = index + 0.5;
              if (rating == newRating) {
                newRating = index + 1.0;
              } else if (rating == index + 1.0) {
                newRating = 0.0;
              }
              onRatingChanged!(newRating);
            },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }
}

class StarAnswerView extends StatefulWidget {
  final QuestionStep questionStep;
  final StarQuestionResult? result;

  const StarAnswerView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  _StarAnswerViewState createState() => _StarAnswerViewState();
}

class _StarAnswerViewState extends State<StarAnswerView> {
  late final StarAnswerFormat _starAnswerFormat;
  late final DateTime _startDate;

  double rating = 0;

  bool _isValid = false;

  @override
  void initState() {
    if (widget.result != null && widget.result?.result != null) {
      this.rating = widget.result!.result!.toDouble() / 2;
    }
    super.initState();
    _starAnswerFormat = widget.questionStep.answerFormat as StarAnswerFormat;
    _startDate = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: widget.questionStep,
      resultFunction: () => StarQuestionResult(
        id: widget.questionStep.stepIdentifier,
        startDate: _startDate,
        endDate: DateTime.now(),
        valueIdentifier: rating.toString(),
        result: (rating * 2).toInt(),
      ),
      title: widget.questionStep.title.isNotEmpty
          ? Text(
              widget.questionStep.title,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            )
          : widget.questionStep.content,
      isValid: _isValid || widget.questionStep.isOptional,
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              StarRating(
                rating: rating,
                onRatingChanged: (rating) {
                  setState(() => this.rating = rating);
                },
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 16),
          Text(
            (rating * 2).toInt().toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
