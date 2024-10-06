import 'package:flutter/material.dart';

class Themes {
  static bool? isLight;
  static LinearGradient gradientLight = const LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.bottomRight,
    colors: [
      Colors.white70,
      Colors.white60,
      Colors.white54,
      Colors.white38,
      Colors.white30,
      Color(0xFF051B2E),
    ],
  );
  static final themeLight = ThemeData(
    listTileTheme: const ListTileThemeData(
      tileColor: Color.fromRGBO(158, 158, 158, 0.141),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    colorScheme: const ColorScheme.light(
        primary: Color.fromRGBO(255, 255, 255, 1),
        secondary: Colors.grey,
        tertiary: Color(0xFF051B2E),
        inversePrimary: Colors.black,
        surface: Colors.blueGrey),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppin",
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppin",
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppin",
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: Colors.black38,
      ),
      bodySmall: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppin",
        fontWeight: FontWeight.w200,
        fontSize: 12,
        color: Color(0xDDC9C9C9),
      ),
      bodyMedium: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: "Poppin",
        fontWeight: FontWeight.w300,
        fontSize: 18,
        color: Color.fromRGBO(250, 246, 246, 0.867),
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
