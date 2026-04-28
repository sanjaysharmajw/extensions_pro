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
