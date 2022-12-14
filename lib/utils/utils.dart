import 'package:flutter/material.dart';

class CustomTheme {
  static final Color colorBlue = Color.fromRGBO(40, 155, 212, 1);
  static final Color colorGreen = Color.fromRGBO(66, 209, 193, 1);
  static final Color olorLightGray = Color.fromRGBO(247, 228, 251, 1);
  static final Color colorGray = Color.fromRGBO(202, 102, 302, 1);
  static final Color colorMaastrichtBlue = Color.fromRGBO(29, 37, 64, 1);
  static final Color colorSpanishGray = Color.fromARGB(255, 21, 145, 81);
  static final colorAuxNavigationBar = Color.fromARGB(188, 91, 177, 90);
  static const Color primarycolor = Color.fromARGB(99, 31, 119, 135);
  static const Color secondcolor = Color.fromARGB(89, 33, 87, 50);
  static const Color auxcolor = Color.fromARGB(9879, 100, 89, 45);
  static const Color fondo = Color.fromARGB(150, 227, 224, 211);
  static const Color fondo2 = Color.fromARGB(247, 232, 226, 201);

  static final Color colorLightGray = Color.fromRGBO(247, 248, 251, 1);
  static final ThemeData theme = ThemeData.light().copyWith(
    primaryColor: colorGreen,
  );
  static final ThemeData theme1 = ThemeData(
    textTheme: Typography.blackRedwoodCity,
  );
  static final ThemeData theme2 = ThemeData(
    textTheme: Typography.englishLike2018,
  );
}
