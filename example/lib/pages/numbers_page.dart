import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final _ctrl = TextEditingController(text: '1234');
  int _number = 1234;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final n = _number;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E88E5),
        foregroundColor: Colors.white,
        title: const Text('Number Extensions', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _NumberInput(
            controller: _ctrl,
            onChanged: (v) {
              final parsed = int.tryParse(v);
              if (parsed != null) setState(() => _number = parsed);
            },
          ),
          const SizedBox(height: 16),
          _BigResultCard(number: n),
          const SizedBox(height: 12),
          _ResultCard(
            color: const Color(0xFF1E88E5),
            title: 'Int Extensions',
            items: [
              _R('toRoman', n >= 1 && n <= 3999 ? n.toRoman : 'Out of range (1-3999)'),
              _R('toOrdinal()', n.toOrdinal()),
              _R('toFileSize()', n.toFileSize()),
              _R('toShortString()', n.toShortString()),
              _R('toDurationString', n.toDurationString),
              _R('toWords()', n.toWords()),
            ],
          ),
          const SizedBox(height: 12),
          _ResultCard(
            color: const Color(0xFF6A1B9A),
            title: 'WeekDay (1–7)',
            items: [
              for (int i = 1; i <= 7; i++) _R(i.toString(), '${ i.toWeekDay()} / ${i.toWeekDay(isHalfName: true)}'),
            ],
          ),
          const SizedBox(height: 12),
          _QuickPickCard(
            numbers: const [1, 5, 12, 42, 100, 1000, 10000, 1000000],
            onPick: (v) => setState(() { _number = v; _ctrl.text = v.toString(); }),
          ),
        ],
      ),
    );
  }
}

class _NumberInput extends StatelessWidget {
  const _NumberInput({required this.controller, required this.onChanged});
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
            const Text('Enter a number', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              onChanged: onChanged,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g. 1234',
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                prefixIcon: const Icon(Icons.numbers),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BigResultCard extends StatelessWidget {
  const _BigResultCard({required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1E88E5), Color(0xFF1565C0)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('In Words', style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 6),
          Text(
            number.toWords(),
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _Chip(number.toOrdinal()),
              const SizedBox(width: 8),
              _Chip(number.toRoman),
              const SizedBox(width: 8),
              _Chip(number.toShortString()),
            ],
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white38),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}

class _R {
  const _R(this.method, this.result);
  final String method;
  final String result;
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.color, required this.title, required this.items});
  final Color color;
  final String title;
  final List<_R> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: color.withAlpha(20), borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(width: 4, height: 18, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
                const SizedBox(width: 10),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color)),
              ],
            ),
          ),
          ...items.map((r) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(flex: 4, child: Text(r.method, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF546E7A)))),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
                        child: Text(r.result, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _QuickPickCard extends StatelessWidget {
  const _QuickPickCard({required this.numbers, required this.onPick});
  final List<int> numbers;
  final ValueChanged<int> onPick;

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
            const Text('Quick Pick', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: numbers.map((n) => ActionChip(
                    label: Text(n.toString()),
                    onPressed: () => onPick(n),
                  )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
