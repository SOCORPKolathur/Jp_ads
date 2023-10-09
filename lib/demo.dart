
import 'package:flutter/material.dart';

class HorizontalStepper extends StatefulWidget {
  @override
  _HorizontalStepperState createState() => _HorizontalStepperState();
}

class _HorizontalStepperState extends State<HorizontalStepper> {
  int _currentStep = 0;
  List<String> _stepTitles = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        Stepper(

          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            setState(() {
              if (_currentStep < _stepTitles.length - 1) {
                _currentStep += 1;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep -= 1;
              }
            });
          },
          steps: _stepTitles.map((title) {
            int stepIndex = _stepTitles.indexOf(title);
            return Step(
              title: Text(title),
              content: Container(
                alignment: Alignment.centerLeft,
                child: Text('This is content for $title.'),
              ),
              isActive: _currentStep == stepIndex,
            );
          }).toList(),
        ),
      );
  }
}