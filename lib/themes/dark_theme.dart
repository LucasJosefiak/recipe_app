import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/constants/borders.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookTheme.dark()
ThemeData getDarkTheme() {
  return ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorConstants.darkGreen,
      unselectedItemColor: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    textTheme: GoogleFonts.nunitoTextTheme().apply(
      bodyColor: Colors.white,
      decorationColor: Colors.white,
      displayColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: ColorConstants.darkGreen,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.textFieldRadius,
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: ColorConstants.darkScaffold,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: Borders.inputBorder,
      focusedBorder: Borders.inputBorder,
      enabledBorder: Borders.inputBorder,
      filled: true,
      fillColor: ColorConstants.darkGrey,
      hintStyle: TextStyle(
        color: Colors.grey[500],
      ),
      labelStyle: TextStyle(
        color: Colors.grey[500],
      ),
    ),
    cardTheme: CardTheme(
      color: ColorConstants.darkGrey,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.cardRadius,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      color: Colors.transparent,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primaryColor: ColorConstants.darkGreen,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
    ).copyWith(
      secondary: ColorConstants.darkGreen,
    ),
  );
}
