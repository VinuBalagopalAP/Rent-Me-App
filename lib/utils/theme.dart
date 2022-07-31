import 'package:flutter/material.dart';

class StoreTheme {
  static const Color primaryColor = Color(0xFF23B79F);
  static const Color grey = Color(0xFFD7D7D7);
  static const Color white = Colors.white;
  static const Color black = Color(0xFF606060);
  static const Color whitish = Color(0xFFF6F6F6);
  static const Color blueGrey = Color.fromARGB(255, 34, 42, 46);

  static ThemeData get theme => ThemeData(
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: black,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: primaryColor,
          unselectedLabelColor: black,
          labelPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showUnselectedLabels: false,
          unselectedItemColor: black,
        ),
      );
}
