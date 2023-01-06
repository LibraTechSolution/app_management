
import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

class TextStyles {
  static TextStyle textSize12 = TextStyle(
      fontSize: Dimens.font_sp12,
      color: Colours.TEXT_BLUR,
      fontFamily: "Open",
      wordSpacing: 1.8,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);


  static TextStyle textSize14 = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.MAIN_COLOR,
      fontFamily: "Open",
      wordSpacing: 1.8,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);


  static TextStyle textSize16TextMain = TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colours.MAIN_COLOR,
      fontFamily: "Open",
      wordSpacing: 1.8,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);


  static TextStyle textSize16Title= TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colors.white,
      fontFamily: "OpenBold",
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static TextStyle textSize16Text = TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colors.white,
      fontFamily: "Open",
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);


  static TextStyle textSize16Green = TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colors.green,
      fontFamily: "Open",
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static TextStyle textSize24 = TextStyle(
      fontSize: Dimens.font_sp24,
      color: Colors.white,
      fontFamily: "OpenBold",
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);
}