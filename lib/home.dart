import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Alignment firstAlign = Alignment.topLeft;
  Alignment secondAlign = Alignment.topCenter;
  Alignment thirdAlign = Alignment.topRight;
  Alignment imgAlign = Alignment.center;
  late Alignment tempAlign;
  bool _visibility = true;
  bool _visnatija = false;
  String? natija;

  int states = 10 + Random.secure().nextInt(10);

  List changes = [12, 23, 13];

  void start() {
    firstAlign = Alignment.centerLeft;
    secondAlign = Alignment.center;
    thirdAlign = Alignment.centerRight;
  }

  Future animate(int value) async {
    setState(() {
      if (value == 12) {
        imgAlign = imgAlign == firstAlign ? secondAlign : firstAlign;
        tempAlign = firstAlign;
        firstAlign = secondAlign;
        secondAlign = tempAlign;
      } else if (value == 23) {
        imgAlign = imgAlign == secondAlign ? thirdAlign : secondAlign;
        tempAlign = secondAlign;
        secondAlign = thirdAlign;
        thirdAlign = tempAlign;
      } else if (value == 13) {
        imgAlign = imgAlign == firstAlign ? thirdAlign : firstAlign;
        tempAlign = firstAlign;
        firstAlign = thirdAlign;
        thirdAlign = tempAlign;
      }
    });

    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    Size sayz = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2193B0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: _visnatija,
              child: Center(
                child: Text(
                  "Siz $natija",
                  style: const TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: sayz.width * 0.05),
              width: sayz.width * 0.9,
              height: sayz.height * 0.6,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF6DD5ED),
                    Color(0xFF2193B0),
                  ],
                  radius: 0.5,
                ),
              ),
              child: Stack(
                children: [
                  Visibility(
                    visible: _visibility,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      alignment: imgAlign,
                      child: Image.asset(
                        'assets/ball.png',
                        scale: sayz.width * 0.02,
                      ),
                    ),
                  ),
                  cups(sayz, firstAlign),
                  cups(sayz, secondAlign),
                  cups(sayz, thirdAlign),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton.icon(
                      onPressed: () async {
                        _visnatija = false;
                        Future.delayed(const Duration(seconds: 1), (() {
                          _visibility = false;
                        }));

                        for (var i = 0; i < states; i++) {
                          if (i == 0) {
                            start();
                          }

                          await animate(changes[Random.secure().nextInt(3)]);
                        }
                      },
                      icon: Icon(
                        Icons.start,
                        size: sayz.width * 0.15,
                        color: Colors.green,
                      ),
                      label: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: sayz.width * 0.09,
                          color: Colors.green,
                        ),
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

  AnimatedContainer cups(Size sayz, Alignment align) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      alignment: align,
      child: InkWell(
        onTap: (() {
          setState(() {
            if (align == imgAlign) {
              natija = "yutdingiz";
            } else {
              natija = "yutqazdingiz";
            }
            _visnatija = true;
          });
        }),
        child: Image.asset(
          'assets/cup.png',
          scale: sayz.width * 0.015,
        ),
      ),
    );
  }
}
