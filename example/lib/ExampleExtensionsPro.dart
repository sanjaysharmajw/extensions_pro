import 'package:extensions_pro/extentions_pro.dart';
import 'package:flutter/material.dart';

class ExampleExtensionsPro extends StatefulWidget {
  const ExampleExtensionsPro({super.key});

  @override
  State<ExampleExtensionsPro> createState() => _ExampleExtensionsProState();
}

class _ExampleExtensionsProState extends State<ExampleExtensionsPro> {
  @override
  Widget build(BuildContext context) {
    int number = 100000000;
    print(number.toShortString()); // Output: 12K
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {}, child:  Text(number.toShortString()))
        ],
      ),
    ));
  }
}
