
![Logo](https://github.com/sanjaysharmajw/extensions_pro/blob/main/example/assets/extensions_pro.png?raw=true)



# Extensions Pro
#### Extensions Pro simplifies your development process, making it faster and more efficient.


This Extensions Pro Package empowers you to accelerate your development process, enabling faster and more efficient project completion.

- [Date and Time-Extensions](#date-and-time-extensions)
- [Validation Extensions](#validation-extensions)
- [Navigation Extensions](#navigation-extensions)
- [Widgets Extensions](#widgets-extensions)
- [String Extensions](#string-extensions)
- [Int Extensions](#int-extensions)
- [Clock Extensions](#clock-extensions)



#### Date and Time Extensions

```dart
//Date Picker
final dateSelected = await context.pickDate(dateFormatChange: "yyyy-MM-dd"); Output: 2024-11-06 


// Time Picker
TimeOfDay? selectedTime;
final selectedTimes = await context.pickTime();
      setState(() {
        selectedTime = selectedTimes;
        });

var output = selectedTime!.format(context);  // 11:08 PM

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





## Authors

- [@sanjaysharmajw](https://github.com/sanjaysharmajw)


## 🚀 About Me
I'm a full stack developer. Cross-Platform Mobile Developer: Android, iOS, Swift , and Flutter Expert


## License

[MIT](https://choosealicense.com/licenses/mit/)

