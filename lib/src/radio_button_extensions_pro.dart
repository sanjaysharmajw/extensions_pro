import 'package:flutter/material.dart';

extension CustomRadioButton on Widget {
  Widget radioButton<T>({
    required T value,
    required T groupValue,
    required ValueChanged<T?> onChanged,
    Color activeColor = Colors.blue,
    Color inactiveColor = Colors.grey,
    double size = 24.0,
  }) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: value == groupValue ? activeColor : inactiveColor,
                width: 2,
              ),
            ),
            child: value == groupValue
                ? Center(
                    child: Container(
                      height: size / 2,
                      width: size / 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: activeColor,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 8),
          this, // Widget passed to the extension
        ],
      ),
    );
  }
}
