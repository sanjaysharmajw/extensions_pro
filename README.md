
![Logo](https://github.com/sanjaysharmajw/extensions_pro/blob/main/example/assets/extensions_pro.png?raw=true)
# Extensions Pro

- ![Pub Publisher](https://img.shields.io/pub/publisher/extensions_pro)
- ![Pub Points](https://img.shields.io/pub/points/extensions_pro)
- ![Pub Popularity](https://img.shields.io/pub/popularity/extensions_pro)
- ![Pub Version](https://img.shields.io/pub/v/extensions_pro)
- ![Pub Likes](https://img.shields.io/pub/likes/extensions_pro)



#### Extensions Pro simplifies your development process, making it faster and more efficient.


##### This Extensions Pro Package empowers you to accelerate your development process, enabling faster and more efficient project completion.

- [Date Extensions](#date-extensions)
- [Time Extensions](#time-extensions)
- [Clock Extensions](#clock-extensions)
- [Image Network Extensions](#image-network-extensions)
- [Local Image Extensions](#local-image-extensions)
- [Validation Extensions](#validation-extensions)
- [Navigation Extensions](#navigation-extensions)
- [Widgets Extensions](#widgets-extensions)
- [String Extensions](#string-extensions)
- [Int Extensions](#int-extensions)
- [SnackBar Extensions](#snackBar-extensions)
- [List Extensions](#list-extensions)
- [Radio Button Extensions](#radio-button-extensions)
- [Distance Calculate Extensions](#distance-calculate-extensions)
- [Unit Conversions Extensions](#unit-conversions-extensions)
- [Status Bar Extensions](#status-bar-extensions)



#### Date Extensions

```dart
//Date Picker
final dateSelected = await context.pickDate(dateFormatChange: "yyyy-MM-dd"); Output: 2024-11-06 

//Week Day
int day = 3;
var days=day.toWeekDay(); // Output: Wednesday
var dayHalfName=day.toWeekDay(isHalfName: true); // Output: Wed

//Date Time Difference
final date1 = DateTime(2024, 11, 19);
final date2 = DateTime(2024, 11, 15);
final difference = date1.differenceInDays(date2);

Difference in days: difference.inDays  // Output: Difference in days: 4 days
Total difference in hours: difference.inHours // Output: Total difference in hours: 96 hours

// Formatting a Date
DateTime now = DateTime.now();
print(now.format('yyyy-MM-dd')); // Output: 2024-11-25

// Getting Start and End of Day
DateTime now = DateTime.now();
print(now.startOfDay); // Output: 2024-11-25 00:00:00
print(now.endOfDay);   // Output: 2024-11-25 23:59:59

// Calculating Age
DateTime birthDate = DateTime(1990, 11, 25);
print(birthDate.age); // Output: 34 (on 2024-11-25)

// Checking if Date is Today, Yesterday, or Tomorrow
DateTime date = DateTime.now();
print(date.isToday); // Output: true
print(date.isYesterday); // Output: true
print(date.isTomorrow); // Output: true

// Adding or Subtracting Days, Months, or Years
DateTime now = DateTime.now();
print(now.addDays(5)); // 5 days later
print(now.subtractMonths(1)); // 1 month earlier

// Getting Day of the Week Name
DateTime date = DateTime.now();
print(date.weekdayName); // Output: Monday (for example)


```
#### Time Extensions

```dart

// Get the current time
print("Current Time: ${DateTime.now().currentTime}");               // Prints the current DateTime object

// Get the current date as a formatted string (e.g., '2024-11-25')
print("Formatted Date: ${DateTime.now().currentDateFormatted}");    // e.g., 2024-11-25

// Get the current time as a formatted string (e.g., '14:30')
print("Formatted Time: ${DateTime.now().currentTimeFormatted}");    // e.g., 14:30

// Check if the current time is morning (before 12 PM)
print("Is Morning: ${DateTime.now().isMorning}");                   // true or false

// Check if the current time is afternoon (12 PM to 6 PM)
print("Is Afternoon: ${DateTime.now().isAfternoon}");               // true or false

// Check if the current time is evening (after 6 PM)
print("Is Evening: ${DateTime.now().isEvening}");                   // true or false

// Time Picker
TimeOfDay? selectedTime;
final selectedTimes = await context.pickTime();
      setState(() {
        selectedTime = selectedTimes;
        });

var output = selectedTime!.format(context);  // 11:08 PM

```
#### Clock Extensions

```dart
// Digital Clock Time
String currentTime = DateTime.now().toDigitalTimeWithSeconds(); // Change toDigitalTime
 @override
  void initState() {
    super.initState();
    // Update the clock every second
    Future.delayed(Duration.zero, _updateTime);
  }

  void _updateTime() {
    setState(() {
      currentTime = DateTime.now().toDigitalTimeWithSeconds();
    });
    Future.delayed(const Duration(seconds: 1), _updateTime);
  }
  print(currentTime); // 11:42:32
  print(currentTime); // 11:42
  
```
#### Image Network Extensions
``` dart
// 1. Network Image with Progress
ImageNetworkExtensionsPro.networkImageWithProgress(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50),

// 2. Network Image with Rounded Corners
ImageNetworkExtensionsPro.networkImageWithRoundedCorners(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50,
    borderRadius: 16.0),

 // 3. Network Image with Placeholder
ImageNetworkExtensionsPro.networkImageWithPlaceholder(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50,
    placeholder: const Center(child: Text('Loading...'))),

// 4. Cached Network Image
ImageNetworkExtensionsPro.cachedNetworkImage(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50),

// 5. Network Image with Shadow
ImageNetworkExtensionsPro.networkImageWithShadow(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50,
    elevation: 10.0,
    shadowColor: Colors.black45),

```

#### Local Image Extensions

```dart
// 1. Image with Progress Indicator and Error Handling
ImageLocalExtensionsPro.assetImageWithProgress(
    'assets/extensions_pro.png',
    width: 150,
    height: 150,
loadingWidget: const Center(child: CircularProgressIndicator()), context: context),

// 2. Image with Rounded Corners
ImageLocalExtensionsPro.assetImageWithRoundedCorners(
    'assets/extensions_pro.png',
    width: 150,
    height: 150,
    borderRadius: 16.0, context: context),

// 3. Image with Shadow
ImageLocalExtensionsPro.assetImageWithShadow(
    'assets/extensions_pro.png',
    width: 150,
    height: 150,
    elevation: 8.0,
    shadowColor: Colors.blueAccent, context: context),

// 4. Image with Fitted Box for Scaling
ImageLocalExtensionsPro.assetImageWithFittedBox(
    'assets/extensions_pro.png',
    width: 150,
    height: 150),

```

#### Validation Extensions

```dart
final url1 = "https://www.example.com";
final url3 = "htp:/invalid-url";
final url4 = "https://sub.domain.co.uk/path";

print("Is '$url1' a valid URL? ${url1.isValidUrl()}"); // Output: true
print("Is '$url3' a valid URL? ${url3.isValidUrl()}"); // Output: false

String email = 'test@example.com'; 
print(email.isValidEmail()); // Email Validation - Output: true

String phone = '+1234567890';
print(phone.isValidPhoneNumber()); // Phone Number Validation - Output: true

String password = 'Password123';
print(password.isStrongPassword()); // Password Strength Validation (At least one uppercase, one lowercase, one digit) - Output: true

String numericValue = '123456';
print(numericValue.isNumeric()); // Numeric Validation - Output: true

String input = 'abc123';
print(input.isAlphaNumeric()); // Alpha Numeric Validation - Output: true

String creditCard = '4532015112830366';
print(creditCard.isValidCreditCardNumber()); // Credit Card Number Validation (Luhn Algorithm) - Output: true

String hexColor = '#FF5733';
print(hexColor.isValidHexColor()); // Hexadecimal Color Validation - Output: true

// Example OTPs
String otp1 = '123456'; // Valid OTP
String otp2 = '12345a'; // Invalid OTP (contains a letter)
String otp3 = '123';    // Invalid OTP (too short)
  
// Validating OTPs
print('Is OTP 1 valid? ${otp1.isValidOTP()}'); // Output: true
print('Is OTP 2 valid? ${otp2.isValidOTP()}'); // Output: false
print('Is OTP 3 valid? ${otp3.isValidOTP()}'); // Output: false

// Example coordinates (Lat, Long)
String latitude1 = '37.7749'; // Valid Latitude
String longitude1 = '-122.4194'; // Valid Longitude

String latitude2 = '100.0000'; // Invalid Latitude (out of range)
String longitude2 = '200.0000'; // Invalid Longitude (out of range)

// Validating Latitude and Longitude
print('Is Latitude 1 valid? ${latitude1.isValidLatitude()}'); // Output: true
print('Is Longitude 1 valid? ${longitude1.isValidLongitude()}'); // Output: true

print('Is Latitude 2 valid? ${latitude2.isValidLatitude()}'); // Output: false
print('Is Longitude 2 valid? ${longitude2.isValidLongitude()}'); // Output: false


// Password Match Validation Extension

String password = 'Password123';
String confirmPassword = 'Password123';

bool isMatch = password.isPasswordMatch(confirmPassword);
print('Do the passwords match? $isMatch'); // Output: true

confirmPassword = 'Password124';
isMatch = password.isPasswordMatch(confirmPassword);
print('Do the passwords match? $isMatch'); // Output: false




```


#### Navigation Extensions

```dart
context.push(SecondScreen());   // Push a new Screen
context.pushReplacement(SecondScreen()); // Push and Replace Current Screen
context.pop(); // Pop the Current Screen 
context.pushAndRemoveUntil(HomeScreen()); // Push and Clear Navigation Stack
```

#### Widgets Extensions

```dart
widget.withPadding(EdgeInsets.all(8.0)); //withPadding: Wraps the widget in a Padding widget to apply padding around it.
widget.withMargin(EdgeInsets.all(8.0)); // withMargin: Wraps the widget in a Container and applies margin.
widget.centered(); // centered: Centers the widget inside a Center widget.
widget.withBorder(color: Colors.blue, width: 2.0); // withBorder: Adds a border around the widget by wrapping it inside a Container with a BoxDecoration.
widget.withShadow(blurRadius: 5.0, color: Colors.grey); // withShadow: Adds a shadow to the widget by wrapping it in a Material widget.
widget.withRoundedCorners(radius: 12.0); //withRoundedCorners: Applies rounded corners to the widget using ClipRRect.

widget.onTap(() { events. //// onTap: Wraps the widget inside a GestureDetector to detect tap 
  print('Widget tapped!');
});

widget.withVisibility(true); // withVisibility: Wraps the widget in a Visibility widget, conditionally hiding it based on the isVisible flag.

// Example
Text('Hello World!')
            .withPadding(EdgeInsets.all(16.0))
            .withBorder(color: Colors.blue, width: 2.0)
            .withShadow(blurRadius: 8.0, color: Colors.black)
            .withRoundedCorners(radius: 12.0),
          
ElevatedButton(
            onPressed: () {
                print('Button tapped');
            }
            child: Text('Tap Me'),
            ).onTap(() {
              print('Button tapped from extension!');
            }),
```

#### String Extensions

```dart
print('flutter'.capitalize()); // Capitalize the first letter Output: Flutter
print('test@example.com'.isValidEmail()); // Check if the string is a valid email Output: true

print('invalid-email'.isValidEmail()); // Check if the string is a valid emailOutput: false
print('flutter'.reverse()); // Reverse the string Output: rettulf
print('123'.isNumeric());  // Check if the string is numeric Output: true
print('abc'.isNumeric());  // Check if the string is numeric Output: false

print('Flutter is awesome'.removeWhitespace()); // Remove all whitespace Output: Flutterisawesome
print('Flutter is amazing'.truncate(10)); // Truncate the string with ellipsis Output: Flutter is...

print('snake_case_string'.toCamelCase()); // Convert snake_case to camelCase Output: SnakeCaseString
print('flutter is fun'.countOccurrences('u')); // Count occurrences of a character Output: 2

print('madam'.isPalindrome()); // Check if the string is a palindrome Output: true
print('flutter'.isPalindrome()); // Check if the string is a palindrome Output: 
print('Order1234'.extractNumbers()); // Extract numbers from a string Output: 1234
```

#### Int Extensions

```dart
print(125.toDurationString); // Convert int to duration in minutes and seconds - Output: 2m 5s

print(1990.toRoman); // Convert to Roman numeral - Output: MCMXC

print(1.toOrdinal()); // Convert an integer to its ordinal string - Output: 1st
print(22.toOrdinal()); // Convert an integer to its ordinal string - Output: 22nd

print(1024.toFileSize()); // To Bytes (KB, MB, GB) - Output: 1.00 KB
print(1048576.toFileSize()); // To Bytes (KB, MB, GB) - Output: 1.00 MB

// To convert a numeric value (e.g., rupees) to its word representation in Flutter, you can create an extension on int. Here's how you can achieve it:
int amount = 123456;
print('Amount in words: ${amount.toWords()}'); // Amount in words: one lakh twenty-three thousand four hundred fifty-six

int number = 12340; // To convert numbers like 12340 to a short format like 12K, you can create a utility function in Flutter.
print(number.toShortString()); // Output: 12K
```





#### SnackBar Extensions

```dart
// SnackBar for Success and Error
context.showSuccessSnackBar("Operation successful!");
context.showErrorSnackBar("An error occurred!");

// SnackBar with Gradient
context.showGradientSnackBar(context, "message");

// SnackBar with Custom Duration
context.showPersistentSnackBar( message: 'Message', dismissColor: Colors.white);

// SnackBar with Helper Method
context.showCustomSnackBar(
  message: "This is a custom SnackBar!",
  backgroundColor: Colors.blue,
  action: SnackBarAction(
    label: "UNDO",
    onPressed: () {
      // Handle action
    },
  ),
);

// SnackBar with Icons
context.showIconSnackBar(
  message: "Data saved successfully!",
  icon: Icons.check_circle,
  backgroundColor: Colors.green,
);
```
#### List Extensions

```dart
final list = [1, 2, 3, 4, 5, 6, 6, 7, 8, 9];

// firstOrDefault
print(list.firstOrDefault()); // 1

// lastOrDefault
print(list.lastOrDefault()); // 9

// addIfNotExists
list.addIfNotExists(10);
print(list); // [1, 2, 3, 4, 5, 6, 6, 7, 8, 9, 10]

// removeDuplicates
print(list.removeDuplicates()); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// safeSublist
print(list.safeSublist(2, 5)); // [3, 4, 5]

// find
print(list.find((x) => x > 5)); // 6

 // sortBy
final names = ['Zara', 'Anna', 'Mike'];
names.sortBy((name) => name, descending: true);
print(names); // ['Zara', 'Mike', 'Anna']

// toMap
final map = list.toMap((x) => x.toString());
print(map); // {'1': 1, '2': 2, '3': 3, ...}

// ForEachIndexed
list.forEachIndexed((index, item) {
    print('Index $index: $item');
});

// Chunked
print(list.chunked(3)); // [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

```
#### Radio Button Extensions
![Logo](https://raw.githubusercontent.com/sanjaysharmajw/extensions_pro/main/example/assets/radio_button.png)
```dart
Row(
    children: [
        const Text('Option 1')
                .radioButton<String>(
                value: 'Option 1',
                activeColor: Colors.green,
                inactiveColor: Colors.green.shade100,
                groupValue: selectedValue,
                onChanged: (value) =>setState(() => selectedValue = value!),
                ).withPadding(const EdgeInsets.all(10)),
        const Text('Option 2')
                .radioButton<String>(
                activeColor: Colors.green,
                inactiveColor: Colors.green.shade100,
                value: 'Option 2',
                groupValue: selectedValue,
                onChanged: (value) => setState(() => selectedValue = value!),
                  ).withPadding(const EdgeInsets.all(10)),
              const Text('Option 3')
                  .radioButton<String>(
                    activeColor: Colors.green,
                    inactiveColor: Colors.green.shade100,
                    value: 'Option 3',
                    groupValue: selectedValue,
                    onChanged: (value) => setState(() => selectedValue = value!),
              ).withPadding(const EdgeInsets.all(10)),
            ],
          ),

```
#### Distance Calculate Extensions

```dart
  const double startLatitude = 28.7041; // Example: Delhi, India
  const double startLongitude = 77.1025;
  const double endLatitude = 19.0760; // Example: Mumbai, India
  const double endLongitude = 72.8777;

  final distance = 0.calculateDistance(
    startLatitude: startLatitude,
    startLongitude: startLongitude,
    endLatitude: endLatitude,
    endLongitude: endLongitude,
  );

  print('The distance is ${distance.toStringAsFixed(2)} km.'); // Output: The distance is 1158.91 km.


```
#### Unit Conversions Extensions

```dart
  print(1000.toKilometers); // 1.0 Kilometers
  print(100.toKilometersFromMiles); // 160.934 Kilometers
  print(25.toFahrenheit); // 77.0 Fahrenheit
  print(77.toCelsius); // 25.0 Celsius
  print(10000.toAcres); // 2.471 Acres
  print(100.toSquareMeters); // 9.29 Square Meters
  print(70.toPounds); // 154.323 Pounds
  print(154.323.toKilograms); // 70.0 Kilograms
  print(100.toMilesPerHour); // 62.1371 Miles per Hour
  print(62.1371.toKilometersPerHour); // 100.0 Kilometers per Hour
  print(3600.toMinutes); // 60.0 Minutes
  print(60.toHours); // 1.0 Hour
  print(48.toDays); // 2.0 Days
  print(10.toGallons); // 2.64172 Gallons
  print(2.64172.toLiters); // 10.0 Liters
  print(1024.toGB); // 1.0 GB
  print(1.toGBFromTB); // 1024.0 GB
  print(100000.toBar); // 1.0 Bar
  print(1.toPascal); // 101325.0 Pascal
  print(180.toRadians); // 3.14159265359 Radians
  print(3.14159265359.toDegrees); // 180.0 Degrees
  print(100.toCalories); // 23.9006 Calories
  print(23.9006.toJoules); // 100.0 Joules
  print(100.toEUR); // 92.0 EUR
  print(92.toUSD); // 100.0 USD
  print(8200.toUSDFromINR); // 100.0 USD
  print(20.toLPer100km); // 11.7607 L/100km
  print(11.7607.toMPG); // 20.0 MPG
  print(1000.toKbps); // 1000000.0 Kbps
  print(1000000.toMbps); // 1000.0 Mbps
  print(1500.toKilowatts); // 1.5 Kilowatts
  print(1.5.toWatts); // 1500.0 Watts
  print(2048.toMegabytes); // 2.0 Megabytes
  print(2.toKilobytes); // 2048.0 Kilobytes
  print(10.toMetersFromYards); // 9.144 Meters
  print(10.toMetersFromFeet); // 3.048 Meters
  print(10.toCentimetersFromInches); // 25.4 Centimeters
  print(25.4.toInchesFromCentimeters); // 10.0 Inches
  print(5.toMillivolts); // 5000.0 Millivolts
  print(5000.toVoltsFromMillivolts); // 5.0 Volts
  print(1.toTerabytes); // 0.0009765625 Terabytes
  print(0.0009765625.toGigabytesFromTerabytes); // 1.0 Gigabytes
  print(2000.toKilowattHours); // 2.0 Kilowatt-Hours
  print(2.toWattHours); // 2000.0 Watt-Hours
  print(5.toCubicFeet); // 176.5735 Cubic Feet
  print(176.5735.toCubicMetersFromCubicFeet); // 5.0 Cubic Meters
  print(10.toGrams); // 283.495 Ounces
  print(283.495.toOunces); // 10.0 Grams
  print(1000.toBytesPerSecond); // 125.0 Bytes per Second

```
#### Status Bar Extensions

```dart
//Set Status Bar Color
context.setStatusBarColor(Colors.blue, darkIcons: false)

//Hide Status Bar
context.hideStatusBar()

//Show Status Bar
context.showStatusBar();

//Set Status Bar Brightness
context.setStatusBarBrightness(Brightness.dark);

//Set Status Bar Text Colo
context.setStatusBarTextColor(true); // Dark text
context.setStatusBarTextColor(false); // Light text
```
## Authors
* [@sanjaysharmajw](https://github.com/sanjaysharmajw)


## About Me
I'm a full stack developer. Cross-Platform Mobile Developer: Android, iOS, Swift , and Flutter Expert


## License

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/sanjaysharmajw/extensions_pro/blob/main/LICENSE)


## Support
I hope you had a great experience using this package! If you found the Extensions Pro helpful, consider supporting me by buying a coffee—your generosity would mean a lot and is deeply appreciated!

[![Buy Me A Coffee](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/sanjaysharmajw)



## Skills
Android, iOS, Java, Kotlin, JetPack Compose, SwiftUI, Flutter, Dart, JavaScript, Node.js...

