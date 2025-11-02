import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Defines standard radius values used throughout
/// the app for consistent UI design.
abstract final class AppRadius {
  AppRadius._();

  /// Small radius value.
  static BorderRadius get small => BorderRadius.circular(8.r);

  /// Medium radius value. (default)
  static BorderRadius get medium => BorderRadius.circular(16.r);

  /// Large radius value.
  static BorderRadius get large => BorderRadius.circular(24.r);
}
