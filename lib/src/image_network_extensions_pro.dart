import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageNetworkExtensionsPro {
  /// Displays an image with a progress indicator and error widget
  static Widget networkImageWithProgress({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    Widget? errorWidget,
    Widget? loadingWidget,
  }) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return loadingWidget ??
            Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Center(
              child: Icon(Icons.error, color: Colors.red, size: width ?? 50),
            );
      },
    );
  }

  /// Displays a network image with rounded corners
  static Widget networkImageWithRoundedCorners({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    double borderRadius = 8.0,
    Widget? errorWidget,
    Widget? loadingWidget,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: networkImageWithProgress(
        url: url,
        width: width,
        height: height,
        fit: fit,
        errorWidget: errorWidget,
        loadingWidget: loadingWidget,
      ),
    );
  }

  /// Displays a network image with a placeholder
  static Widget networkImageWithPlaceholder({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            const Center(
              child: CircularProgressIndicator(),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Center(
              child: Icon(Icons.broken_image,
                  color: Colors.grey, size: width ?? 50),
            );
      },
    );
  }

  /// Displays a cached network image
  static Widget cachedNetworkImage({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) {
        return placeholder ??
            const Center(
              child: CircularProgressIndicator(),
            );
      },
      errorWidget: (context, url, error) {
        return errorWidget ??
            Center(
              child: Icon(Icons.broken_image,
                  color: Colors.grey, size: width ?? 50),
            );
      },
    );
  }

  /// Displays a network image with a shadow
  static Widget networkImageWithShadow({
    required String url,
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
        child: networkImageWithProgress(
          url: url,
          width: width,
          height: height,
          fit: fit,
          errorWidget: errorWidget,
          loadingWidget: loadingWidget,
        ),
      ),
    );
  }
}
