import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:pulse_chain/domain/entities/permission_types.dart' as domain;
import 'package:pulse_chain/features/onboarding/presentation/providers/sdk_int_provider.dart';

/// Lock to prevent concurrent Bluetooth permission requests.
final btRequestInFlightProvider = StateProvider<bool>((_) => false);

/// --- Helpers --------------------------------------------------------------

bool _isBlocked(ph.PermissionStatus s) =>
    s == ph.PermissionStatus.permanentlyDenied ||
    s == ph.PermissionStatus.restricted;

/// Map permission_handler statuses to the domain PermissionStatus.
domain.PermissionStatus _mapToDomain(
  ph.PermissionStatus scan,
  ph.PermissionStatus connect,
) {
  if (scan == ph.PermissionStatus.granted &&
      connect == ph.PermissionStatus.granted) {
    return domain.PermissionStatus.granted;
  }
  if (_isBlocked(scan) || _isBlocked(connect)) {
    return domain.PermissionStatus.denied;
  }
  return domain.PermissionStatus.notGrantedYet;
}

/// Read the current Bluetooth permission status (without prompting the user).
Future<domain.PermissionStatus> _readBluetoothStatus() async {
  final scan = await ph.Permission.bluetoothScan.status;
  final connect = await ph.Permission.bluetoothConnect.status;
  return _mapToDomain(scan, connect);
}

/// --- Provider: read-only status for the UI -------------------------------

final bluetoothStatusProvider = FutureProvider<domain.PermissionStatus>((
  ref,
) async {
  // Non-Android platforms → treat as granted.
  if (kIsWeb || !Platform.isAndroid) {
    return domain.PermissionStatus.granted;
  }

  // API ≤ 30 → no runtime Bluetooth permission.
  final sdk = await ref.watch(sdkIntProvider.future).catchError((_) => null);
  if (sdk != null && sdk <= 30) {
    return domain.PermissionStatus.granted;
  }

  // Android 12+ → read actual status.
  return _readBluetoothStatus();
});

/// --- Action: request permissions and refresh the UI ----------------------

Future<domain.PermissionStatus> requestBluetoothPermissions(
  WidgetRef ref,
) async {
  // Non-Android.
  if (kIsWeb || !Platform.isAndroid) return domain.PermissionStatus.granted;

  // API ≤ 30.
  final sdk = await ref.read(sdkIntProvider.future).catchError((_) => null);
  if (sdk != null && sdk <= 30) return domain.PermissionStatus.granted;

  // 1) Check current status first.
  final now = await _readBluetoothStatus();
  if (now == domain.PermissionStatus.granted ||
      now == domain.PermissionStatus.denied) {
    // Either already granted, or permanently blocked (open settings later).
    return now;
  }

  // 2) Guard: prevent concurrent requests.
  if (ref.read(btRequestInFlightProvider)) {
    return domain.PermissionStatus.notGrantedYet;
  }
  ref.read(btRequestInFlightProvider.notifier).state = true;

  try {
    // 3) Request SCAN + CONNECT in one shot.
    final results = await <ph.Permission>[
      ph.Permission.bluetoothScan,
      ph.Permission.bluetoothConnect,
    ].request();

    final scan = results[ph.Permission.bluetoothScan]!;
    final connect = results[ph.Permission.bluetoothConnect]!;
    final mapped = _mapToDomain(scan, connect);

    // 4) Invalidate the reader provider so chips refresh.
    ref.invalidate(bluetoothStatusProvider);

    return mapped;
  } finally {
    ref.read(btRequestInFlightProvider.notifier).state = false;
  }
}
