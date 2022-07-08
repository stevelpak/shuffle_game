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
                          firstAlign = Alignment.center;
                          secondAlign = Alignment.centerLeft;
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
