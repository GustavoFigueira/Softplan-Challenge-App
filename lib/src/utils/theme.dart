import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primary: #0B4696
// Secundary: #247DBF
// Dark: #58585A
// Light: #3396D1
// Accent: #3396D1

ThemeData _appTheme;

ThemeData getAppTheme(BuildContext context) {
  if (_appTheme == null) _appTheme = _buildAppTheme(context);
  return _appTheme;
}

ThemeData _buildAppTheme(BuildContext context) {
  TextTheme textTheme = Theme.of(context).textTheme.apply(
        bodyColor: Color(0xff58585A),
        displayColor: Color(0xff58585A),
      );

  textTheme = textTheme.copyWith(
    caption: textTheme.caption.copyWith(
      color: Colors.white.withOpacity(0.6),
      fontSize: 12,
    ),
    button: textTheme.button.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      height: 1.5,
    ),
  );

  ButtonThemeData buttonTheme = Theme.of(context).buttonTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      );

  AppBarTheme appBarTheme = Theme.of(context).appBarTheme.copyWith(
        brightness: Brightness.dark,
        color: Colors.black.withOpacity(0.90),
        elevation: 0,
        iconTheme: IconThemeData(
          opacity: 1,
          color: Colors.white,
        ),
      );

  return ThemeData(
    appBarTheme: appBarTheme,
    backgroundColor: Colors.white,
    primaryColor: Color(0xff0B4696),
    secondaryHeaderColor: Color(0xff247DBF),
    primaryColorLight: Color(0xff4DACFF),
    primaryColorDark: Color(0xff3396D1),
    accentColor: Color(0xff3396D1),
    fontFamily: 'Montserrat',
    buttonTheme: buttonTheme,
    textTheme: GoogleFonts.montserratTextTheme(textTheme),
  );
}
