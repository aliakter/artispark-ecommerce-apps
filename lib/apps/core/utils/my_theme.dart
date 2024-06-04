import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

// final defaultTextTheme = TextTheme(
//   headline1: GoogleFonts.raleway(
//       fontSize: 88, fontWeight: FontWeight.w300, letterSpacing: -1.5),
//   headline2: GoogleFonts.raleway(
//       fontSize: 55, fontWeight: FontWeight.w300, letterSpacing: -0.5),
//   headline3: GoogleFonts.raleway(fontSize: 45, fontWeight: FontWeight.w400),
//   headline4: GoogleFonts.raleway(
//       fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
//   headline5: GoogleFonts.raleway(fontSize: 23, fontWeight: FontWeight.w400),
//   headline6: GoogleFonts.raleway(
//       fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 0.15),
//   subtitle1: GoogleFonts.raleway(
//       fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
//   subtitle2: GoogleFonts.raleway(
//       fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
//   bodyText1: GoogleFonts.raleway(
//       fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
//   bodyText2: GoogleFonts.raleway(
//       fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
//   button: GoogleFonts.raleway(
//       fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.2),
//   caption: GoogleFonts.raleway(
//       fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
//   overline: GoogleFonts.raleway(
//       fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
// );

class MyTheme {
  static final borderRadius = BorderRadius.circular(4);
  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    // scaffoldBackgroundColor: primaryColor,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: primaryColor),
    colorScheme: const ColorScheme.light(secondary: secondaryColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: secondaryColor,
          statusBarIconBrightness: Brightness.light),
      titleTextStyle: TextStyle(
          color: iconThemeColor, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: iconThemeColor),
      actionsIconTheme: IconThemeData(color: iconThemeColor),
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      color: ashColor,
    ),
    chipTheme: const ChipThemeData(
      shape: StadiumBorder(),
      side: BorderSide(color: Colors.black54, width: 0.5),
      checkmarkColor: Colors.green,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme(
        bodySmall: TextStyle(fontSize: 12, height: 1.83),
        bodyLarge:
            TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.375),
        bodyMedium: TextStyle(fontSize: 14, height: 1.5714),
        labelLarge:
            TextStyle(fontSize: 16, height: 2, fontWeight: FontWeight.w600),
        // titleLarge: const TextStyle(
        //     fontSize: 16, height: 2, fontWeight: FontWeight.w600),
      ),
    ),
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 64),
        backgroundColor: primaryColor,
        foregroundColor: iconThemeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 64),
        backgroundColor: Colors.transparent,
        foregroundColor: primaryColor,
        side: const BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 3,
      backgroundColor: Color(0x00ffffff),
      selectedLabelStyle: TextStyle(color: primaryColor, fontSize: 14.0),
      unselectedLabelStyle: TextStyle(color: paragraphColor, fontSize: 12.0),
      selectedItemColor: primaryColor,
      unselectedItemColor: paragraphColor,
      showUnselectedLabels: true,
    ),

    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),


    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: TextStyle(color: grayColor),
      labelStyle: TextStyle(color: grayColor, fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: ashColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: ashColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: ashColor),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: Colors.red)),
      fillColor: Colors.white,
      filled: true,
      focusColor: blackColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: blackColor,
      selectionColor: blackColor,
      selectionHandleColor: blackColor,
    ),
  );
}
