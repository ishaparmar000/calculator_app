import 'dart:math';

import 'package:get/get.dart';

import '../model/calc_history_model.dart';
import '../utils/db_helper.dart';

class DisplayController extends GetxController {

  DBHelper dbHelper = DBHelper();
  RxList<CalculationHistoryModel>historyList = <CalculationHistoryModel>[].obs;

  RxString expression = ''.obs;
  RxString displayValue = '0'.obs;
  RxString previewResult = ''.obs;
  RxDouble firstOperand = 0.0.obs;
  RxString currentOperator = ''.obs;
  RxBool shouldReset = false.obs;

  String formatNumber(double val) {
    if (val == val.truncateToDouble() && !val.isInfinite) {
      return addCommasSeparator(val.toInt().toString());
    }
    String s = val
        .toStringAsFixed(8)
        .replaceAll(RegExp(r'0+$'), '')
        .replaceAll(RegExp(r'\.$'), '');
    return s;
  }

  String addCommasSeparator(String intStr) {
    bool negative = intStr.startsWith('-');
    String digits = negative ? intStr.substring(1) : intStr;
    String result = '';
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) result += ',';
      result += digits[i];
    }
    return negative ? '-$result' : result;
  }

  String operatorSymbol(String op) {
    if (op == '÷') return '÷';
    if (op == '×') return '×';
    if (op == '-') return '−';
    return '+';
  }

  void updatePreview() {
    if (currentOperator.value.isEmpty || shouldReset.value) {
      previewResult.value = '';
      return;
    }
    double second =
        double.tryParse(displayValue.value.replaceAll(',', '.')) ?? 0.0;
    double result = calculate(
      firstOperand.value,
      currentOperator.value,
      second,
    );
    previewResult.value = '= ${formatNumber(result)}';
  }

  double calculate(double a, String op, double b) {
    if (op == '+') return a + b;
    if (op == '-') return a - b;
    if (op == '×') return a * b;
    if (op == '÷') return b != 0 ? a / b : 0.0;
    return 0.0;
  }

  void onNumberPressed(String number) {
    if (shouldReset.value) {
      displayValue.value = number;
      shouldReset.value = false;
    } else {
      if (displayValue.value == '0') {
        displayValue.value = number;
      } else if (displayValue.value
              .replaceAll(',', '')
              .replaceAll('-', '')
              .length < 24) {
        displayValue.value = displayValue.value + number;
      }
    }
    // rebuild expression string
    if (currentOperator.value.isNotEmpty) {
      expression.value =
          '${formatNumber(firstOperand.value)}${operatorSymbol(currentOperator.value)}${displayValue.value}';
    } else {
      expression.value = displayValue.value;
    }
    updatePreview();
  }

  void onDecimalPressed() {
    if (shouldReset.value) {
      displayValue.value = '0,';
      shouldReset.value = false;
    } else if (!displayValue.value.contains(',')) {
      displayValue.value = '${displayValue.value},';
    }
    if (currentOperator.value.isNotEmpty) {
      expression.value =
          '${formatNumber(firstOperand.value)}${operatorSymbol(currentOperator.value)}${displayValue.value}';
    } else {
      expression.value = displayValue.value;
    }
    updatePreview();
  }

  void onOperatorPressed(String op) {
    if (currentOperator.value.isNotEmpty && !shouldReset.value) {
      double second = double.tryParse(displayValue.value.replaceAll(',', '.')) ?? 0.0;
      firstOperand.value = calculate(
        firstOperand.value,
        currentOperator.value,
        second,
      );
    } else {
      firstOperand.value = double.tryParse(displayValue.value.replaceAll(',', '.')) ?? 0.0;
    }
    currentOperator.value = op;
    shouldReset.value = true;
    expression.value = '${formatNumber(firstOperand.value)}${operatorSymbol(op)}';
    previewResult.value = '';
  }


  void onEqualsPressed() async {

    if (currentOperator.value.isEmpty) return;

    double second = double.tryParse(displayValue.value.replaceAll(',', '.')) ?? 0.0;

    double result = calculate(
      firstOperand.value,
      currentOperator.value,
      second,
    );

    String fullExpression =
        '${formatNumber(firstOperand.value)} '
        '${operatorSymbol(currentOperator.value)} '
        '${formatNumber(second)}';

    String resultString = formatNumber(result);

    // Save in database
    CalculationHistoryModel calculationHistoryModel =
    CalculationHistoryModel(
      expression: fullExpression,
      result: resultString,
      createdAt: DateTime.now().toString(),
    );

    await dbHelper
        .insertCalculation(calculationHistoryModel);

    // UI Update
    previewResult.value = '$fullExpression =';
    expression.value = '';
    displayValue.value = resultString;

    currentOperator.value = '';
    firstOperand.value = 0.0;
    shouldReset.value = true;
  }

  void onACPressed() {
    displayValue.value = '0';
    expression.value = '';
    previewResult.value = '';
    firstOperand.value = 0.0;
    currentOperator.value = '';
    shouldReset.value = false;
  }

  void onBackspacePressed() {
    if (shouldReset.value || displayValue.value == '0') return;
    if (displayValue.value.length == 1 ||
        (displayValue.value.length == 2 &&
            displayValue.value.startsWith('-'))) {
      displayValue.value = '0';
    } else {
      displayValue.value = displayValue.value.substring(
        0,
        displayValue.value.length - 1,
      );
    }
    if (currentOperator.value.isNotEmpty) {
      expression.value =
          '${formatNumber(firstOperand.value)}${operatorSymbol(currentOperator.value)}${displayValue.value}';
    } else {
      expression.value = displayValue.value;
    }
    updatePreview();
  }

  void onPlusMinusPressed() {
    String value = displayValue.value.replaceAll(',', '.');
    double current = double.tryParse(value) ?? 0.0;
    current = -current;
    displayValue.value = current.toString().replaceAll('.', ',');
    updatePreview();
  }

  void onPercentPressed() {
    double current = double.tryParse(displayValue.value.replaceAll(',', '.')) ?? 0.0;
    current /= 100;
    displayValue.value = formatNumber(current);
    updatePreview();
  }


  void onSquareRootPressed() async {
    double current = double.tryParse(
      displayValue.value.replaceAll(',', '.'),
    ) ?? 0.0;

    if (current < 0) {
      displayValue.value = "Error";
      return;
    }

    double result = sqrt(current);
    String expressionString = '√${formatNumber(current)}';
    String resultString = formatNumber(result);

    CalculationHistoryModel calculationHistoryModel = CalculationHistoryModel(
      expression: expressionString,
      result: resultString,
      createdAt: DateTime.now().toString(),
    );

    await dbHelper.insertCalculation(calculationHistoryModel);

    previewResult.value = '$expressionString =';
    displayValue.value = resultString;
    expression.value = '';
    shouldReset.value = true;
  }
}
