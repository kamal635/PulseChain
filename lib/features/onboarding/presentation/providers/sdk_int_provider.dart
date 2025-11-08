import 'package:device_info_plus/device_info_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Returns Android SDK int (e.g., 30, 31, 34…) or null on non-Android / failure.
/// Treat `null` in UI as Android 12+ (i.e., Location not required).
final sdkIntProvider = FutureProvider<int?>((ref) async {
  final deviceInfo = DeviceInfoPlugin();
  try {
    final android = await deviceInfo.androidInfo; // throws on non-Android
    return android.version.sdkInt;
  } on Exception catch (_) {
    return null; // iOS/Web/desktop or any failure → handle as 12+ in UI
  }
});
