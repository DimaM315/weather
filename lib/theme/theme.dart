import 'package:flutter/material.dart';

final mainTheme = ThemeData(     
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      scaffoldBackgroundColor: const Color.fromARGB(148, 107, 91, 91),
      useMaterial3: true,
      dividerColor: const Color.fromARGB(141, 46, 45, 45),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.amber,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w900,
          )
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
        labelSmall: TextStyle(
          color: Color.fromARGB(66, 255, 255, 255),
          fontSize: 12,
          fontWeight: FontWeight.w100,
        ),
        labelMedium: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 15,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 24,
        ),
      ),
      buttonTheme: const ButtonThemeData(),
  )
;