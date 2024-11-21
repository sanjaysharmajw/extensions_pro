part of '../extentions_pro.dart';

extension IntExtensions on int {
  String get toDurationString => '${this ~/ 60}m ${this % 60}s';

  String get toRoman {
    if (this < 1 || this > 3999) return "Invalid";
    final map = {
      1000: "M",
      900: "CM",
      500: "D",
      400: "CD",
      100: "C",
      90: "XC",
      50: "L",
      40: "XL",
      10: "X",
      9: "IX",
      5: "V",
      4: "IV",
      1: "I",
    };
    int num = this;
    final buffer = StringBuffer();
    map.forEach((key, value) {
      while (num >= key) {
        buffer.write(value);
        num -= key;
      }
    });
    return buffer.toString();
  }

  String toOrdinal() {
    if (this % 100 >= 11 && this % 100 <= 13) return "${this}th";
    switch (this % 10) {
      case 1:
        return "${this}st";
      case 2:
        return "${this}nd";
      case 3:
        return "${this}rd";
      default:
        return "${this}th";
    }
  }

  String toFileSize() {
    if (this < 1024) return "$this B";
    if (this < 1024 * 1024) return "${(this / 1024).toStringAsFixed(2)} KB";
    if (this < 1024 * 1024 * 1024)
      return "${(this / (1024 * 1024)).toStringAsFixed(2)} MB";
    return "${(this / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB";
  }

  String toWords() {
    if (this == 0) return 'zero';

    final units = [
      '',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine'
    ];
    final teens = [
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];
    final tens = [
      '',
      'ten',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];
    final thousands = ['', 'thousand', 'lakh', 'crore'];

    int num = this;
    String result = '';

    int placeValue = 0;

    while (num > 0) {
      if (placeValue == 0) {
        // Handle last two digits
        final lastTwoDigits = num % 100;
        if (lastTwoDigits < 10) {
          result = '${units[lastTwoDigits]} $result';
        } else if (lastTwoDigits > 10 && lastTwoDigits < 20) {
          result = '${teens[lastTwoDigits - 11]} $result';
        } else {
          result =
              '${tens[lastTwoDigits ~/ 10]} ${units[lastTwoDigits % 10]} $result';
        }
        num ~/= 100;
      } else {
        // Handle larger place values (thousands, lakhs, crores)
        final part = num % 100;
        if (part > 0) {
          result =
              '${units[part ~/ 10]} ${units[part % 10]} ${thousands[placeValue]} $result';
        }
        num ~/= 100;
      }
      placeValue++;
    }

    return result.trim();
  }

//toShortString
  String toShortString() {
    if (this >= 1000 && this < 1000000) {
      return '${(this / 1000).toStringAsFixed(1).replaceAll('.0', '')}K';
    } else if (this >= 1000000 && this < 1000000000) {
      return '${(this / 1000000).toStringAsFixed(1).replaceAll('.0', '')}M';
    } else if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(1).replaceAll('.0', '')}B';
    } else {
      return toString();
    }
  }
}
