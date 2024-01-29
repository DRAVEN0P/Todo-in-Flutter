import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 230, 230, 230),
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      titleTextStyle:
          const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: null,
  );
}
