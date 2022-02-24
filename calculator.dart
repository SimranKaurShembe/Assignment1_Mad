import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'mybutton.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.yellow,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      buttonText: "C",
                      textColor: Colors.black,
                    ),
                    MyButton(
                      buttonText: "+/-",
                      textColor: Colors.black,
                    ),
                    MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput += "%";
                        });
                      },
                      buttonText: "%",
                      textColor: Colors.black,
                    ),
                    MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: "DEL",
                      textColor: Colors.black,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "7";
                          });
                        },
                        buttonText: "7",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "8";
                          });
                        },
                        buttonText: "8",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "9";
                          });
                        },
                        buttonText: "9",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "/";
                          });
                        },
                        buttonText: "/",
                        textColor: Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "4";
                          });
                        },
                        buttonText: "4",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "5";
                          });
                        },
                        buttonText: "5",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "6";
                          });
                        },
                        buttonText: "6",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "x";
                          });
                        },
                        buttonText: "X",
                        textColor: Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "1";
                          });
                        },
                        buttonText: "1",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "2";
                          });
                        },
                        buttonText: "2",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "3";
                          });
                        },
                        buttonText: "3",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "-";
                          });
                        },
                        buttonText: "-",
                        textColor: Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "0";
                          });
                        },
                        buttonText: "0",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += ".";
                          });
                        },
                        buttonText: ".",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: "=",
                        textColor: Colors.black),
                    MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += "+";
                          });
                        },
                        buttonText: "+",
                        textColor: Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
