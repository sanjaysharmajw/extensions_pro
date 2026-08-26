<div align="center">

![Logo](https://github.com/sanjaysharmajw/extensions_pro/blob/main/example/assets/extensions_pro.png?raw=true)

# Extensions Pro

**Supercharge your Flutter development with 140+ powerful, ready-to-use extensions.**

[![Pub Version](https://img.shields.io/pub/v/extensions_pro?color=blue&logo=dart)](https://pub.dev/packages/extensions_pro)
[![Pub Points](https://img.shields.io/pub/points/extensions_pro)](https://pub.dev/packages/extensions_pro/score)
[![Pub Popularity](https://img.shields.io/pub/popularity/extensions_pro)](https://pub.dev/packages/extensions_pro)
[![Pub Likes](https://img.shields.io/pub/likes/extensions_pro)](https://pub.dev/packages/extensions_pro)
[![Pub Publisher](https://img.shields.io/pub/publisher/extensions_pro)](https://pub.dev/publishers/sanjaysharmajw)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/sanjaysharmajw/extensions_pro/blob/main/LICENSE)

</div>

---

Extensions Pro eliminates boilerplate by adding expressive, chainable helpers directly onto Flutter's built-in types — `String`, `int`, `DateTime`, `List`, `Widget`, and `BuildContext`. Write less, ship faster.

- **Zero setup** — pure Dart/Flutter extension methods, no code generation, no context providers.
- **Chainable API** — widget extensions compose naturally (`.withPadding().withBorder().withShadow()`).
- **Null-safe** — built for modern Dart with sound null safety throughout.
- **Lightweight** — only two runtime dependencies (`intl`, `cached_network_image`).

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Extensions Overview](#extensions-overview)
- [Screen & Theme Extensions](#screen--theme-extensions)
- [Dialog Extensions](#dialog-extensions)
- [Color Extensions](#color-extensions)
- [Duration Extensions](#duration-extensions)
- [Map Extensions](#map-extensions)
- [Toast Extensions](#toast-extensions)
- [Clipboard Extensions](#clipboard-extensions)
- [Highlight Extensions](#highlight-extensions)
- [Nullable Safety Extensions](#nullable-safety-extensions)
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
- [Distance Calculator](#distance-calculator)
- [Unit Conversion Extensions](#unit-conversion-extensions)
- [Status Bar Extensions](#status-bar-extensions)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)
- [Support](#support)

---

## Requirements

| | Minimum version |
|---|---|
| Dart SDK | `^3.5.3` |
| Flutter | `>=1.17.0` |

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  extensions_pro: ^1.0.32
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
| Validation | `String` | email, phone, password, OTP, card, hex, username, PIN code, IP, name |
| Navigation | `BuildContext` | push, pop, replace, clear stack, named routes |
| Widget | `Widget` | padding, border, shadow, rounded, tap, aspect ratio, safe area, hero |
| String | `String` | capitalize, reverse, palindrome, camelCase, base64, slug, initials |
| Int | `int` | roman, ordinal, words, file size, short, prime, currency, percentage |
| SnackBar | `BuildContext` | success, error, gradient, icon, persistent |
| List | `List<T>` | sort, find, chunk, dedup, toMap, groupBy, rotate, flatten |
| Distance | `num` | Haversine geo distance (km) |
| Unit Conversion | `num` | 15 categories, 60+ conversions |
| Status Bar | `BuildContext` | color, brightness, show/hide |
| Screen & Theme | `BuildContext` | width, height, theme, dark mode, tablet check, keyboard, unfocus |
| Dialog | `BuildContext` | loading dialog, confirm dialog |
| Color | `Color`, `String` | hex conversion, lighten, darken, light/dark, blend, material swatch |
| Duration | `Duration` | `mm:ss` / `HH:mm:ss` formatting, human-readable, isZero |
| Map | `Map<K, V>` | filter by key/value, query string, isNullOrEmpty |
| Toast | `BuildContext` | lightweight overlay toast messages |
| Clipboard | `String` | copy to system clipboard |
| Highlight | `String` | highlight search matches as `TextSpan`s |
| Nullable Safety | `String?`, `List<T>?`, `Map<K,V>?` | isNullOrEmpty, isNullOrBlank, orDefault |

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

// Weekend / weekday checks
DateTime(2024, 11, 30).isWeekend;   // true  (Saturday)
DateTime(2024, 11, 25).isWeekday;   // true  (Monday)

// Leap year and days-in-month
DateTime(2024, 1, 1).isLeapYear;    // true
DateTime(2024, 2, 10).daysInMonth;  // 29

// Compare calendar day, ignoring time-of-day
DateTime(2024, 11, 25, 8, 0).isSameDay(DateTime(2024, 11, 25, 23, 30)); // true

// Relative time string
DateTime.now().subtract(const Duration(minutes: 5)).timeAgo;  // "5m ago"
DateTime.now().subtract(const Duration(days: 3)).timeAgo;     // "3d ago"

// Copy with modified fields
DateTime(2024, 11, 25, 10, 30).copyWith(year: 2025, hour: 8);
// 2025-11-25 08:30:00

// Past / future checks
DateTime.now().subtract(const Duration(days: 1)).isInPast;   // true
DateTime.now().add(const Duration(days: 1)).isInFuture;      // true

// Week boundaries (Monday start)
DateTime(2024, 11, 27).startOfWeek;  // 2024-11-25 (Monday)
DateTime(2024, 11, 27).endOfWeek;    // 2024-12-01 23:59:59 (Sunday)

// Month / year boundaries
DateTime(2024, 2, 15).startOfMonth;  // 2024-02-01
DateTime(2024, 2, 15).endOfMonth;    // 2024-02-29 23:59:59
DateTime(2024, 6, 15).startOfYear;   // 2024-01-01
DateTime(2024, 6, 15).endOfYear;     // 2024-12-31 23:59:59

// Add / subtract weeks
DateTime(2024, 11, 25).addWeeks(2);       // 2024-12-09
DateTime(2024, 11, 25).subtractWeeks(1);  // 2024-11-18

// Same month / year checks
DateTime(2024, 11, 5).isSameMonth(DateTime(2024, 11, 25));  // true
DateTime(2024, 3, 1).isSameYear(DateTime(2024, 11, 1));     // true

// ISO-8601 week number
DateTime(2024, 1, 1).weekOfYear;  // 1

// "Today" / "Yesterday" / "Tomorrow" or a formatted date
DateTime.now().toRelativeDateLabel();  // "Today"
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

// Username (3-20 chars: letters, digits, underscore)
'flutter_dev1'.isValidUsername();  // true
'ab'.isValidUsername();            // false

// Indian PIN code (6 digits, first non-zero)
'411001'.isValidPinCode();  // true
'011001'.isValidPinCode();  // false

// IPv4 address
'192.168.1.1'.isValidIPAddress();  // true
'256.1.1.1'.isValidIPAddress();    // false

// Person's name (letters, spaces, apostrophes, hyphens)
"Mary-Jane O'Brien".isValidName();  // true
'John123'.isValidName();            // false
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

// Named routes
context.pushNamed('/details', arguments: {'id': 42});
context.popUntil('/home');
context.canPop;  // true if there's a route to pop
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
Text('Hello').onLongPress(() => print('long pressed'));
Text('Hello').withOpacity(0.5);
Text('Hello').withAspectRatio(16 / 9);
Text('Hello').withSafeArea();
Text('Hello').withBackgroundColor(Colors.amber);
Text('Hello').withHero('hello-tag');

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
'Flutter is awesome'.removeWhitespace();   // "Flutterisawesome"
'Flutter is amazing'.truncate(10);         // "Flutter is..."
'Order1234'.extractNumbers();              // "1234"
'madam'.isPalindrome();                    // true
'flutter'.isPalindrome();                  // false
'flutter is fun'.countOccurrences('u');    // 2
'123'.isNumeric();                         // true  (parses as double)
'abc'.isNumeric();                         // false

// Title case
'flutter is awesome'.toTitleCase();        // "Flutter Is Awesome"

// Mask sensitive data (keeps first/last N characters visible)
'1234567890123456'.mask();                         // "************3456"
'user@example.com'.mask(visibleStart: 2, visibleEnd: 0); // "us**************"

// Initials (great for avatar placeholders)
'John Doe'.toInitials();  // "JD"

// URL-friendly slug
'Hello, Flutter World!'.toSlug();  // "hello-flutter-world"

// Case-insensitive comparison
'Flutter'.equalsIgnoreCase('flutter');  // true

// Base64 encode / decode
'Flutter'.toBase64();          // "Rmx1dHRlcg=="
'Rmx1dHRlcg=='.fromBase64();   // "Flutter"

// Word count
'Flutter is awesome'.wordCount();  // 3

// Strip everything except letters, digits, and spaces
'Hello, World! #2024'.removeSpecialCharacters();  // "Hello World 2024"

// Pluralize based on count
'item'.pluralize(1);                    // "item"
'item'.pluralize(5);                    // "items"
'box'.pluralize(2, plural: 'boxes');    // "boxes"
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

// Prime check
17.isPrime;  // true
4.isPrime;   // false

// Currency formatting (powered by intl)
1234567.toCurrencyString();               // "₹1,234,567"
1000.toCurrencyString(symbol: '\$');      // "$1,000"

// Percentage
45.toPercentageString();  // "45%"

// Treat as seconds and format as a clock string
125.secondsToTimeString();  // "02:05"
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

// Deduplicate by a derived key, keeping the first match
['apple', 'apricot', 'banana', 'blueberry'].distinctBy((s) => s[0]);
// ['apple', 'banana']

// Numeric aggregates
final scores = [1, 2, 3, 4, 5];
scores.sumPro;      // 15
scores.averagePro;  // 3.0
scores.maxPro;      // 5
scores.minPro;      // 1

// Random element
numbers.randomElement();  // a random item, or null if the list is empty

// Swap two elements in place
final letters = ['a', 'b', 'c'];
letters.swap(0, 2);  // ['c', 'b', 'a']

// Group elements by a derived key
['apple', 'apricot', 'banana'].groupBy((w) => w[0]);
// {'a': ['apple', 'apricot'], 'b': ['banana']}

// Rotate the list
[1, 2, 3, 4, 5].rotate(2);   // [4, 5, 1, 2, 3]
[1, 2, 3, 4, 5].rotate(-1);  // [2, 3, 4, 5, 1]

// Flatten a list of lists
[[1, 2], [3], [4, 5]].flatten();  // [1, 2, 3, 4, 5]

// Remove null elements
<int?>[1, null, 2, null, 3].whereNotNull();  // [1, 2, 3]
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

## Screen & Theme Extensions

```dart
// Screen dimensions
context.screenSize;    // Size(360.0, 800.0)
context.screenWidth;   // 360.0
context.screenHeight;  // 800.0

// Theme shortcuts
context.theme;         // Theme.of(context)
context.textTheme;     // Theme.of(context).textTheme
context.isDarkMode;    // true if the current theme brightness is dark

// Dismiss the keyboard from anywhere
context.unfocus();

// Orientation and device class
context.orientation;   // Orientation.portrait
context.isTablet;      // true if the shortest side is >= 600dp

// Safe area (notches, status/navigation bars)
context.safeAreaPadding;  // EdgeInsets(...)

// Keyboard visibility
context.keyboardHeight;     // height in logical pixels, 0 when hidden
context.isKeyboardVisible;  // true when the keyboard is open
```

---

## Dialog Extensions

```dart
// Show a non-dismissible loading spinner, then close it later
context.showLoadingDialog();
await doSomeWork();
context.hideLoadingDialog();

// Yes/No confirmation dialog
final confirmed = await context.showConfirmDialog(
  title: 'Delete item?',
  message: 'This action cannot be undone.',
  confirmText: 'Delete',
  cancelText: 'Cancel',
);
if (confirmed) {
  // proceed with deletion
}
```

---

## Color Extensions

```dart
// Color to hex string
const Color(0xFF336699).toHex();                        // "#336699"
const Color(0xFF336699).toHex(includeAlpha: true);       // "#ff336699"
const Color(0xFF336699).toHex(leadingHash: false);       // "336699"

// Hex string to Color
'#336699'.toColor();  // Color(0xff336699)
'369'.toColor();      // Color(0xff336699)  — shorthand hex

// Lighten / darken
const Color(0xFF336699).lighten(0.2);
const Color(0xFF336699).darken(0.2);

// Perceived brightness
Colors.white.isLight;  // true
Colors.black.isDark;   // true

// Blend two colors
Colors.black.blend(Colors.white, 0.5);  // a 50/50 mix

// Build a MaterialColor swatch (50–900) from any Color
const Color(0xFF336699).toMaterialColor();
```

---

## Duration Extensions

```dart
// Formats as mm:ss, or HH:mm:ss once it reaches an hour
const Duration(seconds: 125).toFormattedString();               // "02:05"
const Duration(hours: 1, minutes: 2, seconds: 3).toFormattedString(); // "01:02:03"

// Human-readable duration
const Duration(days: 1, hours: 2, minutes: 3).toHumanReadable();  // "1d 2h 3m"
Duration.zero.toHumanReadable();  // "0s"

// Zero check
Duration.zero.isZero;  // true
```

---

## Map Extensions

```dart
final map = {'a': 1, 'b': 2, 'c': 3};

// Filter by key or value
map.filterKeys((k) => k != 'b');   // {'a': 1, 'c': 3}
map.filterValues((v) => v > 1);    // {'b': 2, 'c': 3}

// Build a URL query string
{'q': 'flutter dev', 'page': 2}.toQueryString();  // "q=flutter+dev&page=2"

// Map<K, V>?
Map<String, int>? config;
config.isNullOrEmpty;  // true
```

---

## Toast Extensions

```dart
// Shows a lightweight overlay toast — no Scaffold required
context.showToast('Saved!');
context.showToast(
  'Something went wrong',
  duration: const Duration(seconds: 3),
  backgroundColor: Colors.red,
);
```

---

## Clipboard Extensions

```dart
// Copy any string to the system clipboard
await 'Referral code: FLUTTER25'.copyToClipboard();
```

---

## Highlight Extensions

```dart
// Highlight every case-insensitive occurrence of a search term
RichText(
  text: TextSpan(
    children: 'Hello World Hello'.highlightOccurrences(
      'hello',
      baseStyle: const TextStyle(color: Colors.black),
      highlightStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        backgroundColor: Colors.yellow,
      ),
    ),
  ),
);
```

---

## Nullable Safety Extensions

```dart
// String?
String? name;
name.isNullOrEmpty;         // true
name.isNullOrBlank;         // true
name.orDefault('Guest');    // "Guest"

// List<T>?
List<int>? items;
items.isNullOrEmpty;        // true

// Map<K, V>?
Map<String, int>? settings;
settings.isNullOrEmpty;     // true
```

---

## Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the [repository](https://github.com/sanjaysharmajw/extensions_pro).
2. Create a branch for your change (`git checkout -b feature/my-feature`).
3. Make your changes and add/update tests where relevant.
4. Run `flutter analyze` and `flutter test` to make sure everything passes.
5. Open a [pull request](https://github.com/sanjaysharmajw/extensions_pro/pulls) describing what you changed and why.

Found a bug or have an idea? [Open an issue](https://github.com/sanjaysharmajw/extensions_pro/issues).

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
