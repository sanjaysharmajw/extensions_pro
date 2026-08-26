import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  Color _color = const Color(0xFF6750A4);
  final _hexCtrl = TextEditingController(text: '#6750A4');

  static const _palette = [
    Color(0xFF6750A4),
    Color(0xFFE53935),
    Color(0xFF1E88E5),
    Color(0xFF43A047),
    Color(0xFFFB8C00),
    Color(0xFF00897B),
  ];

  @override
  void dispose() {
    _hexCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = _color;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6750A4),
        foregroundColor: Colors.white,
        title: const Text('Color Extensions', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SwatchCard(color: c),
          const SizedBox(height: 16),
          _PaletteCard(
            colors: _palette,
            selected: c,
            onSelect: (color) => setState(() {
              _color = color;
              _hexCtrl.text = color.toHex(leadingHash: false);
            }),
          ),
          const SizedBox(height: 16),
          _HexInputCard(
            controller: _hexCtrl,
            onSubmit: (hex) {
              final parsed = hex.toColor();
              if (parsed != null) setState(() => _color = parsed);
            },
          ),
          const SizedBox(height: 16),
          _ResultCard(
            color: c,
            items: [
              _R('toHex()', c.toHex()),
              _R('toHex(includeAlpha: true)', c.toHex(includeAlpha: true)),
              _R('isLight', c.isLight.toString()),
              _R('isDark', c.isDark.toString()),
            ],
          ),
          const SizedBox(height: 16),
          _LightenDarkenCard(color: c),
          const SizedBox(height: 16),
          _BlendCard(color: c),
          const SizedBox(height: 16),
          _MaterialSwatchCard(color: c),
        ],
      ),
    );
  }
}

class _SwatchCard extends StatelessWidget {
  const _SwatchCard({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: color.withAlpha(100), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Center(
        child: Text(
          color.toHex(),
          style: TextStyle(
            color: color.isLight ? Colors.black87 : Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
          ),
        ),
      ),
    );
  }
}

class _PaletteCard extends StatelessWidget {
  const _PaletteCard({required this.colors, required this.selected, required this.onSelect});
  final List<Color> colors;
  final Color selected;
  final ValueChanged<Color> onSelect;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: colors.map((color) {
            final isSelected = color == selected;
            return GestureDetector(
              onTap: () => onSelect(color),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected ? Border.all(color: Colors.black87, width: 3) : null,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _HexInputCard extends StatelessWidget {
  const _HexInputCard({required this.controller, required this.onSubmit});
  final TextEditingController controller;
  final ValueChanged<String> onSubmit;

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
            const Text("'#RRGGBB'.toColor()", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'monospace')),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              onSubmitted: onSubmit,
              onChanged: onSubmit,
              decoration: InputDecoration(
                hintText: '#RRGGBB',
                prefixIcon: const Icon(Icons.tag, size: 20),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                isDense: true,
              ),
            ),
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

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.color, required this.items});
  final Color color;
  final List<_R> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map((r) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
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
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _LightenDarkenCard extends StatelessWidget {
  const _LightenDarkenCard({required this.color});
  final Color color;

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
            const Text('lighten() / darken()', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'monospace')),
            const SizedBox(height: 12),
            Row(
              children: [
                for (final amount in [0.4, 0.2, 0.0, -0.2, -0.4])
                  Expanded(
                    child: Container(
                      height: 44,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      color: amount == 0
                          ? color
                          : amount > 0
                              ? color.lighten(amount)
                              : color.darken(-amount),
                      child: amount == 0 ? const Center(child: Icon(Icons.circle, size: 8, color: Colors.white54)) : null,
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

class _BlendCard extends StatelessWidget {
  const _BlendCard({required this.color});
  final Color color;

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
            const Text('blend(Colors.white, ratio)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'monospace')),
            const SizedBox(height: 12),
            Row(
              children: [
                for (final ratio in [0.0, 0.25, 0.5, 0.75, 1.0])
                  Expanded(
                    child: Container(
                      height: 44,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      color: color.blend(Colors.white, ratio),
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

class _MaterialSwatchCard extends StatelessWidget {
  const _MaterialSwatchCard({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    final swatch = color.toMaterialColor();
    const shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('toMaterialColor()', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'monospace')),
            const SizedBox(height: 12),
            Wrap(
              children: shades
                  .map((shade) => Container(
                        width: 36,
                        height: 36,
                        color: swatch[shade],
                        child: Center(
                          child: Text(
                            '$shade',
                            style: TextStyle(fontSize: 9, color: shade >= 500 ? Colors.white : Colors.black87),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
