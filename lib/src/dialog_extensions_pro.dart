import 'package:flutter/material.dart';

extension DialogExtensionsPro on BuildContext {
  /// Shows a non-dismissible loading dialog with a centered spinner.
  /// Dismiss it with [hideLoadingDialog].
  void showLoadingDialog({bool barrierDismissible = false}) {
    showDialog<void>(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  /// Closes the dialog opened by [showLoadingDialog].
  void hideLoadingDialog() {
    Navigator.of(this, rootNavigator: true).pop();
  }

  /// Shows a Yes/No confirmation dialog and returns `true` if confirmed,
  /// `false` if cancelled or dismissed.
  Future<bool> showConfirmDialog({
    required String title,
    required String message,
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) async {
    final result = await showDialog<bool>(
      context: this,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
