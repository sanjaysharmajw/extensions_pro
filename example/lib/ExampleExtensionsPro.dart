import 'package:flutter/material.dart';

class ExampleExtensionsPro extends StatefulWidget {
  const ExampleExtensionsPro({super.key});

  @override
  State<ExampleExtensionsPro> createState() => _ExampleExtensionsProState();
}

class _ExampleExtensionsProState extends State<ExampleExtensionsPro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {}, child: const Text("Extensions Pro"))
        ],
      ),
    ));
  }
}
