import 'package:flutter/material.dart';
import 'pages/string_page.dart';
import 'pages/validation_page.dart';
import 'pages/numbers_page.dart';
import 'pages/datetime_page.dart';
import 'pages/snackbar_page.dart';
import 'pages/widget_page.dart';
import 'pages/converter_page.dart';
import 'pages/list_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _features = [
    _Feature(
      'String Extensions',
      Icons.text_fields_rounded,
      Color(0xFF43A047),
      'capitalize, reverse, truncate & more',
    ),
    _Feature(
      'Validation',
      Icons.shield_outlined,
      Color(0xFFE53935),
      'email, phone, password, OTP & more',
    ),
    _Feature(
      'Number Tools',
      Icons.calculate_outlined,
      Color(0xFF1E88E5),
      'roman, ordinal, file size, words',
    ),
    _Feature(
      'Date & Time',
      Icons.event_rounded,
      Color(0xFF8E24AA),
      'format, age, picker, clock',
    ),
    _Feature(
      'SnackBars',
      Icons.notifications_outlined,
      Color(0xFFFB8C00),
      'success, error, gradient, icon',
    ),
    _Feature(
      'Widget Tools',
      Icons.widgets_outlined,
      Color(0xFF00897B),
      'padding, shadow, rounded, tap',
    ),
    _Feature(
      'Unit Converter',
      Icons.swap_horiz_rounded,
      Color(0xFFD81B60),
      'length, temp, weight, volume',
    ),
    _Feature(
      'List Extensions',
      Icons.playlist_add_check_rounded,
      Color(0xFF3949AB),
      'sort, find, chunk, dedupe',
    ),
  ];

  static final _pages = [
    const StringPage(),
    const ValidationPage(),
    const NumbersPage(),
    const DateTimePage(),
    const SnackbarPage(),
    const WidgetPage(),
    const ConverterPage(),
    const ListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: const Text(
                'Extensions Pro',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6750A4), Color(0xFF9C4DCC)],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: -30,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withAlpha(20),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -20,
                      bottom: 30,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withAlpha(15),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(30),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.extension_rounded,
                                size: 36,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Supercharge your Flutter app',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            _buildStatRow(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  'Explore Extensions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tap any card to see live examples',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: _features.length,
                  itemBuilder: (context, index) {
                    return _FeatureCard(
                      feature: _features[index],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => _pages[index]),
                      ),
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow() {
    return Row(
      children: [
        _StatChip(label: '${_features.length} Categories'),
        const SizedBox(width: 8),
        const _StatChip(label: '60+ Extensions'),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white38),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _Feature {
  const _Feature(this.title, this.icon, this.color, this.subtitle);
  final String title;
  final IconData icon;
  final Color color;
  final String subtitle;
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.feature, required this.onTap});
  final _Feature feature;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: feature.color.withAlpha(25),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(feature.icon, color: feature.color, size: 24),
              ),
              const Spacer(),
              Text(
                feature.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              Text(
                feature.subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
