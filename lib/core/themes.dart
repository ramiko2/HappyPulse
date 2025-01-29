import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.pink,
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.black), // Update from bodyText1 to bodyText2
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.pink,
      secondary: Colors.pink[400]!, // Replaced accentColor with secondary
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.pink,
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.white), // Update from bodyText1 to bodyText2
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.pink,
      secondary: Colors.pink[400]!, // Replaced accentColor with secondary
    ),
  );
}
