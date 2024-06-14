import 'package:flutter/material.dart';

class ColorsApp {
  static Color black = const Color(0xff17191D);
  static Color gray = const Color(0xff2C3137);
  static Color lightGray = const Color(0xff797C7F);
  static Color orang = const Color(0xffD6361F);
  static Color lightOrang = const Color(0xffEC540E);

  static LinearGradient gradientBlack = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      stops: const [
        0.0,
        0.1
      ],
      colors: <Color>[
        gray,
        black,
      ]);

  static LinearGradient gradientOrang = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      stops: const [
        0.0,
        0.1
      ],
      colors: <Color>[
        lightOrang,
        orang,
      ]);
}
