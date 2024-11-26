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
          children: [
            // 1. Image with Progress Indicator and Error Handling
            ImageLocalExtensionsPro.assetImageWithProgress(
                'assets/extensions_pro.png',
                width: 150,
                height: 150,
                loadingWidget: const Center(child: CircularProgressIndicator()),
                context: context),
            // 2. Image with Rounded Corners
            ImageLocalExtensionsPro.assetImageWithRoundedCorners(
              'assets/extensions_pro.png',
              width: 150,
              height: 150,
              borderRadius: 16.0,
              context: context,
            ),
            const SizedBox(height: 20),
            // 3. Image with Shadow
            ImageLocalExtensionsPro.assetImageWithShadow(
              'assets/extensions_pro.png',
              width: 150,
              height: 150,
              elevation: 8.0,
              shadowColor: Colors.blueAccent,
              context: context,
            ),
            const SizedBox(height: 20),
            // 4. Image with Fitted Box for Scaling
            ImageLocalExtensionsPro.assetImageWithFittedBox(
              'assets/extensions_pro.png',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
