import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ExampleExtensionsPro extends StatelessWidget {
  const ExampleExtensionsPro({super.key});

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
            ImageLocalAssetExtensionsPro.assetImageWithProgress(
              'assets/extensions_logo.png',
              width: 150,
              height: 150,
              loadingWidget: const Center(child: CircularProgressIndicator()),
              context: context,
            ),
            const SizedBox(height: 20),

            // 2. Image with Rounded Corners
            ImageLocalAssetExtensionsPro.assetImageWithRoundedCorners(
              'assets/extensions_logo.png',
              width: 150,
              height: 150,
              borderRadius: 16.0,
              context: context,
            ),
            const SizedBox(height: 20),

            // 3. Image with Shadow
            ImageLocalAssetExtensionsPro.assetImageWithShadow(
              'assets/extensions_logo.png',
              width: 150,
              height: 150,
              elevation: 8.0,
              shadowColor: Colors.blueAccent,
              context: context,
            ),
            const SizedBox(height: 20),
            // 4. Image with Fitted Box for Scaling
            ImageLocalAssetExtensionsPro.assetImageWithFittedBox(
              'assets/extensions_logo.png',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
