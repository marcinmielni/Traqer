import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primaryColor: Colors.purple,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF3F1C77),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.black, fontSize: 13),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.normal),
    titleLarge: TextStyle(color: Colors.white, fontSize: 22),
  ),
  indicatorColor: Colors.white,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.purple,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Color(0xFFD9D9D9),
    onSurface: Colors.black,
  ),

);

ThemeData darkMode = ThemeData(
  primaryColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.white, fontSize: 13),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.normal),
    titleLarge: TextStyle(color: Colors.white, fontSize: 22),
  ),
  indicatorColor: Colors.white,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.black54,
    onBackground: Colors.white,
    surface: Colors.grey,
    onSurface: Colors.white,
  ),

);