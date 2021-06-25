import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.iconData, required this.action});

  final IconData iconData;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => action(),
      child: Icon(iconData),
      fillColor: kRoundIconColor,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
