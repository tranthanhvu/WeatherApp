import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle baseStyle = const TextStyle();

  static TextStyle heading1XBold = baseStyle.copyWith(
    fontSize: 76,
    fontWeight: FontWeight.w800,
    height: 1,
  );

  static TextStyle heading1Bold = baseStyle.copyWith(
    fontSize: 76,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static TextStyle heading1SemiBold = baseStyle.copyWith(
    fontSize: 76,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  static TextStyle heading1Regular = baseStyle.copyWith(
    fontSize: 76,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static TextStyle heading2XBold = baseStyle.copyWith(
    fontSize: 61,
    fontWeight: FontWeight.w900,
    height: 1,
  );

  static TextStyle heading2Bold = baseStyle.copyWith(
    fontSize: 61,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static TextStyle heading2SemiBold = baseStyle.copyWith(
    fontSize: 61,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  static TextStyle heading2Regular = baseStyle.copyWith(
    fontSize: 61,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static TextStyle heading3XBold = baseStyle.copyWith(
    fontSize: 49,
    fontWeight: FontWeight.w800,
    height: 1,
  );

  static TextStyle heading3Bold = baseStyle.copyWith(
    fontSize: 49,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static TextStyle heading3SemiBold = baseStyle.copyWith(
    fontSize: 49,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  static TextStyle heading3Regular = baseStyle.copyWith(
    fontSize: 49,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static TextStyle heading4XBold = baseStyle.copyWith(
    fontSize: 39,
    fontWeight: FontWeight.w800,
    height: 1,
  );

  static TextStyle heading4Bold = baseStyle.copyWith(
    fontSize: 39,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static TextStyle heading4SemiBold = baseStyle.copyWith(
    fontSize: 39,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  static TextStyle heading4Regular = baseStyle.copyWith(
    fontSize: 39,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static TextStyle heading5XBold = baseStyle.copyWith(
    fontSize: 31,
    fontWeight: FontWeight.w800,
    height: 1,
  );

  static TextStyle heading5Bold = baseStyle.copyWith(
    fontSize: 31,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static TextStyle heading5SemiBold = baseStyle.copyWith(
    fontSize: 31,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  static TextStyle heading5Regular = baseStyle.copyWith(
    fontSize: 31,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static TextStyle heading5Italic = baseStyle.copyWith(
    fontSize: 31,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1,
  );

  static TextStyle heading5SemiBoldItalic = baseStyle.copyWith(
    fontSize: 31,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    height: 1,
  );

  static TextStyle title1Bold = baseStyle.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static TextStyle title1SemiBold = baseStyle.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static TextStyle title1Regular = baseStyle.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );

  static TextStyle title1BoldItalic = baseStyle.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 1.3,
  );

  static TextStyle title1SemiBoldItalic = baseStyle.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    height: 1.3,
  );

  static TextStyle title1Italic = baseStyle.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.3,
  );

  static TextStyle title2XBold = baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    height: 1.5,
  );

  static TextStyle title2Bold = baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static TextStyle title2SemiBold = baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle title2Regular = baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle title2XBoldItalic = baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle title2BoldItalic = baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle title2SemiBoldItalic = baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle title2Italic = baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle bodyMedium = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle bodyBold = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static TextStyle bodyRegular = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle bodyMediumItalic = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle bodyBoldItalic = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle bodyItalic = baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption1XBold = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    height: 1.5,
  );

  static TextStyle caption1Bold = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.5,
  );

  static TextStyle caption1SemiBold = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle caption1Medium = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle caption1Regular = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle caption1XBoldItalic = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption1BoldItalic = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption1SemiBoldItalic = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption1MediumItalic = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption1Italic = baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption2Bold = baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static TextStyle caption2SemiBold = baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle caption2Regular = baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle caption2BoldItalic = baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption2SemiBoldItalic = baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption2Italic = baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption3XBold = baseStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w800,
    height: 1.5,
  );

  static TextStyle caption3Bold = baseStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static TextStyle caption3SemiBold = baseStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle caption3Regular = baseStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle caption3XBoldItalic = baseStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption3BoldItalic = baseStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption3SemiBoldItalic = baseStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  static TextStyle caption3Italic = baseStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );
}
