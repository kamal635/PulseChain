import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const PulseChainApp());
}

/// Root application widget for PulseChain.
///
/// Sets up a temporary `MaterialApp` skeleton (theme + home) until
/// we wire GoRouter and the real initial route.
class PulseChainApp extends StatelessWidget {
  /// Creates a [PulseChainApp] root widget.
  const PulseChainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseChain Wallet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('PulseChain Wallet Home')),
        body: const Center(child: Text('Welcome to PulseChain Wallet!')),
      ),
    );
  }
}
