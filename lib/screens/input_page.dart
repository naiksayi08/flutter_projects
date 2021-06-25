import 'dart:ui';

import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/logic/bmi_calculator.dart';
import 'package:bmi_calculator/model/result_page_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      containerChild: IconContent(
                        iconNew: FontAwesomeIcons.mars,
                        textNew: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      containerChild: IconContent(
                        iconNew: FontAwesomeIcons.venus,
                        textNew: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              kSliderNumberSuffix,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Color(0xFFEB1555),
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x1fEB1555),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 14,
                              ),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25)),
                          child: Slider(
                            min: 100,
                            max: 220,
                            value: height.toDouble(),
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    containerChild: weightAndAge(
                      'WEIGHT',
                      weight.toString(),
                      RoundIconButton(
                        iconData: FontAwesomeIcons.minus,
                        action: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      RoundIconButton(
                        iconData: FontAwesomeIcons.plus,
                        action: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    containerChild: weightAndAge(
                      'AGE',
                      age.toString(),
                      RoundIconButton(
                        iconData: FontAwesomeIcons.minus,
                        action: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      RoundIconButton(
                        iconData: FontAwesomeIcons.plus,
                        action: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            action: () {
              BmiCalculator calc = BmiCalculator(
                height: height,
                weight: weight,
              );
              Navigator.pushNamed(
                context,
                '/result',
                arguments: {
                  'resultValue': calc.calculateBmi(),
                  'resultLabel': calc.getResultText(),
                  'resultDesc': calc.getInterpretationText(),
                },
                // arguments: ResultPageArguments(
                //   resultValue: calc.calculateBmi(),
                //   resultLabel: calc.getResultText(),
                //   resultDesc: calc.getInterpretationText(),
                // ),
              );
            },
          ),
        ],
      ),
    );
  }

  Column weightAndAge(
      String label,
      String value,
      RoundIconButton roundIconButtonMinus,
      RoundIconButton roundIconButtonPlus) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          value,
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            roundIconButtonMinus,
            SizedBox(
              width: 10,
            ),
            roundIconButtonPlus,
          ],
        )
      ],
    );
  }
}
