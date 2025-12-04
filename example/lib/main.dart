import 'package:example/example_extensions_pro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Radio Buttons')),
        body: const ExampleExtensionsPro(),
      ),
    );
  }
}



