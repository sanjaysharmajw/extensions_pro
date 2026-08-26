import 'package:flutter/material.dart';

extension NavigationExtensionsPro on BuildContext {
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

  /// Pushes a named route onto the navigation stack
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) async {
    return await Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  /// Pops routes until the one with [routeName] is reached
  void popUntil(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }

  /// True if there is a route available to pop
  bool get canPop => Navigator.canPop(this);
}
