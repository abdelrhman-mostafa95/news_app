import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF480903),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(fontSize: 25, color: Colors.white),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ))));
}
