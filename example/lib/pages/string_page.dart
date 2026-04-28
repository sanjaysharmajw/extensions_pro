import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class StringPage extends StatefulWidget {
  const StringPage({super.key});

  @override
  State<StringPage> createState() => _StringPageState();
}

class _StringPageState extends State<StringPage> {
  final _controller = TextEditingController(text: 'hello_world flutter');
  String _input = 'hello_world flutter';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = _input;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF43A047),
        foregroundColor: Colors.white,
        title: const Text('String Extensions', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _InputCard(controller: _controller, onChanged: (v) => setState(() => _input = v)),
          const SizedBox(height: 16),
          _SectionCard(
            color: const Color(0xFF43A047),
            title: 'String Operations',
            children: [
              _ResultRow('capitalize()', s.isNotEmpty ? s.capitalize() : '—'),
              _ResultRow('reverse()', s.reverse()),
              _ResultRow('removeWhitespace()', s.removeWhitespace()),
              _ResultRow('truncate(12)', s.truncate(12)),
              _ResultRow('toCamelCase()', s.toCamelCase()),
              _ResultRow('extractNumbers()', s.extractNumbers().isNotEmpty ? s.extractNumbers() : '(no numbers)'),
              _ResultRow('isPalindrome()', s.isPalindrome().toString()),
              _ResultRow('isNumeric()', s.isNumeric().toString()),
              _ResultRow("countOccurrences('l')", s.countOccurrences('l').toString()),
            ],
          ),
          const SizedBox(height: 12),
          _SectionCard(
            color: const Color(0xFF1565C0),
            title: 'URL Validation',
            children: [
              _ResultRow('isValidUrl()', s.isValidUrl().toString()),
            ],
          ),
          const SizedBox(height: 12),
          _SectionCard(
            color: const Color(0xFF6A1B9A),
            title: 'Try These Examples',
            children: [
              _QuickInput(label: 'racecar', onTap: (v) => setState(() { _input = v; _controller.text = v; })),
              _QuickInput(label: 'hello_world_dart', onTap: (v) => setState(() { _input = v; _controller.text = v; })),
              _QuickInput(label: 'Flutter123App', onTap: (v) => setState(() { _input = v; _controller.text = v; })),
              _QuickInput(label: 'https://flutter.dev', onTap: (v) => setState(() { _input = v; _controller.text = v; })),
            ],
          ),
        ],
      ),
    );
  }
}

class _InputCard extends StatelessWidget {
  const _InputCard({required this.controller, required this.onChanged});
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter a string', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Type any text...',
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                prefixIcon: const Icon(Icons.edit_outlined),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.color, required this.title, required this.children});
  final Color color;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.withAlpha(20),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(width: 4, height: 18, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
                const SizedBox(width: 10),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color)),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow(this.method, this.result);
  final String method;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(method, style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF546E7A))),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Text(result, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickInput extends StatelessWidget {
  const _QuickInput({required this.label, required this.onTap});
  final String label;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: OutlinedButton(
        onPressed: () => onTap(label),
        style: OutlinedButton.styleFrom(
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(label, style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
      ),
    );
  }
}
