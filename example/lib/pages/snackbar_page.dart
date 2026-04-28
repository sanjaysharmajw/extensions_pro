import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFB8C00),
        foregroundColor: Colors.white,
        title: const Text('SnackBar Extensions', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _InfoCard(),
          const SizedBox(height: 16),
          _SnackbarGrid(
            items: [
              _SnackItem(
                label: 'Success',
                subtitle: 'showSuccessSnackBar()',
                icon: Icons.check_circle_outline,
                color: Colors.green,
                onTap: () => context.showSuccessSnackBar('Operation completed successfully!'),
              ),
              _SnackItem(
                label: 'Error',
                subtitle: 'showErrorSnackBar()',
                icon: Icons.error_outline,
                color: Colors.red,
                onTap: () => context.showErrorSnackBar('Something went wrong!'),
              ),
              _SnackItem(
                label: 'Custom',
                subtitle: 'showCustomSnackBar()',
                icon: Icons.tune_outlined,
                color: const Color(0xFF6750A4),
                onTap: () => context.showCustomSnackBar(
                  message: 'This is a custom snackbar!',
                  backgroundColor: const Color(0xFF6750A4),
                  duration: const Duration(seconds: 4),
                ),
              ),
              _SnackItem(
                label: 'With Icon',
                subtitle: 'showIconSnackBar()',
                icon: Icons.star_outline,
                color: Colors.amber,
                onTap: () => context.showIconSnackBar(
                  message: 'You have a new notification!',
                  icon: Icons.notifications_active,
                  backgroundColor: Colors.amber.shade700,
                ),
              ),
              _SnackItem(
                label: 'Gradient',
                subtitle: 'showGradientSnackBar()',
                icon: Icons.gradient_outlined,
                color: Colors.purple,
                onTap: () => context.showGradientSnackBar('Beautiful gradient snackbar!'),
              ),
              _SnackItem(
                label: 'Persistent',
                subtitle: 'showPersistentSnackBar()',
                icon: Icons.push_pin_outlined,
                color: Colors.teal,
                onTap: () => context.showPersistentSnackBar(
                  message: 'Tap DISMISS to close me!',
                  dismissColor: Colors.teal.shade200,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _CodeCard(),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFB8C00), Color(0xFFE65100)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withAlpha(40), borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.notifications, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('6 SnackBar Styles', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 4),
                Text('Tap each card to see it in action', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SnackItem {
  const _SnackItem({required this.label, required this.subtitle, required this.icon, required this.color, required this.onTap});
  final String label;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
}

class _SnackbarGrid extends StatelessWidget {
  const _SnackbarGrid({required this.items});
  final List<_SnackItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final item = items[i];
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: item.color.withAlpha(60)),
          ),
          child: InkWell(
            onTap: item.onTap,
            borderRadius: BorderRadius.circular(18),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: item.color.withAlpha(25), borderRadius: BorderRadius.circular(10)),
                    child: Icon(item.icon, color: item.color, size: 22),
                  ),
                  const Spacer(),
                  Text(item.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(item.subtitle, style: TextStyle(fontSize: 10, color: Colors.grey.shade500, fontFamily: 'monospace'), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CodeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFF1E1E2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                const SizedBox(width: 12),
                const Text('Usage', style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '// Success\ncontext.showSuccessSnackBar("Done!");\n\n'
              '// Error\ncontext.showErrorSnackBar("Failed!");\n\n'
              '// Gradient\ncontext.showGradientSnackBar("Wow!");',
              style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF89CFF0), height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
