import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var display = ''.obs;
  String _operator = '';
  double? _firstOperand;
  double? _secondOperand;

  void onButtonPressed(String label) {
    if (label == 'C') {
      // Clear everything
      display.value = '';
      _firstOperand = null;
      _secondOperand = null;
      _operator = '';
    } else if (label == '+' || label == '–' || label == '×' || label == '÷') {
      bool hasOperator = display.value.contains('+') || display.value.contains('–') || display.value.contains('×') || display.value.contains('÷');
      if (display.value.isNotEmpty && !hasOperator) {
        // Set first operand and operator
        _firstOperand = double.tryParse(display.value);
        _operator = label;
        display.value += label; // Append operator to display
      }
    } else if (label == '=') {
      if (_firstOperand != null && _operator.isNotEmpty) {
        // Extract the second operand from the display (after the operator)
        String secondOperandString =
            display.value.split(_operator).last.trim();
        _secondOperand = double.tryParse(secondOperandString);

        if (_secondOperand != null) {
          // Update display with result
          display.value = _calculateResult();
          _firstOperand = null;
        } else {
          display.value = 'Error';
        }
      }
    } else {
      // Append numbers/dot to display
      display.value += label;
    }
  }

  String _calculateResult() {
    switch (_operator) {
      case '+':
        return (_firstOperand! + _secondOperand!).toString();
      case '–':
        return (_firstOperand! - _secondOperand!).toString();
      case '×':
        return (_firstOperand! * _secondOperand!).toString();
      case '÷':
        return _secondOperand == 0
            ? 'Undefined'
            : (_firstOperand! / _secondOperand!).toString();
      default:
        return 'Error';
    }
  }
}
