import 'package:flutter/material.dart';

class Themeing {
  ThemeData getLightTheme() {
    return ThemeData().copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(212, 212, 212, 1),
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: const Color.fromRGBO(5, 94, 78, 1),
        centerTitle: false,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Color.fromRGBO(225, 219, 219, 1),
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        actionsIconTheme: const IconThemeData(
          size: 25,
          color: Color.fromRGBO(225, 219, 219, 1),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Color.fromRGBO(225, 219, 219, 1),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Color.fromRGBO(225, 219, 219, 1),
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(19, 28, 33, 1),
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: const Color.fromRGBO(31, 44, 52, 1),
        centerTitle: false,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Color.fromRGBO(225, 219, 219, 1),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: const IconThemeData(
          size: 25,
          color: Color.fromRGBO(225, 219, 219, 1),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Color.fromARGB(255, 3, 136, 111),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Color.fromARGB(255, 3, 136, 111),
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.red,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
