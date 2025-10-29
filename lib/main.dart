import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(PulseChainApp());
}

class PulseChainApp extends StatelessWidget {
  const PulseChainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseChain Wallet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('PulseChain Wallet Home')),
        body: Center(child: Text('Welcome to PulseChain Wallet!')),
      ),
    );
  }
}
