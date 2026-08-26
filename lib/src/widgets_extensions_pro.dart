import 'package:flutter/material.dart';

extension WidgetsExtensionsPro on Widget {
  /// Adds padding to the widget
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  /// Adds margin to the widget
  Widget withMargin(EdgeInsetsGeometry margin) {
    return Container(
      margin: margin,
      child: this,
    );
  }

  /// Centers the widget inside a container
  Widget centered() {
    return Center(
      child: this,
    );
  }

  /// Adds a border around the widget
  Widget withBorder({
    Color color = Colors.black,
    double width = 1.0,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width),
      ),
      child: this,
    );
  }

  /// Adds a shadow to the widget
  Widget withShadow({
    Color color = Colors.black,
    double blurRadius = 5.0,
    Offset offset = const Offset(0, 2),
    double spreadRadius = 0.0,
  }) {
    return Material(
      elevation: blurRadius,
      shadowColor: color,
      child: this,
    );
  }

  /// Converts the widget into a rounded container
  Widget withRoundedCorners({
    double radius = 8.0,
    Color? color,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: color != null
          ? Container(
              color: color,
              child: this,
            )
          : this,
    );
  }

  /// Applies a `GestureDetector` to detect taps
  Widget onTap(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  /// Applies a `Visibility` widget to show or hide the widget
  Widget withVisibility(bool isVisible) {
    return Visibility(
      visible: isVisible,
      child: this,
    );
  }

  /// Wraps the widget in an `Opacity` widget
  Widget withOpacity(double opacity) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  /// Applies a `GestureDetector` to detect long presses
  Widget onLongPress(Function() onLongPress) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: this,
    );
  }

  /// Constrains the widget to a fixed [aspectRatio] (width / height)
  Widget withAspectRatio(double aspectRatio) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: this,
    );
  }

  /// Wraps the widget in a `SafeArea`
  Widget withSafeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  /// Wraps the widget in a `Container` with the given background [color]
  Widget withBackgroundColor(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }

  /// Wraps the widget in a `Hero` for shared-element transitions
  Widget withHero(Object tag) {
    return Hero(
      tag: tag,
      child: this,
    );
  }
}
