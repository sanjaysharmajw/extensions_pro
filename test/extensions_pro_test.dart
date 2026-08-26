import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:extensions_pro/extensions_pro.dart';

void main() {
  group('DateExtensionsPro', () {
    test('isWeekend / isWeekday', () {
      final saturday = DateTime(2024, 11, 30);
      final monday = DateTime(2024, 11, 25);
      expect(saturday.isWeekend, isTrue);
      expect(saturday.isWeekday, isFalse);
      expect(monday.isWeekend, isFalse);
      expect(monday.isWeekday, isTrue);
    });

    test('isLeapYear', () {
      expect(DateTime(2024, 1, 1).isLeapYear, isTrue);
      expect(DateTime(2023, 1, 1).isLeapYear, isFalse);
      expect(DateTime(2000, 1, 1).isLeapYear, isTrue);
      expect(DateTime(1900, 1, 1).isLeapYear, isFalse);
    });

    test('daysInMonth', () {
      expect(DateTime(2024, 2, 10).daysInMonth, 29);
      expect(DateTime(2023, 2, 10).daysInMonth, 28);
      expect(DateTime(2024, 4, 1).daysInMonth, 30);
    });

    test('isSameDay', () {
      final a = DateTime(2024, 11, 25, 8, 0);
      final b = DateTime(2024, 11, 25, 23, 30);
      final c = DateTime(2024, 11, 26);
      expect(a.isSameDay(b), isTrue);
      expect(a.isSameDay(c), isFalse);
    });

    test('timeAgo', () {
      final now = DateTime.now();
      expect(now.subtract(const Duration(seconds: 10)).timeAgo, 'just now');
      expect(now.subtract(const Duration(minutes: 5)).timeAgo, '5m ago');
      expect(now.subtract(const Duration(hours: 2)).timeAgo, '2h ago');
      expect(now.subtract(const Duration(days: 3)).timeAgo, '3d ago');
      expect(now.add(const Duration(minutes: 5)).timeAgo, 'just now');
    });

    test('copyWith', () {
      final date = DateTime(2024, 11, 25, 10, 30);
      final updated = date.copyWith(year: 2025, hour: 8);
      expect(updated, DateTime(2025, 11, 25, 8, 30));
    });

    test('isInPast / isInFuture', () {
      expect(DateTime.now().subtract(const Duration(days: 1)).isInPast, isTrue);
      expect(DateTime.now().add(const Duration(days: 1)).isInFuture, isTrue);
    });

    test('startOfWeek / endOfWeek', () {
      // Wednesday, 2024-11-27
      final wednesday = DateTime(2024, 11, 27, 15, 30);
      expect(wednesday.startOfWeek, DateTime(2024, 11, 25)); // Monday
      expect(wednesday.endOfWeek, DateTime(2024, 12, 1, 23, 59, 59)); // Sunday
    });

    test('startOfMonth / endOfMonth', () {
      final date = DateTime(2024, 2, 15);
      expect(date.startOfMonth, DateTime(2024, 2, 1));
      expect(date.endOfMonth, DateTime(2024, 2, 29, 23, 59, 59));
    });

    test('startOfYear / endOfYear', () {
      final date = DateTime(2024, 6, 15);
      expect(date.startOfYear, DateTime(2024, 1, 1));
      expect(date.endOfYear, DateTime(2024, 12, 31, 23, 59, 59));
    });

    test('addWeeks / subtractWeeks', () {
      final date = DateTime(2024, 11, 25);
      expect(date.addWeeks(2), DateTime(2024, 12, 9));
      expect(date.subtractWeeks(1), DateTime(2024, 11, 18));
    });

    test('isSameMonth / isSameYear', () {
      expect(DateTime(2024, 11, 5).isSameMonth(DateTime(2024, 11, 25)), isTrue);
      expect(DateTime(2024, 11, 5).isSameMonth(DateTime(2024, 12, 5)), isFalse);
      expect(DateTime(2024, 3, 1).isSameYear(DateTime(2024, 11, 1)), isTrue);
    });

    test('weekOfYear', () {
      expect(DateTime(2024, 1, 1).weekOfYear, 1);
      expect(DateTime(2024, 12, 31).weekOfYear, greaterThanOrEqualTo(1));
    });

    test('toRelativeDateLabel', () {
      final now = DateTime.now();
      expect(now.toRelativeDateLabel(), 'Today');
      expect(
        now.subtract(const Duration(days: 1)).toRelativeDateLabel(),
        'Yesterday',
      );
      expect(
        now.add(const Duration(days: 1)).toRelativeDateLabel(),
        'Tomorrow',
      );
    });
  });

  group('StringExtensionsPro', () {
    test('toTitleCase', () {
      expect('flutter is awesome'.toTitleCase(), 'Flutter Is Awesome');
      expect(''.toTitleCase(), '');
    });

    test('mask', () {
      expect('1234567890123456'.mask(), '************3456');
      expect('12'.mask(visibleStart: 0, visibleEnd: 4), '12');
    });

    test('toInitials', () {
      expect('John Doe'.toInitials(), 'JD');
      expect('Flutter'.toInitials(), 'F');
      expect('  '.toInitials(), '');
    });

    test('toSlug', () {
      expect('Hello, Flutter World!'.toSlug(), 'hello-flutter-world');
      expect('  Multiple   Spaces  '.toSlug(), 'multiple-spaces');
    });

    test('equalsIgnoreCase', () {
      expect('Flutter'.equalsIgnoreCase('flutter'), isTrue);
      expect('Flutter'.equalsIgnoreCase('dart'), isFalse);
    });

    test('toBase64 / fromBase64', () {
      expect('Flutter'.toBase64(), 'Rmx1dHRlcg==');
      expect('Rmx1dHRlcg=='.fromBase64(), 'Flutter');
    });

    test('wordCount', () {
      expect('Flutter is awesome'.wordCount(), 3);
      expect('   '.wordCount(), 0);
      expect(''.wordCount(), 0);
    });

    test('removeSpecialCharacters', () {
      expect(
        'Hello, World! #2024'.removeSpecialCharacters(),
        'Hello World 2024',
      );
    });

    test('pluralize', () {
      expect('item'.pluralize(1), 'item');
      expect('item'.pluralize(5), 'items');
      expect('box'.pluralize(2, plural: 'boxes'), 'boxes');
    });
  });

  group('IntExtensionsPro', () {
    test('isPrime', () {
      expect(2.isPrime, isTrue);
      expect(17.isPrime, isTrue);
      expect(1.isPrime, isFalse);
      expect(4.isPrime, isFalse);
      expect((-7).isPrime, isFalse);
    });

    test('toCurrencyString', () {
      expect(1234567.toCurrencyString(), '₹1,234,567');
      expect(1000.toCurrencyString(symbol: '\$'), '\$1,000');
    });

    test('toPercentageString', () {
      expect(45.toPercentageString(), '45%');
    });

    test('secondsToTimeString', () {
      expect(125.secondsToTimeString(), '02:05');
    });
  });

  group('NullableStringExtensionsPro', () {
    test('isNullOrEmpty', () {
      const String? a = null;
      const b = '';
      const c = 'x';
      expect(a.isNullOrEmpty, isTrue);
      expect(b.isNullOrEmpty, isTrue);
      expect(c.isNullOrEmpty, isFalse);
    });

    test('isNullOrBlank', () {
      const a = '   ';
      expect(a.isNullOrBlank, isTrue);
    });

    test('orDefault', () {
      const String? a = null;
      expect(a.orDefault('fallback'), 'fallback');
      expect('value'.orDefault('fallback'), 'value');
    });
  });

  group('NullableListExtensionsPro', () {
    test('isNullOrEmpty', () {
      List<int>? a;
      final b = <int>[];
      final c = [1];
      expect(a.isNullOrEmpty, isTrue);
      expect(b.isNullOrEmpty, isTrue);
      expect(c.isNullOrEmpty, isFalse);
    });
  });

  group('ListExtensions.distinctBy', () {
    test('deduplicates by derived key', () {
      final items = ['apple', 'apricot', 'banana', 'blueberry'];
      final result = items.distinctBy((s) => s[0]);
      expect(result, ['apple', 'banana']);
    });
  });

  group('ListExtensions.randomElement', () {
    test('returns an element from the list', () {
      final items = [1, 2, 3];
      expect(items.randomElement(), isIn(items));
    });

    test('returns null for an empty list', () {
      expect(<int>[].randomElement(), isNull);
    });
  });

  group('ListExtensions.swap/groupBy/rotate', () {
    test('swap', () {
      final list = [1, 2, 3];
      list.swap(0, 2);
      expect(list, [3, 2, 1]);
    });

    test('groupBy', () {
      final words = ['apple', 'apricot', 'banana', 'blueberry'];
      final grouped = words.groupBy((w) => w[0]);
      expect(grouped, {
        'a': ['apple', 'apricot'],
        'b': ['banana', 'blueberry'],
      });
    });

    test('rotate', () {
      expect([1, 2, 3, 4, 5].rotate(2), [4, 5, 1, 2, 3]);
      expect([1, 2, 3, 4, 5].rotate(-1), [2, 3, 4, 5, 1]);
      expect([1, 2, 3].rotate(0), [1, 2, 3]);
      expect(<int>[].rotate(2), <int>[]);
    });
  });

  group('FlattenListExtensionsPro', () {
    test('flatten', () {
      expect(
        [
          [1, 2],
          [3],
          [4, 5],
        ].flatten(),
        [1, 2, 3, 4, 5],
      );
    });
  });

  group('WhereNotNullListExtensionsPro', () {
    test('whereNotNull', () {
      final list = <int?>[1, null, 2, null, 3];
      expect(list.whereNotNull(), [1, 2, 3]);
    });
  });

  group('MapExtensionsPro', () {
    test('filterKeys / filterValues', () {
      final map = {'a': 1, 'b': 2, 'c': 3};
      expect(map.filterKeys((k) => k != 'b'), {'a': 1, 'c': 3});
      expect(map.filterValues((v) => v > 1), {'b': 2, 'c': 3});
    });
  });

  group('QueryStringMapExtensionsPro', () {
    test('toQueryString', () {
      expect(
        {'q': 'flutter dev', 'page': 2}.toQueryString(),
        'q=flutter+dev&page=2',
      );
    });
  });

  group('NullableMapExtensionsPro', () {
    test('isNullOrEmpty', () {
      Map<String, int>? a;
      final b = <String, int>{};
      final c = {'x': 1};
      expect(a.isNullOrEmpty, isTrue);
      expect(b.isNullOrEmpty, isTrue);
      expect(c.isNullOrEmpty, isFalse);
    });
  });

  group('ValidationExtensionsPro (new)', () {
    test('isValidUsername', () {
      expect('flutter_dev1'.isValidUsername(), isTrue);
      expect('ab'.isValidUsername(), isFalse);
      expect('invalid username'.isValidUsername(), isFalse);
    });

    test('isValidPinCode', () {
      expect('411001'.isValidPinCode(), isTrue);
      expect('011001'.isValidPinCode(), isFalse);
      expect('12345'.isValidPinCode(), isFalse);
    });

    test('isValidIPAddress', () {
      expect('192.168.1.1'.isValidIPAddress(), isTrue);
      expect('255.255.255.255'.isValidIPAddress(), isTrue);
      expect('256.1.1.1'.isValidIPAddress(), isFalse);
      expect('not.an.ip.address'.isValidIPAddress(), isFalse);
    });

    test('isValidName', () {
      expect("Mary-Jane O'Brien".isValidName(), isTrue);
      expect('John123'.isValidName(), isFalse);
      expect('   '.isValidName(), isFalse);
    });
  });

  group('NumListExtensionsPro', () {
    test('sumPro / averagePro / maxPro / minPro', () {
      final numbers = [1, 2, 3, 4, 5];
      expect(numbers.sumPro, 15);
      expect(numbers.averagePro, 3.0);
      expect(numbers.maxPro, 5);
      expect(numbers.minPro, 1);
    });

    test('empty list defaults', () {
      final empty = <num>[];
      expect(empty.sumPro, 0);
      expect(empty.averagePro, 0);
      expect(empty.maxPro, isNull);
      expect(empty.minPro, isNull);
    });
  });

  group('DurationExtensionsPro', () {
    test('toFormattedString', () {
      expect(const Duration(seconds: 125).toFormattedString(), '02:05');
      expect(
        const Duration(hours: 1, minutes: 2, seconds: 3).toFormattedString(),
        '01:02:03',
      );
      expect(const Duration(seconds: 5).toFormattedString(), '00:05');
    });

    test('isZero', () {
      expect(Duration.zero.isZero, isTrue);
      expect(const Duration(seconds: 1).isZero, isFalse);
    });

    test('toHumanReadable', () {
      expect(Duration.zero.toHumanReadable(), '0s');
      expect(const Duration(seconds: 5).toHumanReadable(), '5s');
      expect(
        const Duration(days: 1, hours: 2, minutes: 3, seconds: 4)
            .toHumanReadable(),
        '1d 2h 3m 4s',
      );
      expect(const Duration(minutes: 90).toHumanReadable(), '1h 30m');
    });
  });

  group('ColorExtensionsPro', () {
    test('toHex', () {
      expect(const Color(0xFF336699).toHex(), '#336699');
      expect(
        const Color(0xFF336699).toHex(leadingHash: false),
        '336699',
      );
      expect(
        const Color(0xFF336699).toHex(includeAlpha: true),
        '#ff336699',
      );
    });

    test('lighten / darken move lightness in the expected direction', () {
      const color = Color(0xFF336699);
      final lightness = HSLColor.fromColor(color).lightness;
      final lighter = HSLColor.fromColor(color.lighten(0.2)).lightness;
      final darker = HSLColor.fromColor(color.darken(0.2)).lightness;
      expect(lighter, greaterThan(lightness));
      expect(darker, lessThan(lightness));
    });
  });

  group('HexToColorExtensionsPro', () {
    test('toColor parses hex strings', () {
      expect('#336699'.toColor(), const Color(0xFF336699));
      expect('336699'.toColor(), const Color(0xFF336699));
      expect('#369'.toColor(), const Color(0xFF336699));
      expect('not-a-color'.toColor(), isNull);
    });
  });

  group('ColorExtensionsPro (new)', () {
    test('isLight / isDark', () {
      expect(Colors.white.isLight, isTrue);
      expect(Colors.white.isDark, isFalse);
      expect(Colors.black.isDark, isTrue);
      expect(Colors.black.isLight, isFalse);
    });

    test('blend', () {
      expect(Colors.black.blend(Colors.white, 0.0), Colors.black);
      expect(Colors.black.blend(Colors.white, 1.0), Colors.white);
    });

    test('toMaterialColor', () {
      final swatch = const Color(0xFF336699).toMaterialColor();
      expect(swatch, isA<MaterialColor>());
      expect(swatch.shade500, isA<Color>());
    });
  });

  group('WidgetsExtensionsPro', () {
    testWidgets('withOpacity wraps in an Opacity widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('hi').withOpacity(0.5)),
      );
      expect(find.byType(Opacity), findsOneWidget);
    });

    testWidgets('onLongPress triggers callback', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: const Text('hi').onLongPress(() => pressed = true),
        ),
      );
      await tester.longPress(find.text('hi'));
      expect(pressed, isTrue);
    });

    testWidgets('withAspectRatio wraps in an AspectRatio widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('hi').withAspectRatio(2.0)),
      );
      final widget = tester.widget<AspectRatio>(find.byType(AspectRatio));
      expect(widget.aspectRatio, 2.0);
    });

    testWidgets('withSafeArea wraps in a SafeArea widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('hi').withSafeArea()),
      );
      expect(find.byType(SafeArea), findsOneWidget);
    });

    testWidgets('withBackgroundColor sets container color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('hi').withBackgroundColor(Colors.red)),
      );
      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.color, Colors.red);
    });

    testWidgets('withHero wraps in a Hero widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('hi').withHero('tag1')),
      );
      final hero = tester.widget<Hero>(find.byType(Hero));
      expect(hero.tag, 'tag1');
    });
  });

  group('ContextExtensionsPro', () {
    testWidgets('screenWidth/screenHeight/theme/isDarkMode', (tester) async {
      late BuildContext capturedContext;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(capturedContext.screenWidth, greaterThan(0));
      expect(capturedContext.screenHeight, greaterThan(0));
      expect(capturedContext.isDarkMode, isFalse);
      expect(capturedContext.theme, isA<ThemeData>());
      expect(capturedContext.orientation, isA<Orientation>());
      expect(capturedContext.isTablet, isA<bool>());
      expect(capturedContext.safeAreaPadding, isA<EdgeInsets>());
      expect(capturedContext.keyboardHeight, 0);
      expect(capturedContext.isKeyboardVisible, isFalse);
    });
  });

  group('NavigationExtensionsPro (new)', () {
    testWidgets('pushNamed navigates to the named route', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () => context.pushNamed('/details'),
                    child: const Text('go'),
                  ),
                ),
            '/details': (context) => const Text('details screen'),
          },
        ),
      );

      await tester.tap(find.text('go'));
      await tester.pumpAndSettle();
      expect(find.text('details screen'), findsOneWidget);
    });

    testWidgets('canPop reflects navigation stack depth', (tester) async {
      late BuildContext rootContext;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              rootContext = context;
              return const Text('root');
            },
          ),
        ),
      );
      expect(rootContext.canPop, isFalse);
    });
  });

  group('ToastExtensionsPro', () {
    testWidgets('showToast shows then removes the message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => context.showToast(
                'Saved!',
                duration: const Duration(milliseconds: 300),
              ),
              child: const Text('toast'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('toast'));
      await tester.pump();
      expect(find.text('Saved!'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 400));
      expect(find.text('Saved!'), findsNothing);
    });
  });

  group('ClipboardExtensionsPro', () {
    testWidgets('copyToClipboard writes to the clipboard', (tester) async {
      String? copiedText;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          if (call.method == 'Clipboard.setData') {
            copiedText = (call.arguments as Map)['text'] as String?;
          }
          return null;
        },
      );

      await 'hello clipboard'.copyToClipboard();
      expect(copiedText, 'hello clipboard');

      tester.binding.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, null);
    });
  });

  group('HighlightExtensionsPro', () {
    test('highlightOccurrences splits and styles matches', () {
      final spans = 'Hello World Hello'.highlightOccurrences('hello');
      expect(spans.length, 3);
      expect(spans[0].text, 'Hello');
      expect(spans[0].style?.backgroundColor, Colors.yellow);
      expect(spans[1].text, ' World ');
      expect(spans[1].style, isNull);
      expect(spans[2].text, 'Hello');
    });

    test('empty query returns the original text unsplit', () {
      final spans = 'Hello'.highlightOccurrences('');
      expect(spans.length, 1);
      expect(spans[0].text, 'Hello');
    });
  });

  group('DialogExtensionsPro', () {
    testWidgets('showLoadingDialog then hideLoadingDialog', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => context.showLoadingDialog(),
              child: const Text('show'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('show'));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      final context = tester.element(find.text('show'));
      context.hideLoadingDialog();
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('showConfirmDialog resolves true on confirm', (tester) async {
      bool? result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                result = await context.showConfirmDialog(
                  title: 'Delete?',
                  message: 'Are you sure?',
                );
              },
              child: const Text('confirm'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('confirm'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Yes'));
      await tester.pumpAndSettle();
      expect(result, isTrue);
    });
  });
}
