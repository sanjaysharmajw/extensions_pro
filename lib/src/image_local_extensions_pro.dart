import 'package:flutter/material.dart';

class ImageLocalAssetExtensionsPro {
  // 1. Image with Progress Indicator and Error Handling
  static Widget assetImageWithProgress(
    String asset, {
    required BuildContext context,
    double? width,
    double? height,
    BoxFit? fit,
    Widget? errorWidget,
    Widget? loadingWidget,
  }) {
    return FutureBuilder(
      future: precacheImage(AssetImage(asset), context), // Preload the image
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget ??
              const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return errorWidget ??
              const Center(
                child: Icon(Icons.error, color: Colors.red, size: 50),
              );
        } else {
          return Image.asset(
            asset,
            width: width,
            height: height,
            fit: fit,
          );
        }
      },
    );
  }

  // 2. Image with Rounded Corners
  static Widget assetImageWithRoundedCorners(
    String asset, {
    required BuildContext context,
    double? width,
    double? height,
    BoxFit? fit,
    double borderRadius = 8.0,
    Widget? errorWidget,
    Widget? loadingWidget,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: assetImageWithProgress(
        asset,
        width: width,
        height: height,
        fit: fit,
        errorWidget: errorWidget,
        loadingWidget: loadingWidget,
        context: context,
      ),
    );
  }

  // 3. Image with Shadow
  static Widget assetImageWithShadow(
    String asset, {
    required BuildContext context,
    double? width,
    double? height,
    BoxFit? fit,
    double borderRadius = 8.0,
    double elevation = 5.0,
    Color shadowColor = Colors.black26,
    Widget? errorWidget,
    Widget? loadingWidget,
  }) {
    return Material(
      elevation: elevation,
      shadowColor: shadowColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: assetImageWithProgress(
          asset,
          width: width,
          height: height,
          fit: fit,
          errorWidget: errorWidget,
          loadingWidget: loadingWidget,
          context: context,
        ),
      ),
    );
  }

  // 4. Image with Fitted Box for Scaling
  static Widget assetImageWithFittedBox(
    String asset, {
    double? width,
    double? height,
    Widget? errorWidget,
  }) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Image.asset(
        asset,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ??
              const Center(
                child: Icon(Icons.error, color: Colors.red, size: 50),
              );
        },
      ),
    );
  }
}
