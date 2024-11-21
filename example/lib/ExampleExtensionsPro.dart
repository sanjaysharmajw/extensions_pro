import 'package:extensions_pro/extentions_pro.dart';
import 'package:flutter/material.dart';

class ExampleExtensionsPro extends StatefulWidget {
  const ExampleExtensionsPro({super.key});

  @override
  State<ExampleExtensionsPro> createState() => _ExampleExtensionsProState();
}

class _ExampleExtensionsProState extends State<ExampleExtensionsPro> {
  String currentTime = DateTime.now().toDigitalTimeWithSeconds();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _updateTime);
  }

  void _updateTime() {
    setState(() {
      currentTime = DateTime.now().toDigitalTimeWithSeconds();
    });
    Future.delayed(const Duration(seconds: 1), _updateTime);
  }

  @override
  Widget build(BuildContext context) {
    int number = 1000;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () async {}, child: Text(currentTime))
        ],
      ),
    ));
  }
}
