import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  // textTheme: const TextTheme(
  //   displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  //   bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
  // ),
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.blue[400]),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    background: Colors.white,
  ),
);
