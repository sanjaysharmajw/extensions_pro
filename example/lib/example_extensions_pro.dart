import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ExampleExtensionsPro extends StatefulWidget {
  const ExampleExtensionsPro({super.key});
  @override
  State<ExampleExtensionsPro> createState() => _ExampleExtensionsProState();
}

class _ExampleExtensionsProState extends State<ExampleExtensionsPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Asset Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  all();
                },
                child: const Text("Click"))
          ],
        ),
      ),
    );
  }
  void all() {
    final list = [1, 2, 3, 4, 5, 6, 6, 7, 8, 9];

    // 1. firstOrDefault
    print(list.firstOrDefault()); // 1

    // 2. lastOrDefault
    print(list.lastOrDefault()); // 9

    // 3. addIfNotExists
    list.addIfNotExists(10);
    print(list); // [1, 2, 3, 4, 5, 6, 6, 7, 8, 9, 10]

    // 4. removeDuplicates
    print(list.removeDuplicates()); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    // 5. safeSublist
    print(list.safeSublist(2, 5)); // [3, 4, 5]

    // 6. find
    print(list.find((x) => x > 5)); // 6

    // 7. sortBy
    final names = ['Zara', 'Anna', 'Mike'];
    names.sortBy((name) => name, descending: true);
    print(names); // ['Zara', 'Mike', 'Anna']

    // 8. toMap
    final map = list.toMap((x) => x.toString());
    print(map); // {'1': 1, '2': 2, '3': 3, ...}

    // 9. forEachIndexed
    list.forEachIndexed((index, item) {
      print('Index $index: $item');
    });

    // 10. chunked
    print(list.chunked(3)); // [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
  }

}
