import 'package:hooks_riverpod/legacy.dart';

/// Current step index for the permissions wizard (0-based).
final wizardIndexProvider = StateProvider<int>((ref) => 0);
