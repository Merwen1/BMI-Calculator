import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.resultString,
      required this.resultBMI,
      required this.resultInterpretation});

  final String resultString;
  final String resultBMI;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: KTitleTextStyle,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: ReusableCard(
            KActiveCardColor,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resultString.toUpperCase(),
                  style: KResultsTextStyle,
                ),
                Text(
                  resultBMI,
                  style: KBMITextStyle,
                ),
                Text(
                  resultInterpretation,
                  style: KBodyTextStyle,
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Bottom_Button(
                buttonName: 'Re-Calculate',
                ontapFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => InputPage()));
                }))
      ]),
    );
  }
}
