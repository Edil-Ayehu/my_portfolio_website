import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFFE6E6E6),
    // fontFamily: 'Lato',
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Lato',
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Color(0xFF102C57),
        fontFamily: 'Lato',
        letterSpacing: 1.1,
      ),
      titleMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        fontFamily: 'Lato',
        color: Colors.black,
        letterSpacing: 1.1,
      ),
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
        color: Colors.black,
        letterSpacing: 1.1,
      ),
      bodyLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Lato',
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Lato',
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Lato',
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(color: Colors.blue),
      fillColor:
          WidgetStateProperty.all(Colors.grey.shade200), // Color when checked
      checkColor: WidgetStateProperty.all(Colors.white), // Checkmark color
      // Optional: Customize other properties
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFF131414),
    // fontFamily: 'Lato',
    appBarTheme: AppBarTheme(
      foregroundColor: Color(0xFfE6E6E6),
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
        fontFamily: 'Lato',
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
        fontFamily: 'Lato',
        letterSpacing: 1.1,
      ),
      titleMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Color(0xFfE6E6E6),
        fontFamily: 'Lato',
        letterSpacing: 1.1,
      ),
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
        color: Color(0xFfE6E6E6), 
        letterSpacing: 1.1,
      ),
      bodyLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
        fontFamily: 'Lato',
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
        fontFamily: 'Lato',
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
        fontFamily: 'Lato',
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Colors.grey), // Color when checked
      checkColor: WidgetStateProperty.all(Colors.white), // Checkmark color
      // Optional: Customize other properties
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
      foregroundColor: Colors.black,
    ),
  );
}
