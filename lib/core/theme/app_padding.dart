import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Defines standard padding values used throughout
/// the app for consistent UI design.
abstract final class AppPadding {
  AppPadding._();

  /// Default horizontal padding value.
  static EdgeInsets get defaultPad => EdgeInsets.symmetric(horizontal: 16.w);
}
