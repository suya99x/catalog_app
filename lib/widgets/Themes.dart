import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      accentColor: Colors.black,
      appBarTheme: AppBarTheme(
//to remove primary color in app bar
        color: Colors.white,
//to remove shadow
        elevation: 0.0,
//to show icon which is white due to removal of background
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkColor,
      buttonColor: lightblueColor,
      accentColor: Colors.white,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
//to remove primary color in app bar
        color: Colors.white,
//to remove shadow
        elevation: 0.0,
//to show icon which is white due to removal of background
//back button white icontheme white
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
            headline6:
                context.textTheme.headline6.copyWith(color: Colors.white)),
      ));

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkColor = Vx.gray800;
  static Color lightblueColor = Vx.indigo500;
  static Color darkBluishColor = Color(0xff403b58);
}
