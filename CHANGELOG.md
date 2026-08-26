## 1.0.32

### Breaking Change
* Removed the Radio Button extension (`CustomRadioButton.radioButton()` on `Widget`). Use Flutter's built-in `Radio`/`RadioListTile`, or keep your own copy of the removed implementation if you still need it.

## 1.0.31

### New Extensions
* **Date** — `isInPast`, `isInFuture`, `startOfWeek`/`endOfWeek`, `startOfMonth`/`endOfMonth`, `startOfYear`/`endOfYear`, `addWeeks()`/`subtractWeeks()`, `isSameMonth()`/`isSameYear()`, `weekOfYear`, `toRelativeDateLabel()`
* **String** — `toBase64()`/`fromBase64()`, `wordCount()`, `removeSpecialCharacters()`, `pluralize()`
* **Int** — `isPrime`, `toCurrencyString()` (powered by `intl`), `toPercentageString()`, `secondsToTimeString()`
* **List** — `swap()`, `groupBy()`, `rotate()`; new `flatten()` on `List<List<E>>` and `whereNotNull()` on `List<E?>`
* **Map (new)** — `filterKeys()`, `filterValues()` on `Map<K, V>`; `toQueryString()` on `Map<String, dynamic>`; `isNullOrEmpty` on `Map<K, V>?`
* **Validation** — `isValidUsername()`, `isValidPinCode()` (India), `isValidIPAddress()`, `isValidName()`
* **Navigation** — `pushNamed()`, `popUntil()`, `canPop`
* **Widget** — `withAspectRatio()`, `withSafeArea()`, `withBackgroundColor()`, `withHero()`
* **BuildContext (Screen & Theme)** — `keyboardHeight`, `isKeyboardVisible`
* **Color** — `isLight`/`isDark`, `blend()`, `toMaterialColor()`
* **Duration** — `isZero`, `toHumanReadable()`
* **Toast (new)** — `showToast()` on `BuildContext`, a lightweight overlay toast that doesn't require a `Scaffold`
* **Clipboard (new)** — `copyToClipboard()` on `String`
* **Highlight (new)** — `highlightOccurrences()` on `String`, returns `TextSpan`s for search-match highlighting

### Example App
* Added **Context & Utilities** and **Color Extensions** pages
* Extended String, Number, Date & Time, List, Validation, and Widget pages with demos for every extension above
* Added a named route to demonstrate `context.pushNamed()`

### Tests
* Added unit/widget tests for all extensions above (72 tests total)

## 1.0.30

### New Extensions
* **Date** — `timeAgo` (relative time strings: "5m ago", "3d ago"), `copyWith()`
* **String** — `toInitials()`, `toSlug()`, `equalsIgnoreCase()`
* **List** — `randomElement()`
* **Color (new)** — `toHex()`, `lighten()`, `darken()` on `Color`; `toColor()` on `String` for parsing hex strings
* **Duration (new)** — `toFormattedString()` (`mm:ss` / `HH:mm:ss`)
* **BuildContext (Screen & Theme)** — `orientation`, `isTablet`, `safeAreaPadding`
* **BuildContext (Dialogs, new)** — `showLoadingDialog()`, `hideLoadingDialog()`, `showConfirmDialog()`

### Tests
* Added unit/widget tests for all extensions above

## 1.0.29

### New Extensions
* **Date** — `isWeekend`, `isWeekday`, `isLeapYear`, `daysInMonth`, `isSameDay()`
* **String** — `toTitleCase()`, `mask()` for hiding sensitive data (emails, card numbers)
* **List** — `distinctBy()`; new `sumPro`, `averagePro`, `maxPro`, `minPro` on `List<num>`
* **Widget** — `onLongPress()`, `withOpacity()`
* **BuildContext (new: Screen & Theme)** — `screenSize`, `screenWidth`, `screenHeight`, `theme`, `textTheme`, `isDarkMode`, `unfocus()`
* **Nullable Safety (new)** — `isNullOrEmpty` / `isNullOrBlank` / `orDefault()` on `String?`, `isNullOrEmpty` on `List<T>?`

### Package Maintenance
* Upgraded `flutter_lints` to `^6.0.0` and resolved the resulting lint
* Added `repository`, `issue_tracker`, `funding`, and `topics` to `pubspec.yaml` for pub.dev scoring
* Removed accidentally committed `.flutter-plugins` / `.flutter-plugins-dependencies` and added them to `.gitignore`
* Added unit and widget tests for all new extensions

## 1.0.28

### Bug Fixes
* `toWords()` — fixed incorrect output for large numbers (was using `units[]` array for tens place, e.g. "two five thousand" → now "twenty five thousand")
* `isValidCreditCardNumber()` — fixed crash on non-numeric characters; spaces and dashes are now stripped before Luhn check
* `showGradientSnackBar()` — removed redundant `BuildContext context` parameter (extension already has `this` as context)
* `toHoursPro` — fixed wrong divisor (`/60` → `/3600`) for seconds-to-hours conversion
* `distance_calculate.dart` — removed stray `main()` function from library file
* `dialogBackgroundColor` — replaced deprecated Flutter API with `dialogTheme: DialogThemeData(backgroundColor: ...)`
* `isNumeric()` — renamed to `isDigitsOnly()` in `ValidationExtensionsPro` to resolve ambiguity conflict with `StringExtensionsPro.isNumeric()`

### Example App — Full Redesign
* Modern Material 3 UI with gradient SliverAppBar and feature card grid
* **String Page** — live input demonstrating 9 string operations
* **Validation Page** — real-time form validation with color-coded feedback for email, phone, password, OTP, credit card, and hex color
* **Numbers Page** — interactive demo for `toRoman`, `toOrdinal`, `toWords`, `toFileSize`, `toShortString`, `toDurationString`, and `toWeekDay`
* **Date & Time Page** — live digital clock, date/time pickers, age calculator, date math, and time-of-day helpers
* **SnackBar Page** — tap-to-preview for all 6 snackbar styles
* **Widget Page** — live demos of widget extensions, navigation extensions, custom radio buttons, and visibility toggle
* **Converter Page** — tab-based unit converter (length, temperature, weight, energy) and geo distance calculator with city presets
* **List Page** — interactive demo for all list extensions: sort, find, chunk, dedupe, `forEachIndexed`, `toMap`, and `addIfNotExists`

## 1.0.9

* Bug fixed

## 1.0.11

* Bug fixed

## 1.0.12

* Local Image load and Network Image load extensions added

## 1.0.13

* Banner and logo changed

## 1.0.15

* Add Date format and date extensions and Update ReadMe Doc

## 1.0.16

* Add Time extensions

## 1.0.17

* Document Updated

## 1.0.18

* Document Updated and improvement

## 1.0.19

* Validation bugs solved

## 1.0.20

* Validation bugs solved

## 1.0.22

* List, snackBar, radio extensions add

## 1.0.23

* Add Distance According to Lat Lng

## 1.0.24

* Add Unit Conversions, Status Bar

## 1.0.25

* ReadMe update

* ## 1.0.26

* update code

* ## 1.0.27

* Calender Picker Color Change
