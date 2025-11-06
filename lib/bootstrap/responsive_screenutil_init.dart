import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Device classes based on logical width (dp).
enum DeviceClass {
  /// Small phones and devices.
  compact,

  /// Average phones.
  medium,

  /// Large phones.
  large,

  /// Tablets and foldables.
  tablet,
}

/// Wrap your app with this instead of ScreenUtilInit to auto-pick a designSize.
class ResponsiveScreenUtilInit extends StatelessWidget {
  /// Creates a [ResponsiveScreenUtilInit] instance.
  const ResponsiveScreenUtilInit({
    required this.builder,
    super.key,
    this.textScaleFactorClamp = const RangeValues(0.85, 1.15),
  });

  /// Your app root builder (MaterialApp.router ...)
  final WidgetBuilder builder;

  /// Optional: clamp extreme system text scales to keep UI stable.
  final RangeValues textScaleFactorClamp;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final klass = _classForWidth(width);
        final designSize = _designSizeFor(klass);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, _) {
            // Clamp text scale to a sane range
            final media = MediaQuery.of(context);
            // Clamp using TextScaler (new API)
            final clampedScaler = media.textScaler.clamp(
              minScaleFactor: textScaleFactorClamp.start,
              maxScaleFactor: textScaleFactorClamp.end,
            );
            return MediaQuery(
              data: media.copyWith(textScaler: clampedScaler),
              child: Builder(builder: builder),
            );
          },
        );
      },
    );
  }

  // Map width → device class (tweak if you like).
  static DeviceClass _classForWidth(double w) {
    if (w >= 600) return DeviceClass.tablet; // portrait tablets & foldables
    if (w >= 412) {
      return DeviceClass.large; // large phones (Pixel 6+/iPhone Plus)
    }

    if (w >= 360) return DeviceClass.medium; // most phones
    return DeviceClass.compact; // very small phones
  }

  // Pick a baseline size per class (stable, well-known baselines).
  static Size _designSizeFor(DeviceClass c) {
    switch (c) {
      case DeviceClass.compact:
        return const Size(360, 800);
      case DeviceClass.medium:
        return const Size(375, 812);
      case DeviceClass.large:
        return const Size(412, 915);
      case DeviceClass.tablet:
        return const Size(768, 1024);
    }
  }
}
