extension IntExtensionsPro on int {
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
    if (this < 1024 * 1024 * 1024) {
      return "${(this / (1024 * 1024)).toStringAsFixed(2)} MB";
    }
    return "${(this / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB";
  }

  String toWords() {
    if (this == 0) return 'zero';

    const unitWords = [
      '', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine',
      'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
      'seventeen', 'eighteen', 'nineteen',
    ];
    const tensWords = [
      '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety',
    ];

    String convert(int n) {
      if (n == 0) return '';
      if (n < 20) return unitWords[n];
      if (n < 100) {
        final rem = n % 10;
        return rem == 0 ? tensWords[n ~/ 10] : '${tensWords[n ~/ 10]} ${unitWords[rem]}';
      }
      if (n < 1000) {
        final rem = n % 100;
        return '${unitWords[n ~/ 100]} hundred${rem == 0 ? '' : ' ${convert(rem)}'}';
      }
      if (n < 100000) {
        final rem = n % 1000;
        return '${convert(n ~/ 1000)} thousand${rem == 0 ? '' : ' ${convert(rem)}'}';
      }
      if (n < 10000000) {
        final rem = n % 100000;
        return '${convert(n ~/ 100000)} lakh${rem == 0 ? '' : ' ${convert(rem)}'}';
      }
      final rem = n % 10000000;
      return '${convert(n ~/ 10000000)} crore${rem == 0 ? '' : ' ${convert(rem)}'}';
    }

    return convert(this);
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
