import 'package:flutter/material.dart';
import 'package:cup_shuffle/home.dart';

cups(Alignment align, Size sayz, Alignment imgAlign) {
  return AnimatedContainer(
    duration: const Duration(seconds: 1),
    alignment: align,
    child: InkWell(
      onTap: (() {
        if (align == imgAlign) {
          setState() {}
        }
      }),
      child: Image.asset(
        'assets/cup.png',
        scale: sayz.width * 0.015,
      ),
    ),
  );
}
