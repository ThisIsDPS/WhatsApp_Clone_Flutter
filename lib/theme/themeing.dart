import 'package:flutter/material.dart';

class Themeing {
  ThemeData getLightTheme() {
    return ThemeData().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(245, 248, 245, 245),
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: const Color.fromRGBO(5, 94, 78, 1),
        centerTitle: false,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 248, 245, 245),
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        actionsIconTheme: const IconThemeData(
          size: 25,
          color: Color.fromARGB(255, 248, 245, 245),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Color.fromARGB(255, 248, 245, 245),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Color.fromARGB(255, 248, 245, 245),
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
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(5, 94, 78, 1),
        foregroundColor: Color.fromARGB(255, 248, 245, 245),
      ),
      cardTheme: CardTheme(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 1,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 18, 171, 46)),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
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
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 3, 136, 111),
        foregroundColor: Color.fromRGBO(237, 233, 233, 1),
        iconSize: 26,
      ),
      cardTheme: CardTheme(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 1,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromRGBO(5, 94, 78, 1)),
          foregroundColor: MaterialStatePropertyAll(Colors.black),
        ),
      ),
    );
  }
}
