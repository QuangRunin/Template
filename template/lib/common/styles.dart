import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late String font = 'Lato';

const w100 = FontWeight.w100;
const w200 = FontWeight.w200;
const w300 = FontWeight.w300;
const w400 = FontWeight.w400;
const w500 = FontWeight.w500;
const w600 = FontWeight.w600;
const w700 = FontWeight.w700;
const w800 = FontWeight.w800;
const w900 = FontWeight.w900;
const baseAppColor = Color(0xFF1DB57A);
const defaultColor = Color(0xFF000000);
const whiteColor = Color(0xFFFFFFFF);
const appPadding = 16.0;
const textFieldPaddingHorizontal = 25.0;

//           AppBar Style           //
var appbarStyle = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: whiteColor,
    fontSize: 16,
    fontWeight: w500,
  ),
);
//           DefaultColor Text           //
var size11W500Default = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: defaultColor,
    fontSize: 11,
    fontWeight: w500,
  ),
);
var size12W500Default = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: defaultColor,
    fontSize: 12,
    fontWeight: w500,
  ),
);
var size14W500Default = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: defaultColor,
    fontSize: 14,
    fontWeight: w500,
  ),
);

//           WhiteColor Text           //
var size11W500White = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: whiteColor,
    fontSize: 11,
    fontWeight: w500,
  ),
);
var size12W500White = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: whiteColor,
    fontSize: 12,
    fontWeight: w500,
  ),
);
var size14W500White = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: whiteColor,
    fontSize: 14,
    fontWeight: w500,
  ),
);
//           WhiteColor Text           //
