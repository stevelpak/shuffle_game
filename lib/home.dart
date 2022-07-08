import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cup_shuffle/widgets/cups.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Alignment firstAlign = Alignment.topLeft;
  Alignment secondAlign = Alignment.topCenter;
  Alignment thirdAlign = Alignment.topRight;

  int states = 10 + Random.secure().nextInt(10);

  List changes = [12, 23, 13];

  void animate(int value) {
    Alignment tempAlign;
    if (value == 12) {
      tempAlign = firstAlign;
      firstAlign = secondAlign;
      secondAlign = tempAlign;
    } else if (value == 23) {
      tempAlign = secondAlign;
      secondAlign = thirdAlign;
      thirdAlign = tempAlign;
    } else if (value == 13) {
      tempAlign = firstAlign;
      firstAlign = thirdAlign;
      thirdAlign = tempAlign;
    }
  }

  void start() {
    firstAlign = Alignment.centerLeft;
    secondAlign = Alignment.center;
    thirdAlign = Alignment.centerRight;
  }

  @override
  Widget build(BuildContext context) {
    Size sayz = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF077B8A),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: sayz.width * 0.05),
              width: sayz.width * 0.9,
              height: sayz.height * 0.6,
              color: const Color(0xFFA2D5C6),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/ball.png',
                      scale: sayz.width * 0.02,
                    ),
                  ),
                  cups(firstAlign, sayz),
                  cups(secondAlign, sayz),
                  cups(thirdAlign, sayz),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton.icon(
                      onPressed: () async {
                        setState(() {
                          start();
                        });
                      },
                      icon: Icon(Icons.start, size: sayz.width * 0.1),
                      label: Text(
                        "Start",
                        style: TextStyle(fontSize: sayz.width * 0.05),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
