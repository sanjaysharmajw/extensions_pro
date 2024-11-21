import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ExampleExtensionsPro extends StatefulWidget {
  const ExampleExtensionsPro({super.key});

  @override
  State<ExampleExtensionsPro> createState() => _ExampleExtensionsProState();
}

class _ExampleExtensionsProState extends State<ExampleExtensionsPro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {},
              child: Text('sanjay@gmail.com'.isValidEmail().toString()))
        ],
      ),
    ));
  }
}
