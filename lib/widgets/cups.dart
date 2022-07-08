import 'package:flutter/material.dart';

cups(Alignment align, Size sayz) {
  return AnimatedContainer(
    duration: const Duration(seconds: 1),
    alignment: align,
    child: Image.asset(
      'assets/cup.png',
      scale: sayz.width * 0.015,
    ),
  );
}
