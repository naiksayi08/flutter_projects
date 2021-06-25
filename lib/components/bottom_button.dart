import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.buttonText, required this.action});

  final String buttonText;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kBottomButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
