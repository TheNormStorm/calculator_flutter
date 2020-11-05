import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

import './widgets/CalcButtons.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key key}) : super(key: key);

  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  // This widget is the root of your application.
  String expression = '';
  String history = '';

  void numStore(String num) {
    setState(() {
      expression += num;
    });
  }

  void clearAC(String num) {
    setState(() {
      expression = '';
      history = 'TheNormStorm';
    });
  }

  void clearZ(String num) {
    setState(() {
      expression = '0';
    });
  }

  void clearC(String num) {
    setState(() {
      expression = '';
    });
  }

  void eval(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    String expr;

    setState(() {
      history = expression;
      expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        home: Scaffold(
          backgroundColor: Color(0xFF392F46),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 29),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 30,
                    ),
                    color: Colors.white70,
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.only(right: 29),
                child: Text(
                  expression,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 52,
                    ),
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              SizedBox(
                height: 90,
                width: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtons(
                    text: 'AC',
                    fillColor: 0xFFF84C7A,
                    callback: clearAC,
                    textColor: 0xFFFFFFFF,
                    textSize: 35,
                  ),
                  CalcButtons(
                    text: 'C',
                    fillColor: 0xFFF84C7A,
                    callback: clearC,
                    textColor: 0xFFFFFFFF,
                    textSize: 35,
                  ),
                  CalcButtons(
                    text: '%',
                    fillColor: 0xFFF84C7A,
                    callback: numStore,
                    textColor: 0xFFFFFFFF,
                    textSize: 35,
                  ),
                  CalcButtons(
                    text: '/',
                    fillColor: 0xFFF84C7A,
                    callback: numStore,
                    textColor: 0xFFFFFFFF,
                    textSize: 35,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtons(
                    text: '7',
                    fillColor: 0xFFFFFFFF,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '8',
                    fillColor: 0xFFFFFFFF,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '9',
                    fillColor: 0xFFffffff,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '*',
                    fillColor: 0xFFF84C7A,
                    callback: numStore,
                    textColor: 0xFFFFFFFF,
                    textSize: 35,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtons(
                    text: '4',
                    fillColor: 0xFFFFFFFF,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '5',
                    fillColor: 0xFFFFFFFF,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '6',
                    fillColor: 0xFFffffff,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '-',
                    fillColor: 0xFFF84C7A,
                    callback: numStore,
                    textColor: 0xFFFFFFFF,
                    textSize: 35,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtons(
                    text: '1',
                    fillColor: 0xFFFFFFFF,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '2',
                    fillColor: 0xFFFFFFFF,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '3',
                    fillColor: 0xFFffffff,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '+',
                    fillColor: 0xFFF84C7A,
                    callback: numStore,
                    textColor: 0xFFFFFFFF,
                    textSize: 35,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButtons(
                    text: '.',
                    fillColor: 0xFFFFFFFF,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '0',
                    fillColor: 0xFFFFFFFF,
                    callback: numStore,
                  ),
                  CalcButtons(
                    text: '00',
                    fillColor: 0xffffffff,
                    callback: clearZ,
                  ),
                  CalcButtons(
                    text: '=',
                    fillColor: 0xFFF84C7A,
                    callback: eval,
                    textColor: 0xFFFFFFFF,
                    textSize: 35,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
