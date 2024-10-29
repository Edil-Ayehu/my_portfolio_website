import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFFE6E6E6),
    // fontFamily: 'Lato',
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      titleTextStyle: GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.outfit(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Color(0xFF102C57),
        letterSpacing: 1.1,
      ),
      titleMedium: GoogleFonts.outfit(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Colors.black,
        letterSpacing: 1.1,
      ),
      titleSmall: GoogleFonts.outfit(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 1.1,
      ),
      bodyLarge: GoogleFonts.outfit(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
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
      titleTextStyle: GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.outfit(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
        letterSpacing: 1.1,
      ),
      titleMedium: GoogleFonts.outfit(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Color(0xFfE6E6E6),
        letterSpacing: 1.1,
      ),
      titleSmall: GoogleFonts.outfit(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
        letterSpacing: 1.1,
      ),
      bodyLarge: GoogleFonts.outfit(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
      ),
      bodyMedium: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
      ),
      bodySmall: GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFfE6E6E6),
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
