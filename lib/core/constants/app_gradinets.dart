import 'package:flutter/material.dart';

abstract class AppGradients {
  static const linearButton = LinearGradient(
      colors: [
        Color(0xCCFFFFFF),
        Color(0x4DF1F1F1),
      ]
  );

  static const linearBorder = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xCCFFFFFF),
      Color(0x80F1F1F1),
    ],
  );
}