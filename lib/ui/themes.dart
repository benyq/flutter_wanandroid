import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static Color lightColor = const Color(0xffededed);
  static Color darkColor = const Color(0x00049fb6);

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      // For light theming
      scaffoldBackgroundColor: Colors.grey.shade100,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColor,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarColor: lightColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightColor,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black));

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      // For dark theming
      scaffoldBackgroundColor: Colors.grey.shade900,
      appBarTheme: AppBarTheme(
        backgroundColor: darkColor,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            statusBarColor: darkColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkColor,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white));
}
