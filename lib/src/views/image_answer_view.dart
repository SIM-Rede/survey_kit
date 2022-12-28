import 'package:flutter/material.dart' hide Step;
import 'package:image_picker/image_picker.dart';
import 'package:survey_kit/src/_new/model/answer/image_answer_format.dart';
import 'package:survey_kit/src/_new/model/result/step_result.dart';
import 'package:survey_kit/src/_new/model/step.dart';
import 'package:survey_kit/src/_new/view/content/content_widget.dart';
import 'package:survey_kit/src/_new/view/step_view.dart';

class ImageAnswerView extends StatefulWidget {
  final Step questionStep;
  final StepResult? result;

  const ImageAnswerView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  State<ImageAnswerView> createState() => _ImageAnswerViewState();
}

class _ImageAnswerViewState extends State<ImageAnswerView> {
  late final ImageAnswerFormat _imageAnswerFormat;
  late final DateTime _startDate;

  final bool _isValid = false;
  String filePath = '';

  @override
  void initState() {
    super.initState();
    _imageAnswerFormat = widget.questionStep.answer as ImageAnswerFormat;
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
      resultFunction: () => StepResult<String>(
        id: widget.questionStep.id,
        startTime: _startDate,
        endTime: DateTime.now(),
        valueIdentifier: filePath,
        result: filePath,
      ),
      isValid: _isValid || !widget.questionStep.isMandatory,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ContentWidget(
                content: widget.questionStep.content,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _optionsDialogBox,
                      child: Text(_imageAnswerFormat.buttonText),
                    ),
                    if (filePath.isNotEmpty)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            filePath.split('/')[filePath.split('/').length - 1],
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: _openCamera,
                  child: const Text('Take a picture'),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  onTap: _openGallery,
                  child: const Text('Select from Gallery'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _openCamera() async {
    final picture = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    Navigator.pop(context);

    await picture?.readAsBytes().then((value) {
      setState(() {
        filePath = picture.path;
      });
    });
  }

  Future<void> _openGallery() async {
    final picture = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    Navigator.pop(context);

    await picture?.readAsBytes().then((value) {
      setState(() {
        filePath = picture.path;
      });
    });
  }
}