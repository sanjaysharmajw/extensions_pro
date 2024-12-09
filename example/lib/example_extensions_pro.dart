import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ExampleExtensionsPro extends StatefulWidget {
  const ExampleExtensionsPro({super.key});
  @override
  State<ExampleExtensionsPro> createState() => _ExampleExtensionsProState();
}

class _ExampleExtensionsProState extends State<ExampleExtensionsPro> {
  @override
  Widget build(BuildContext context) {
    const double startLatitude = 28.7041; // Example: Delhi, India
    const double startLongitude = 77.1025;
    const double endLatitude = 19.0760; // Example: Mumbai, India
    const double endLongitude = 72.8777;

    final distance = 0.calculateDistance(
      startLatitude: startLatitude,
      startLongitude: startLongitude,
      endLatitude: endLatitude,
      endLongitude: endLongitude,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Asset Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: Text(distance.toStringAsFixed(2)))
          ],
        ),
      ),
    );
  }
}
