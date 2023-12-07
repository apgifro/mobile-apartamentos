import 'package:flutter/material.dart';

ThemeData customTheme() {
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: const Color.fromRGBO(240, 248, 255, 1.0),
    textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 17.5),
        displaySmall: TextStyle(
          fontSize: 14.5,
          color: Colors.black54,
        )),
  );
}
