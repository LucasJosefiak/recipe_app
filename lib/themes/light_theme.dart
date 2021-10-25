import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookTheme.light()
ThemeData getLightTheme() => ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorConstants.darkGreen,
        unselectedItemColor: Colors.black,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
      ),
      textTheme: GoogleFonts.nunitoTextTheme().apply(
        bodyColor: Colors.black,
        decorationColor: Colors.black,
        displayColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: ColorConstants.green,
          shape: RoundedRectangleBorder(
            borderRadius: Radii.textFieldRadius,
          ),
        ),
      ),
      scaffoldBackgroundColor: Color(0xFFF2F1F5),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      cardTheme: CardTheme(
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
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      primaryColor: ColorConstants.darkGreen,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
      ).copyWith(
        secondary: ColorConstants.green,
      ),
    );
