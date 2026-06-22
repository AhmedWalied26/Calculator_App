import 'package:calculator_app/widgets/button_item.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181A),
      body: Column(
        mainAxisAlignment: .end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                resultData,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 34, bottom: 40),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ButtonItem(
                            onClick: onClearClick,
                            height: 80,
                            width: 80,
                            color: Color(0xff616161),
                            label: 'AC',
                            textColor: Colors.white,
                          ),
                          ButtonItem(
                            onClick: onRemoveClick,
                            height: 80,
                            width: 80,
                            label: '',
                            color: Color(0xff616161),
                            isIcon: true,
                            textColor: Colors.white,
                          ),
                          ButtonItem(
                            onClick: onOperatorClick,
                            height: 80,
                            width: 80,
                            label: '/',
                            color: Color(0xff005DB2),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ButtonItem(
                            onClick: onDigitClick,
                            color: Color(0xff303136),
                            label: '7',
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            label: '8',
                            color: Color(0xff303136),
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            label: '9',
                            color: Color(0xff303136),
                            textColor: Color(0xff005DB2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ButtonItem(
                            onClick: onDigitClick,
                            color: Color(0xff303136),
                            label: '4',
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            label: '5',
                            color: Color(0xff303136),
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            label: '6',
                            color: Color(0xff303136),
                            textColor: Color(0xff005DB2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ButtonItem(
                            onClick: onDigitClick,
                            color: Color(0xff303136),
                            label: '1',
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            label: '2',
                            color: Color(0xff303136),
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            label: '3',
                            color: Color(0xff303136),
                            textColor: Color(0xff005DB2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 172,
                            label: '0',
                            color: Color(0xff303136),
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            label: '.',
                            color: Color(0xff303136),
                            textColor: Color(0xff005DB2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 50),
                    ButtonItem(
                      onClick: onOperatorClick,
                      color: Color(0xff005DB2),
                      label: '*',
                      textColor: Colors.white,
                    ),
                    ButtonItem(
                      onClick: onOperatorClick,
                      color: Color(0xff005DB2),
                      label: '-',
                      textColor: Colors.white,
                    ),
                    ButtonItem(
                      onClick: onOperatorClick,
                      height: 128,
                      width: 80,
                      label: '+',
                      color: Color(0xff005DB2),
                      textColor: Colors.white,
                    ),
                    ButtonItem(
                      onClick: onEqualClick,
                      height: 128,
                      width: 80,
                      label: '=',
                      color: Color(0xff005DB2),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String lhs = '';
  String rhs = '';
  String operator = '';

  void onRemoveClick(String label) {
    if (resultData.isEmpty) {
      return;
    }
    resultData = resultData.substring(0, resultData.length - 1);
    setState(() {});
  }

  void onClearClick(String label) {
    lhs = '';
    operator = '';
    resultData = '';
    setState(() {});
  }

  void onEqualClick(String label) {
    rhs = resultData;
    resultData = calculate(lhs, rhs, operator);
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onOperatorClick(String label) {
    if (operator.isEmpty) {
      lhs = resultData;
    } else {
      rhs = resultData;
      lhs = calculate(lhs, rhs, operator);
    }
    operator = label;
    resultData = '';
    setState(() {});
  }

  String calculate(String lhs, String rhs, String operator) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;

    if (operator == '+') {
      res = num1 + num2;
    } else if (operator == '-') {
      res = num1 - num2;
    } else if (operator == '*') {
      res = num1 * num2;
    } else if (operator == '/') {
      res = num1 / num2;
    }
    return res.toString();
  }

  void onDigitClick(String label) {
    if (label == '.' && resultData.contains('.')) {
      return;
    }
    resultData += label;
    setState(() {});
  }
}
