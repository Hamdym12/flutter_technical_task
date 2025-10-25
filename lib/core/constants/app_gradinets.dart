import 'package:flutter/material.dart';

abstract class AppGradients {
  static const linearButton = LinearGradient(
      colors: [
        Color(0xCCFFFFFF),
        Color(0x4DF1F1F1),
      ],
     begin: Alignment.topLeft,
     end: Alignment.bottomRight,
  );

  static const linearBorder = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xCCFFFFFF),
      Color(0x80F1F1F1),
    ],
  );

  static const splashLinearGradient =
    LinearGradient(
      colors: [
        Color(0xFF7E22CE),
        Color(0xFF9333EA),
        Color(0xFFB04BFF),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
}