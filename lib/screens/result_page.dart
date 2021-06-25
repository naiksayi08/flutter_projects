import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/model/result_page_arguments.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  // const ResultPage(
  //     {required this.resultLabel,
  //     required this.resultValue,
  //     required this.resultDesc});
  //
  // final String resultLabel;
  // final String resultValue;
  // final String resultDesc;

  @override
  Widget build(BuildContext context) {
    // final ResultPageArguments resultArgs =
    //     ModalRoute.of(context)!.settings.arguments as ResultPageArguments;

    final Map resultArgs = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI RESULT',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kNumberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              containerChild: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      //resultArgs.resultLabel,
                      resultArgs['resultLabel'],
                      style: kResultMessageTextStyle,
                    ),
                    Text(
                      //resultArgs.resultValue,
                      resultArgs['resultValue'],
                      style: kNumberTextStyle,
                    ),
                    Text(
                      //resultArgs.resultDesc,
                      resultArgs['resultDesc'],
                      style: kResultDescriptionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            action: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
