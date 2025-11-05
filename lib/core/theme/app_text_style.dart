import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Defines standard text styles used throughout
abstract final class AppTextStyle {
  AppTextStyle._();

  /// Heading text style.
  static TextStyle get heading => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF333333),
  );

  /// Body text style.
  static TextStyle get subtitle => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: const Color(0xFF666666),
  );

  /// Caption text style.
  static TextStyle get caption => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    color: const Color(0xFF888888),
  );

  /// Button text style.
  static TextStyle get button => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

  /// Subtitle text style.
  static TextStyle get body => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF444444),
  );
}
