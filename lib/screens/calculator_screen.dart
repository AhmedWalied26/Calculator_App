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
                            onClick: (label) {
                              resultData = '';
                              setState(() {});
                            },
                            height: 80,
                            width: 80,
                            color: Color(0xff616161),
                            label: 'AC',
                            isIcon: false,
                            textColor: Colors.white,
                          ),
                          ButtonItem(
                            onClick: (label) {
                              int number = int.parse(resultData);
                              number ~/= 10;
                              resultData = number.toString();
                              setState(() {});
                            },
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
                            isIcon: false,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            color: Color(0xff303136),
                            label: '7',
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            label: '8',
                            color: Color(0xff303136),
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            label: '9',
                            color: Color(0xff303136),
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            color: Color(0xff303136),
                            label: '4',
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            label: '5',
                            color: Color(0xff303136),
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            label: '6',
                            color: Color(0xff303136),
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            color: Color(0xff303136),
                            label: '1',
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            label: '2',
                            color: Color(0xff303136),
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78, //60
                            width: 80, //62
                            label: '3',
                            color: Color(0xff303136),
                            isIcon: false,
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
                            isIcon: false,
                            textColor: Color(0xff005DB2),
                          ),
                          ButtonItem(
                            onClick: onDigitClick,
                            height: 78,
                            width: 80,
                            label: '.',
                            color: Color(0xff303136),
                            isIcon: false,
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
                      height: 78,
                      width: 80,
                      color: Color(0xff005DB2),
                      label: '*',
                      isIcon: false,
                      textColor: Colors.white,
                    ),
                    ButtonItem(
                      onClick: onOperatorClick,
                      height: 78,
                      width: 80,
                      color: Color(0xff005DB2),
                      label: '-',
                      isIcon: false,
                      textColor: Colors.white,
                    ),
                    ButtonItem(
                      onClick: onOperatorClick,
                      height: 128,
                      width: 80,
                      label: '+',
                      color: Color(0xff005DB2),
                      isIcon: false,
                      textColor: Colors.white,
                    ),
                    ButtonItem(
                      onClick: onEqualClick,
                      height: 128,
                      width: 80,
                      label: '=',
                      color: Color(0xff005DB2),
                      isIcon: false,
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

  void onEqualClick(String label) {
    rhs = resultData;
    lhs = calculate(lhs, rhs, operator);
    operator = label;
    resultData = lhs;

    lhs = '';
    rhs = '';
    setState(() {});
  }

  String calculate(String lhs, String rhs, String operator) {
    double LHS = double.parse(lhs);
    double RHS = double.parse(rhs);

    if (operator == '+') {
      return (LHS + RHS).toString();
    } else if (operator == '-') {
      return (LHS - RHS).toString();
    } else if (operator == '*') {
      return (LHS * RHS).toString();
    } else if (operator == '/') {
      return (LHS / RHS).toString();
    } else {
      return '0';
    }
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

  void onDigitClick(String label) {
    if (operator == '=') {
      resultData = '';
      operator = '';
    }
    resultData += label;
    setState(() {});
  }
}
