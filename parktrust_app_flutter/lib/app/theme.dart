import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const asphalt = Color(0xFF14171C);
const asphaltRaised = Color(0xFF1E232B);
const safetyYellow = Color(0xFFFFC72C);
const okGreen = Color(0xFF3DDC84);
const alertRed = Color(0xFFFF5A4E);

ThemeData buildTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: safetyYellow,
    brightness: Brightness.dark,
  ).copyWith(
    primary: safetyYellow,
    onPrimary: Colors.black,
    surface: asphalt,
    error: alertRed,
  );
  final base = ThemeData(colorScheme: scheme, brightness: Brightness.dark);
  return base.copyWith(
    scaffoldBackgroundColor: asphalt,
    textTheme: GoogleFonts.barlowTextTheme(base.textTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: asphalt,
      elevation: 0,
      titleTextStyle: GoogleFonts.barlowCondensed(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
        color: Colors.white,
      ),
    ),
    cardTheme: CardThemeData(
      color: asphaltRaised,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: asphaltRaised,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: asphaltRaised,
      indicatorColor: safetyYellow,
    ),
  );
}
