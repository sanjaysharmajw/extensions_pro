import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00897B),
        foregroundColor: Colors.white,
        title: const Text('Widget Extensions', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _SectionHeader(title: 'Widget Extensions', color: Color(0xFF00897B)),
          const SizedBox(height: 12),
          _WidgetExtCard(),
          const SizedBox(height: 16),
          const _SectionHeader(title: 'Navigation Extensions', color: Color(0xFF1565C0)),
          const SizedBox(height: 12),
          _NavigationCard(),
          const SizedBox(height: 16),
          const _SectionHeader(title: 'Visibility Toggle', color: Color(0xFFFB8C00)),
          const SizedBox(height: 12),
          _VisibilityCard(
            isVisible: _isVisible,
            onToggle: () => setState(() => _isVisible = !_isVisible),
          ),
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

class _WidgetExtCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _DemoRow(
              label: '.withPadding()',
              child: const Text('Padded Text').withPadding(const EdgeInsets.all(12)),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.withBorder()',
              child: const Text('Bordered').withBorder(color: Colors.teal, width: 2),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.withRoundedCorners()',
              child: Container(
                color: Colors.teal.shade100,
                padding: const EdgeInsets.all(10),
                child: const Text('Rounded'),
              ).withRoundedCorners(radius: 16),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.centered()',
              child: SizedBox(
                width: double.infinity,
                child: const Text('I am centered').centered(),
              ),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.onTap()',
              child: const Text('Tap me!', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)).onTap(() {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Widget tapped via .onTap()!')));
              }),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.withShadow()',
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text('Shadow'),
              ).withShadow(blurRadius: 8, color: Colors.teal.withAlpha(80)),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.withOpacity(0.5)',
              child: Container(
                color: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text('Faded', style: TextStyle(color: Colors.white)),
              ).withOpacity(0.5),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.onLongPress()',
              child: const Text('Long-press me!', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)).onLongPress(() {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Long pressed via .onLongPress()!')));
              }),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.withAspectRatio(3)',
              child: Container(color: Colors.teal.shade100).withAspectRatio(3),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.withBackgroundColor()',
              child: const Text('On amber background').withBackgroundColor(Colors.amber.shade100).withPadding(const EdgeInsets.all(8)),
            ),
            const Divider(height: 24),
            _DemoRow(
              label: '.withHero(tag)',
              child: const Text('Tap to view Hero', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold))
                  .withHero('widget-page-hero')
                  .onTap(() => context.push(const _HeroDetailPage())),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoRow extends StatelessWidget {
  const _DemoRow({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 140, child: Text(label, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF546E7A)))),
        const SizedBox(width: 12),
        Expanded(child: child),
      ],
    );
  }
}

class _NavigationCard extends StatelessWidget {
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
            _NavButton(
              icon: Icons.arrow_forward_ios,
              label: 'context.push(page)',
              subtitle: 'Push new screen onto stack',
              color: const Color(0xFF1565C0),
              onTap: () => context.push(const _DemoDetailPage(title: 'Pushed Page', color: Color(0xFF1565C0))),
            ),
            const SizedBox(height: 10),
            _NavButton(
              icon: Icons.swap_horiz,
              label: 'context.pushReplacement(page)',
              subtitle: 'Replace current screen',
              color: const Color(0xFF00695C),
              onTap: () => context.pushReplacement(const _DemoDetailPage(title: 'Replacement Page', color: Color(0xFF00695C))),
            ),
            const SizedBox(height: 10),
            _NavButton(
              icon: Icons.route_outlined,
              label: "context.pushNamed('/demo-named')",
              subtitle: 'Push a named route',
              color: const Color(0xFF6A1B9A),
              onTap: () => context.pushNamed('/demo-named'),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, size: 18, color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text('context.canPop: ${context.canPop}', style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.icon, required this.label, required this.subtitle, required this.color, required this.onTap});
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: color.withAlpha(15), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withAlpha(50))),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: color, fontWeight: FontWeight.w600)),
                  Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: color.withAlpha(150)),
          ],
        ),
      ),
    );
  }
}

class _VisibilityCard extends StatelessWidget {
  const _VisibilityCard({required this.isVisible, required this.onToggle});
  final bool isVisible;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(12)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.orange.shade200, Colors.orange.shade400]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text('I can be hidden!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              ).withVisibility(isVisible),
            ),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: onToggle,
              icon: Icon(isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined),
              label: Text(isVisible ? 'Hide Widget' : 'Show Widget'),
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFB8C00)),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDetailPage extends StatelessWidget {
  const _HeroDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00897B),
        foregroundColor: Colors.white,
        title: const Text('Hero Destination'),
      ),
      body: Center(
        child: const Text(
          'Tap to view Hero',
          style: TextStyle(color: Color(0xFF00897B), fontWeight: FontWeight.bold, fontSize: 22),
        ).withHero('widget-page-hero'),
      ),
    );
  }
}

class _DemoDetailPage extends StatelessWidget {
  const _DemoDetailPage({required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 64, color: color),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Navigation extension works!', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('context.pop()'),
            ),
          ],
        ),
      ),
    );
  }
}
