
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Pushes a new screen onto the navigation stack
  Future<T?> push<T>(Widget page) async {
    return await Navigator.push(
      this,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replaces the current screen with a new screen
  Future<T?> pushReplacement<T, TO>(Widget page) async {
    return await Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Pops the current screen off the navigation stack
  void pop<T>([T? result]) {
    Navigator.pop(this, result);
  }

  /// Pushes a new screen and clears the entire navigation stack
  Future<T?> pushAndRemoveUntil<T>(Widget page) async {
    return await Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => page),
          (route) => false,
    );
  }
}
