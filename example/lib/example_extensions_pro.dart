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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Asset Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.setStatusBarColor(Colors.blue, darkIcons: false);
              },
              child: const Text('Set Status Bar Color (Blue)'),
            ),
            ElevatedButton(
              onPressed: () {
                context.hideStatusBar();
              },
              child: const Text('Hide Status Bar'),
            ),
            ElevatedButton(
              onPressed: () {
                context.showStatusBar();
              },
              child: const Text('Show Status Bar'),
            ),
            ElevatedButton(
              onPressed: () {
                context.setStatusBarBrightness(Brightness.dark);
              },
              child: const Text('Set Status Bar Brightness to Dark'),
            ),
            ElevatedButton(
              onPressed: () {
                context.setStatusBarTextColor(true);
              },
              child: const Text('Set Status Bar Text to Dark'),
            ),
            ElevatedButton(
              onPressed: () {
                context.setStatusBarTextColor(false);
              },
              child: const Text('Set Status Bar Text to Light'),
            ),
          ],
        ),
      ),
    );
  }
}
