
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
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
}
