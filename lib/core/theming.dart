import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes{
  static bool? isLight;
  static final themeLight = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.grey,
      tertiary: Colors.black87,
      inversePrimary: Colors.black,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppin",
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppin",
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: Colors.black38,
      ),
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppin",
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
    ),
  );
}