import 'dart:ui';

import 'package:flutter/material.dart';

extension colors on ColorScheme{
  static MaterialColor primary_app=const MaterialColor(
    0xff046234,
    const <int,Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
    },
  );

  //static const Color primary=Color(0xffFD5E53);
  static const Color primary = Color(0xFF112C48);
  static const Color secondary = Color(0xFF3A9F3E);
  static const Color backgroundcolor = Color(0xFFE2EBFE);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color red = Color(0xffAF1919);
  static const Color yellow = Color(0xffE88B00);
}