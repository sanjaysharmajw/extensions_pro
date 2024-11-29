import 'package:flutter/material.dart';

extension SnackBarExtensions on BuildContext {
  // Custom SnackBar with Helper Method
  void showCustomSnackBar({
    required String message,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
      ),
    );
  }

//SnackBar for Success and Error
  void showSuccessSnackBar(String message) {
    showCustomSnackBar(
      message: message,
      backgroundColor: Colors.green,
    );
  }

  void showErrorSnackBar(String message) {
    showCustomSnackBar(
      message: message,
      backgroundColor: Colors.red,
    );
  }

  //SnackBar with Icons
  void showIconSnackBar({
    required String message,
    required IconData icon,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }

  //SnackBar with Gradient
  void showGradientSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.blue],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //SnackBar with Custom Duration
  void showPersistentSnackBar(
      {required String message, required Color dismissColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(days: 1),
        action: SnackBarAction(
          textColor: dismissColor,
          label: 'DISMISS',
          onPressed: () => ScaffoldMessenger.of(this).hideCurrentSnackBar(),
        ),
      ),
    );
  }
}
