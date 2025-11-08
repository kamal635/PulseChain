import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/wizard_index_provider.dart';

/// PageController shared by the Permissions Wizard page.
/// Auto-disposed with the widget's lifecycle.

final Provider<PageController> wizardPageControllerProvider =
    Provider.autoDispose<PageController>((ref) {
      /// Initialize PageController with the current wizard index.
      final initial = ref.read(wizardIndexProvider);

      /// Create and return the PageController.
      final controller = PageController(initialPage: initial);
      ref.onDispose(controller.dispose);
      return controller;
    });
