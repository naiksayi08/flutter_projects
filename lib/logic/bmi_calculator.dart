import 'dart:math';

class BmiCalculator {
  BmiCalculator({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0.0;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretationText() {
    if (_bmi >= 25) {
      return 'Your BMI is more than the normal. Please do exercise.';
    } else if (_bmi > 18) {
      return 'Your BMI is normal. Well done.';
    } else {
      return 'Your BMI is less than the normal. Please do eat.';
    }
  }
}
