<div align="center">

![Logo](https://github.com/sanjaysharmajw/extensions_pro/blob/main/example/assets/extensions_pro.png?raw=true)

# Extensions Pro

**Supercharge your Flutter development with 60+ powerful, ready-to-use extensions.**

[![Pub Version](https://img.shields.io/pub/v/extensions_pro?color=blue&logo=dart)](https://pub.dev/packages/extensions_pro)
[![Pub Points](https://img.shields.io/pub/points/extensions_pro)](https://pub.dev/packages/extensions_pro/score)
[![Pub Popularity](https://img.shields.io/pub/popularity/extensions_pro)](https://pub.dev/packages/extensions_pro)
[![Pub Likes](https://img.shields.io/pub/likes/extensions_pro)](https://pub.dev/packages/extensions_pro)
[![Pub Publisher](https://img.shields.io/pub/publisher/extensions_pro)](https://pub.dev/publishers/sanjaysharmajw)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/sanjaysharmajw/extensions_pro/blob/main/LICENSE)

</div>

---

Extensions Pro eliminates boilerplate by adding expressive, chainable helpers directly onto Flutter's built-in types — `String`, `int`, `DateTime`, `List`, `Widget`, and `BuildContext`. Write less, ship faster.

## Table of Contents

- [Installation](#installation)
- [Extensions Overview](#extensions-overview)
- [Date Extensions](#date-extensions)
- [Time Extensions](#time-extensions)
- [Clock Extensions](#clock-extensions)
- [Image Network Extensions](#image-network-extensions)
- [Local Image Extensions](#local-image-extensions)
- [Validation Extensions](#validation-extensions)
- [Navigation Extensions](#navigation-extensions)
- [Widget Extensions](#widget-extensions)
- [String Extensions](#string-extensions)
- [Int Extensions](#int-extensions)
- [SnackBar Extensions](#snackbar-extensions)
- [List Extensions](#list-extensions)
- [Radio Button Extensions](#radio-button-extensions)
- [Distance Calculator](#distance-calculator)
- [Unit Conversion Extensions](#unit-conversion-extensions)
- [Status Bar Extensions](#status-bar-extensions)
- [Author](#author)
- [Support](#support)

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  extensions_pro: ^1.0.28
```

Then import in your Dart file:

```dart
import 'package:extensions_pro/extensions_pro.dart';
```

---

## Extensions Overview

| Category | Extension Type | Highlights |
|---|---|---|
| Date | `DateTime` | format, age, pickers, date math |
| Time | `DateTime` | formatted strings, morning/afternoon/evening |
| Clock | `DateTime` | digital clock strings |
| Image (Network) | `ImageNetworkExtensionsPro` | progress, rounded, cached, shadow |
| Image (Local) | `ImageLocalExtensionsPro` | progress, rounded, shadow, fitted box |
| Validation | `String` | email, phone, password, OTP, card, hex |
| Navigation | `BuildContext` | push, pop, replace, clear stack |
| Widget | `Widget` | padding, border, shadow, rounded, tap |
| String | `String` | capitalize, reverse, palindrome, camelCase |
| Int | `int` | roman, ordinal, words, file size, short |
| SnackBar | `BuildContext` | success, error, gradient, icon, persistent |
| List | `List<T>` | sort, find, chunk, dedup, toMap |
| Radio Button | `Widget` | custom radio button wrapper |
| Distance | `num` | Haversine geo distance (km) |
| Unit Conversion | `num` | 15 categories, 60+ conversions |
| Status Bar | `BuildContext` | color, brightness, show/hide |

---

## Date Extensions

```dart
// Date Picker
final date = await context.pickDate(
  dateFormatChange: 'yyyy-MM-dd',
  primaryColor: Colors.red,
  surfaceColor: Colors.white,
  headerTextColor: Colors.white,
);
// Output: "2024-11-06"

// Weekday from int (1 = Monday … 7 = Sunday)
3.toWeekDay();                    // "Wednesday"
3.toWeekDay(isHalfName: true);    // "Wed"

// Difference between two dates
final diff = DateTime(2024, 11, 19).differenceInDays(DateTime(2024, 11, 15));
diff.inDays;   // 4
diff.inHours;  // 96

// Format
DateTime.now().format('yyyy-MM-dd');   // "2024-11-25"
DateTime.now().format('dd MMM yyyy');  // "25 Nov 2024"

// Start / End of day
DateTime.now().startOfDay;  // 2024-11-25 00:00:00
DateTime.now().endOfDay;    // 2024-11-25 23:59:59

// Age
DateTime(1990, 11, 25).age;  // 34

// Relative checks
DateTime.now().isToday;      // true
DateTime.now().isYesterday;  // false
DateTime.now().isTomorrow;   // false

// Date arithmetic
DateTime.now().addDays(5);        // 5 days later
DateTime.now().subtractDays(10);  // 10 days earlier
DateTime.now().addMonths(3);      // 3 months later
DateTime.now().subtractYears(1);  // 1 year earlier

// Day name
DateTime.now().weekdayName;  // "Monday"
```

---

## Time Extensions

```dart
// Formatted strings
DateTime.now().currentDateFormatted;  // "2024-11-25"
DateTime.now().currentTimeFormatted;  // "14:30"

// Time-of-day checks
DateTime.now().isMorning;    // true  (before 12 PM)
DateTime.now().isAfternoon;  // false (12 PM – 6 PM)
DateTime.now().isEvening;    // false (after 6 PM)

// Time Picker
final picked = await context.pickTime();
picked?.format(context);  // "11:08 PM"
```

---

## Clock Extensions

```dart
// Live digital clock — call inside a Timer.periodic(Duration(seconds: 1), ...)
DateTime.now().toDigitalTimeWithSeconds();  // "11:42:32"
DateTime.now().toDigitalTime();             // "11:42"
```

---

## Image Network Extensions

```dart
// With progress indicator
ImageNetworkExtensionsPro.networkImageWithProgress(
  url: 'https://picsum.photos/200',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
);

// With rounded corners
ImageNetworkExtensionsPro.networkImageWithRoundedCorners(
  url: 'https://picsum.photos/200',
  width: 100,
  height: 100,
  borderRadius: 16.0,
);

// With placeholder widget
ImageNetworkExtensionsPro.networkImageWithPlaceholder(
  url: 'https://picsum.photos/200',
  width: 100,
  height: 100,
  placeholder: const Center(child: Text('Loading...')),
);

// Cached (uses cached_network_image)
ImageNetworkExtensionsPro.cachedNetworkImage(
  url: 'https://picsum.photos/200',
  width: 100,
  height: 100,
);

// With drop shadow
ImageNetworkExtensionsPro.networkImageWithShadow(
  url: 'https://picsum.photos/200',
  width: 100,
  height: 100,
  elevation: 10.0,
  shadowColor: Colors.black45,
);
```

---

## Local Image Extensions

```dart
// With progress indicator and error handling
ImageLocalExtensionsPro.assetImageWithProgress(
  'assets/logo.png',
  context: context,
  width: 150,
  height: 150,
);

// With rounded corners
ImageLocalExtensionsPro.assetImageWithRoundedCorners(
  'assets/logo.png',
  context: context,
  width: 150,
  height: 150,
  borderRadius: 16.0,
);

// With shadow
ImageLocalExtensionsPro.assetImageWithShadow(
  'assets/logo.png',
  context: context,
  width: 150,
  height: 150,
  elevation: 8.0,
  shadowColor: Colors.blueAccent,
);

// Scaled with FittedBox
ImageLocalExtensionsPro.assetImageWithFittedBox(
  'assets/logo.png',
  width: 150,
  height: 150,
);
```

---

## Validation Extensions

```dart
// Email
'user@example.com'.isValidEmail();    // true
'invalid-email'.isValidEmail();       // false

// Phone (E.164 format)
'+1234567890'.isValidPhoneNumber();   // true

// Password (min 8 chars, upper + lower + digit)
'Flutter@123'.isStrongPassword();     // true
'weak'.isStrongPassword();            // false

// Password match
'Pass123'.isPasswordMatch('Pass123'); // true
'Pass123'.isPasswordMatch('pass123'); // false

// OTP (exactly 6 digits)
'123456'.isValidOTP();  // true
'12345a'.isValidOTP();  // false

// Credit card (Luhn algorithm — handles spaces/dashes)
'4532015112830366'.isValidCreditCardNumber();    // true
'4532 0151 1283 0366'.isValidCreditCardNumber(); // true

// Hex color
'#FF5733'.isValidHexColor();  // true
'ZZZ'.isValidHexColor();      // false

// Digits only (no decimals or signs)
'123456'.isDigitsOnly();  // true
'12.34'.isDigitsOnly();   // false

// Alphanumeric
'Abc123'.isAlphaNumeric();   // true
'Abc@123'.isAlphaNumeric();  // false

// Geo coordinates
'37.7749'.isValidLatitude();    // true
'100.0'.isValidLatitude();      // false  (out of range)
'-122.4194'.isValidLongitude(); // true
'200.0'.isValidLongitude();     // false

// URL
'https://flutter.dev'.isValidUrl();  // true
'not a url'.isValidUrl();            // false
```

---

## Navigation Extensions

```dart
// Push a new screen
context.push(const DetailScreen());

// Replace the current screen
context.pushReplacement(const HomeScreen());

// Pop back
context.pop();

// Pop with a result
context.pop('result');

// Clear the entire stack and push a new screen
context.pushAndRemoveUntil(const LoginScreen());
```

---

## Widget Extensions

All extensions are chainable:

```dart
// Individual usage
Text('Hello').withPadding(const EdgeInsets.all(16));
Text('Hello').withMargin(const EdgeInsets.all(8));
Text('Hello').centered();
Text('Hello').withBorder(color: Colors.blue, width: 2.0);
Text('Hello').withShadow(blurRadius: 8.0, color: Colors.black26);
Text('Hello').withRoundedCorners(radius: 12.0);
Text('Hello').withVisibility(isLoggedIn);
Text('Hello').onTap(() => print('tapped'));

// Chained
Text('Hello World')
  .withPadding(const EdgeInsets.all(16))
  .withBorder(color: Colors.blue, width: 2.0)
  .withShadow(blurRadius: 8.0)
  .withRoundedCorners(radius: 12.0);
```

---

## String Extensions

```dart
'flutter'.capitalize();                    // "Flutter"
'flutter'.reverse();                       // "rettulf"
'snake_case_string'.toCamelCase();         // "SnakeCaseString"
'Flutter is awesome'.removeWhitespace();   // "FlutterisAwesome"  — wait, removes spaces
'Flutter is amazing'.truncate(10);         // "Flutter is..."
'Order1234'.extractNumbers();              // "1234"
'madam'.isPalindrome();                    // true
'flutter'.isPalindrome();                  // false
'flutter is fun'.countOccurrences('u');    // 2
'123'.isNumeric();                         // true  (parses as double)
'abc'.isNumeric();                         // false
```

---

## Int Extensions

```dart
// Duration string
125.toDurationString;   // "2m 5s"

// Roman numerals (1–3999)
1990.toRoman;           // "MCMXC"
4.toRoman;              // "IV"

// Ordinal
1.toOrdinal();          // "1st"
22.toOrdinal();         // "22nd"
103.toOrdinal();        // "103rd"
11.toOrdinal();         // "11th"

// File size
1024.toFileSize();      // "1.00 KB"
1048576.toFileSize();   // "1.00 MB"
512.toFileSize();       // "512 B"

// Short format
12340.toShortString();    // "12.3K"
1200000.toShortString();  // "1.2M"

// Number to words (Indian system)
1234.toWords();           // "one thousand two hundred thirty four"
100000.toWords();         // "one lakh"
10000000.toWords();       // "one crore"

// Weekday name (1 = Monday, 7 = Sunday)
3.toWeekDay();                 // "Wednesday"
3.toWeekDay(isHalfName: true); // "Wed"
```

---

## SnackBar Extensions

```dart
// Success (green)
context.showSuccessSnackBar('Saved successfully!');

// Error (red)
context.showErrorSnackBar('Something went wrong!');

// Custom color and duration
context.showCustomSnackBar(
  message: 'Custom message',
  backgroundColor: Colors.indigo,
  duration: const Duration(seconds: 4),
  action: SnackBarAction(label: 'UNDO', onPressed: () {}),
);

// With icon
context.showIconSnackBar(
  message: 'Data saved!',
  icon: Icons.check_circle,
  backgroundColor: Colors.green,
);

// Gradient (purple → blue)
context.showGradientSnackBar('Beautiful gradient!');

// Persistent (stays until dismissed)
context.showPersistentSnackBar(
  message: 'Tap DISMISS to close.',
  dismissColor: Colors.white,
);
```

---

## List Extensions

```dart
final numbers = [1, 2, 3, 4, 5, 6, 6, 7, 8, 9];

numbers.firstOrDefault();         // 1
numbers.lastOrDefault();          // 9

numbers.addIfNotExists(10);       // adds 10 only if not present
numbers.removeDuplicates();       // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.safeSublist(2, 5);        // [3, 4, 5]  — no RangeError
numbers.find((x) => x > 5);      // 6

// Sort by property
final names = ['Zara', 'Anna', 'Mike'];
names.sortBy((n) => n);                        // ['Anna', 'Mike', 'Zara']
names.sortBy((n) => n, descending: true);      // ['Zara', 'Mike', 'Anna']

// Convert to map
numbers.toMap((x) => x.toString());
// {'1': 1, '2': 2, '3': 3, ...}

// Indexed iteration
numbers.forEachIndexed((index, item) {
  print('[$index] $item');
});

// Split into chunks
numbers.chunked(3);
// [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
```

---

## Radio Button Extensions

![Radio Button Preview](https://raw.githubusercontent.com/sanjaysharmajw/extensions_pro/main/example/assets/radio_button.png)

Attach a custom radio indicator to **any widget**:

```dart
String _selected = 'Option 1';

Column(
  children: ['Option 1', 'Option 2', 'Option 3'].map((option) =>
    Text(option)
      .radioButton<String>(
        value: option,
        groupValue: _selected,
        activeColor: Colors.green,
        inactiveColor: Colors.green.shade100,
        size: 22,
        onChanged: (val) => setState(() => _selected = val!),
      )
      .withPadding(const EdgeInsets.symmetric(vertical: 6)),
  ).toList(),
);
```

---

## Distance Calculator

Uses the Haversine formula for accurate great-circle distance.

```dart
final distance = 0.calculateDistance(
  startLatitude: 28.7041,   // Delhi
  startLongitude: 77.1025,
  endLatitude: 19.0760,     // Mumbai
  endLongitude: 72.8777,
);

print('${distance.toStringAsFixed(2)} km');  // 1158.91 km
```

---

## Unit Conversion Extensions

All conversions are extension getters/methods on `num` (works with `int` and `double`).

```dart
// ── Length ────────────────────────────────────
5000.toKilometersPro;             // m → km
5000.toMilesPro;                  // m → mi
5000.toMetersFromFeetPro;         // ft → m
5000.toCentimetersFromInchesPro;  // in → cm
5000.toInchesFromCentimetersPro;  // cm → in

// ── Temperature ───────────────────────────────
25.toFahrenheitPro;  // °C → °F  → 77.0
77.toCelsiusPro;     // °F → °C  → 25.0

// ── Area ──────────────────────────────────────
10000.toAcresPro;          // m² → acres
10000.toSquareMetersPro;   // ft² → m²

// ── Weight ────────────────────────────────────
70.toPoundsPro;      // kg → lb
154.toKilogramsPro;  // lb → kg
28.toGramsPro;       // oz → g
100.toOuncesPro;     // g  → oz

// ── Speed ─────────────────────────────────────
100.toMilesPerHourPro;       // km/h → mph
62.toKilometersPerHourPro;   // mph  → km/h

// ── Time ──────────────────────────────────────
3600.toMinutesPro;  // s  → min  → 60.0
3600.toHoursPro;    // s  → hr   → 1.0
24.toDaysPro;       // hr → days → 1.0

// ── Volume ────────────────────────────────────
100.toGallonsPro;                    // L  → gal
10.toLitersPro;                      // gal → L
1.toCubicFeetPro;                    // m³ → ft³
35.toCubicMetersFromCubicFeetPro;    // ft³ → m³

// ── Digital Storage ───────────────────────────
2048.toGBPro;         // MB → GB
2.toMBPro;            // GB → MB
500.toKilobytesPro;   // MB → KB
512.toMegabytesPro;   // KB → MB

// ── Energy ────────────────────────────────────
1000.toCaloriesPro;  // J   → cal
239.toJoulesPro;     // cal → J

// ── Pressure ──────────────────────────────────
101325.toBarPro;    // Pa  → bar
1.toPascalPro;      // atm → Pa

// ── Angle ─────────────────────────────────────
90.toRadiansPro;     // deg → rad  → 1.5708
1.5708.toDegreesPro; // rad → deg  → 90.0

// ── Currency (indicative rates) ───────────────
100.toEURPro;  // USD → EUR
92.toUSDPro;   // EUR → USD

// ── Electricity ───────────────────────────────
1.5.toMillivoltsPro;          // V  → mV
1500.toVoltsFromMillivoltsPro; // mV → V

// ── Fuel Efficiency ───────────────────────────
25.toLPer100kmPro;  // MPG  → L/100km
9.41.toMPGPro;      // L/100km → MPG

// ── Power ─────────────────────────────────────
500.toKilowattsPro;   // W  → kW
0.5.toWattsPro;       // kW → W

// ── Data Rate ─────────────────────────────────
10.toKbpsPro;    // Mbps → Kbps
10000.toMbpsPro; // Kbps → Mbps

// ── Power Consumption ─────────────────────────
1000.toKilowattHoursPro;  // Wh → kWh
1.toWattHoursPro;         // kWh → Wh
```

---

## Status Bar Extensions

```dart
// Set color and icon brightness
context.setStatusBarColor(Colors.blue, darkIcons: false);

// Hide the status bar completely
context.hideStatusBar();

// Restore the status bar
context.showStatusBar();

// Set brightness
context.setStatusBarBrightness(Brightness.dark);

// Set icon color only
context.setStatusBarTextColor(true);   // dark icons
context.setStatusBarTextColor(false);  // light icons
```

---

## Author

**Sanjay Sharma** — Full-Stack & Cross-Platform Mobile Developer  
Android · iOS · Swift · Flutter · Dart · Node.js

[![GitHub](https://img.shields.io/badge/GitHub-@sanjaysharmajw-181717?logo=github)](https://github.com/sanjaysharmajw)

---

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/sanjaysharmajw/extensions_pro/blob/main/LICENSE)

---

## Support

If Extensions Pro saved you time, consider buying me a coffee — it keeps the extensions coming! ☕

[![Buy Me A Coffee](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/sanjaysharmajw)
