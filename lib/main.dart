import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(BmiApp());
}

class BmiApp extends StatefulWidget {
  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  double height, weight, result;
  String status;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.lightGreen,
        width: 200,
        height: 500,
        child: Scaffold(
          appBar: AppBar(
            title: Text('BMI Calculation'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Enter your height in cm ->',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      height = double.parse(value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                    width: 100,
                    child: ColoredBox(color: Colors.black87),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Enter your weight in Kg ->',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      weight = double.parse(value);
                    },
                  ),
                  SizedBox(
                      height: 20,
                      width: 100,
                      child: ColoredBox(color: Colors.black87)),
                ],
              ),
              TextButton(
                child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  setState(() {
                    result = weight * 10000 / (height * height);
                    if (result < 18.5) {
                      status = 'Underweight';
                    } else if (result < 25) {
                      status = 'Normal';
                    } else if (result < 30) {
                      status = 'Overweight';
                    } else {
                      status = 'Obese';
                    }
                  });
                },
              ),
              Text(
                'BMI Result : ${result.toString()} \n Status= $status',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
