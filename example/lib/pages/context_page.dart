import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ContextUtilitiesPage extends StatelessWidget {
  const ContextUtilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        title: const Text('Context & Utilities', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _SectionHeader(title: 'Screen & Theme Extensions', color: Color(0xFF00695C)),
          const SizedBox(height: 12),
          _ScreenThemeCard(),
          const SizedBox(height: 16),
          const _SectionHeader(title: 'Dialog Extensions', color: Color(0xFF6750A4)),
          const SizedBox(height: 12),
          _DialogCard(),
          const SizedBox(height: 16),
          const _SectionHeader(title: 'Toast Extensions', color: Color(0xFFD81B60)),
          const SizedBox(height: 12),
          _ToastCard(),
          const SizedBox(height: 16),
          const _SectionHeader(title: 'Clipboard Extensions', color: Color(0xFF1565C0)),
          const SizedBox(height: 12),
          const _ClipboardCard(),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 20, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 10),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(label, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF546E7A)))),
          const SizedBox(width: 8),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
              child: Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenThemeCard extends StatelessWidget {
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
            _Row('context.screenWidth', context.screenWidth.toStringAsFixed(1)),
            _Row('context.screenHeight', context.screenHeight.toStringAsFixed(1)),
            _Row('context.orientation', context.orientation.toString()),
            _Row('context.isTablet', context.isTablet.toString()),
            _Row('context.isDarkMode', context.isDarkMode.toString()),
            _Row('context.isKeyboardVisible', context.isKeyboardVisible.toString()),
            _Row('context.keyboardHeight', context.keyboardHeight.toStringAsFixed(1)),
            _Row('context.safeAreaPadding', context.safeAreaPadding.toString()),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => context.unfocus(),
              icon: const Icon(Icons.keyboard_hide_outlined),
              label: const Text('context.unfocus()'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogCard extends StatelessWidget {
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
            FilledButton.icon(
              onPressed: () async {
                context.showLoadingDialog();
                await Future.delayed(const Duration(seconds: 2));
                if (context.mounted) context.hideLoadingDialog();
              },
              icon: const Icon(Icons.hourglass_bottom_outlined),
              label: const Text('showLoadingDialog() for 2s'),
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFF6750A4)),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () async {
                final confirmed = await context.showConfirmDialog(
                  title: 'Delete item?',
                  message: 'This action cannot be undone.',
                  confirmText: 'Delete',
                  cancelText: 'Cancel',
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(confirmed ? 'Confirmed!' : 'Cancelled')),
                  );
                }
              },
              icon: const Icon(Icons.help_outline),
              label: const Text('showConfirmDialog()'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FilledButton(
              onPressed: () => context.showToast('Saved!'),
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFFD81B60)),
              child: const Text('showToast("Saved!")'),
            ),
            OutlinedButton(
              onPressed: () => context.showToast(
                'Something went wrong',
                backgroundColor: Colors.red.shade700,
                duration: const Duration(seconds: 3),
              ),
              child: const Text('Custom color & duration'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClipboardCard extends StatefulWidget {
  const _ClipboardCard();

  @override
  State<_ClipboardCard> createState() => _ClipboardCardState();
}

class _ClipboardCardState extends State<_ClipboardCard> {
  final _ctrl = TextEditingController(text: 'Referral code: FLUTTER25');
  String _status = '';

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
            TextField(
              controller: _ctrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
            const SizedBox(height: 10),
            FilledButton.icon(
              onPressed: () async {
                await _ctrl.text.copyToClipboard();
                setState(() => _status = 'Copied "${_ctrl.text}" to clipboard!');
              },
              icon: const Icon(Icons.copy_outlined),
              label: const Text('copyToClipboard()'),
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFF1565C0)),
            ),
            if (_status.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(_status, style: const TextStyle(fontSize: 12, color: Colors.green)),
            ],
          ],
        ),
      ),
    );
  }
}
