import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.interpretation,
      required this.results,
      required this.bmi});
  final String interpretation;
  final String results;
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.topLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(results, style: kResulstTextStyle),
                    Text(bmi, style: kBMITextStyle),
                    Text(interpretation,
                        style: kBodyTextStyle, textAlign: TextAlign.center),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
