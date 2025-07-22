import 'package:flutter/material.dart';
import '../constants.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  ResultScreen({required this.bmi});

  String getResult() {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obesity';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your BMI:', style: kLabelTextStyle),
            Text(bmi.toStringAsFixed(1), style: kNumberTextStyle),
            Text(getResult(), style: kResultTextStyle),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}