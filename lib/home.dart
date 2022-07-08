import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Alignment firstAlign = Alignment.centerLeft;
  Alignment secondAlign = Alignment.center;
  Alignment thirdAlign = Alignment.centerRight;
  int states = 10 + Random.secure().nextInt(10);

  List changes = [12, 23, 13];

  animate(int value) {
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
    } else {
      return animate(changes[Random().nextInt(changes.length)]);
    }
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
            FutureBuilder(
              builder: ((context, snapshot) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: sayz.width * 0.05),
                  width: sayz.width * 0.9,
                  height: sayz.height * 0.6,
                  color: const Color(0xFFA2D5C6),
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 3),
                        alignment: firstAlign,
                        child: Image.asset(
                          'assets/cup.png',
                          scale: sayz.width * 0.015,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 3),
                        alignment: secondAlign,
                        child: Image.asset(
                          'assets/cup.png',
                          scale: sayz.width * 0.015,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 3),
                        alignment: thirdAlign,
                        child: Image.asset(
                          'assets/cup.png',
                          scale: sayz.width * 0.015,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              animate(
                                  changes[Random().nextInt(changes.length)]);
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
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
