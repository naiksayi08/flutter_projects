import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({required this.iconNew, required this.textNew});

  final IconData iconNew;
  final String textNew;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconNew,
          size: 80,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          textNew,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
