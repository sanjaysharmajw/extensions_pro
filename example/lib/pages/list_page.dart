import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<int> _numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
  final List<String> _names = ['Alice', 'Bob', 'Charlie', 'Alice', 'Diana', 'Bob', 'Eve'];
  String _findInput = '5';
  String _log = '';

  @override
  Widget build(BuildContext context) {
    final deduped = _numbers.removeDuplicates();
    final sorted = [..._numbers]..sortBy((e) => e);
    final sortedDesc = [..._numbers]..sortBy((e) => e, descending: true);
    final chunks = _numbers.chunked(3);
    final findVal = int.tryParse(_findInput);
    final found = findVal != null ? _numbers.find((e) => e == findVal) : null;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3949AB),
        foregroundColor: Colors.white,
        title: const Text('List Extensions', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ListDisplay(label: 'Numbers List', items: _numbers.map((e) => e.toString()).toList(), color: const Color(0xFF3949AB)),
          const SizedBox(height: 12),
          _InfoCard(numbers: _numbers),
          const SizedBox(height: 12),
          _ResultSection(
            color: const Color(0xFF3949AB),
            title: 'Basic Operations',
            items: [
              _R('firstOrDefault()', _numbers.firstOrDefault()?.toString() ?? 'null'),
              _R('lastOrDefault()', _numbers.lastOrDefault()?.toString() ?? 'null'),
              _R('removeDuplicates()', deduped.toString()),
              _R('safeSublist(2, 6)', _numbers.safeSublist(2, 6).toString()),
            ],
          ),
          const SizedBox(height: 12),
          _FindCard(
            input: _findInput,
            found: found,
            onChanged: (v) => setState(() => _findInput = v),
          ),
          const SizedBox(height: 12),
          _ResultSection(
            color: const Color(0xFF1565C0),
            title: 'Sorting',
            items: [
              _R('sortBy (ascending)', sorted.toString()),
              _R('sortBy (descending)', sortedDesc.toString()),
            ],
          ),
          const SizedBox(height: 12),
          _ChunksCard(chunks: chunks),
          const SizedBox(height: 12),
          _StringListCard(names: _names),
          const SizedBox(height: 12),
          _ForEachCard(numbers: _numbers),
          const SizedBox(height: 12),
          _AddIfNotExistsCard(
            numbers: _numbers,
            onAdd: (v) => setState(() {
              _numbers.addIfNotExists(v);
              _log = 'addIfNotExists($v): ${_numbers.contains(v) ? "already existed" : "added"}';
            }),
          ),
          if (_log.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.blue.shade200)),
              child: Text(_log, style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
            ),
          ],
        ],
      ),
    );
  }
}

class _ListDisplay extends StatelessWidget {
  const _ListDisplay({required this.label, required this.items, required this.color});
  final String label;
  final List<String> items;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withAlpha(200)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: items.map((e) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white.withAlpha(40), borderRadius: BorderRadius.circular(8)),
                  child: Text(e, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                )).toList(),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.numbers});
  final List<int> numbers;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _StatBox('Length', numbers.length.toString(), const Color(0xFF3949AB)),
            const SizedBox(width: 12),
            _StatBox('Unique', numbers.removeDuplicates().length.toString(), const Color(0xFF1565C0)),
            const SizedBox(width: 12),
            _StatBox('Min', numbers.reduce((a, b) => a < b ? a : b).toString(), const Color(0xFF1B5E20)),
            const SizedBox(width: 12),
            _StatBox('Max', numbers.reduce((a, b) => a > b ? a : b).toString(), const Color(0xFFB71C1C)),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox(this.label, this.value, this.color);
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(color: color.withAlpha(15), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withAlpha(40))),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _R {
  const _R(this.method, this.result);
  final String method;
  final String result;
}

class _ResultSection extends StatelessWidget {
  const _ResultSection({required this.color, required this.title, required this.items});
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r.method, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF546E7A))),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
                      child: Text(r.result, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
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

class _FindCard extends StatelessWidget {
  const _FindCard({required this.input, required this.found, required this.onChanged});
  final String input;
  final int? found;
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
            const Text('find() — Search in List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: onChanged,
                    controller: TextEditingController(text: input)..selection = TextSelection.collapsed(offset: input.length),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Find number',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: found != null ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: found != null ? Colors.green.shade200 : Colors.red.shade200),
                  ),
                  child: Text(
                    found != null ? 'Found: $found' : 'Not found',
                    style: TextStyle(fontWeight: FontWeight.bold, color: found != null ? Colors.green.shade700 : Colors.red.shade700, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChunksCard extends StatelessWidget {
  const _ChunksCard({required this.chunks});
  final List<List<int>> chunks;

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
            const Text('chunked(3)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'monospace')),
            const SizedBox(height: 10),
            ...chunks.asMap().entries.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(color: const Color(0xFF3949AB).withAlpha(20), shape: BoxShape.circle),
                        child: Center(child: Text('${e.key + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF3949AB)))),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
                          child: Text(e.value.toString(), style: const TextStyle(fontFamily: 'monospace', fontSize: 13)),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _StringListCard extends StatelessWidget {
  const _StringListCard({required this.names});
  final List<String> names;

  @override
  Widget build(BuildContext context) {
    final deduped = names.removeDuplicates();
    final sorted = [...names]..sortBy((e) => e);
    final mapped = names.removeDuplicates().toMap((e) => e[0]);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('String List Examples', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 4),
            Text('Original: ${names.join(', ')}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 10),
            _ListRow('removeDuplicates()', deduped.join(', ')),
            _ListRow('sortBy((e) => e)', sorted.join(', ')),
            _ListRow('toMap((e) => e[0])', mapped.toString()),
          ],
        ),
      ),
    );
  }
}

class _ListRow extends StatelessWidget {
  const _ListRow(this.method, this.result);
  final String method;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(method, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF546E7A))),
          const SizedBox(height: 3),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
            child: Text(result, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class _ForEachCard extends StatelessWidget {
  const _ForEachCard({required this.numbers});
  final List<int> numbers;

  @override
  Widget build(BuildContext context) {
    final buffer = StringBuffer();
    numbers.forEachIndexed((i, item) => buffer.write('[$i]:$item  '));

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('forEachIndexed()', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'monospace')),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
              child: Text(buffer.toString().trim(), style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddIfNotExistsCard extends StatefulWidget {
  const _AddIfNotExistsCard({required this.numbers, required this.onAdd});
  final List<int> numbers;
  final ValueChanged<int> onAdd;

  @override
  State<_AddIfNotExistsCard> createState() => _AddIfNotExistsCardState();
}

class _AddIfNotExistsCardState extends State<_AddIfNotExistsCard> {
  final _ctrl = TextEditingController(text: '7');

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

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
            const Text('addIfNotExists()', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'monospace')),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Number to add',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () {
                    final v = int.tryParse(_ctrl.text);
                    if (v != null) widget.onAdd(v);
                  },
                  style: FilledButton.styleFrom(backgroundColor: const Color(0xFF3949AB)),
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
