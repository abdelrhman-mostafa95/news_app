import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(fontSize: 25, color: Colors.white),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ))));
}
