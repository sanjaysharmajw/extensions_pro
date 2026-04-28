import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _valueCtrl = TextEditingController(text: '100');
  double _value = 100;

  // Distance calculator
  final _lat1Ctrl = TextEditingController(text: '28.7041');
  final _lon1Ctrl = TextEditingController(text: '77.1025');
  final _lat2Ctrl = TextEditingController(text: '19.0760');
  final _lon2Ctrl = TextEditingController(text: '72.8777');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _valueCtrl.dispose();
    _lat1Ctrl.dispose();
    _lon1Ctrl.dispose();
    _lat2Ctrl.dispose();
    _lon2Ctrl.dispose();
    super.dispose();
  }

  double get _lat1 => double.tryParse(_lat1Ctrl.text) ?? 0;
  double get _lon1 => double.tryParse(_lon1Ctrl.text) ?? 0;
  double get _lat2 => double.tryParse(_lat2Ctrl.text) ?? 0;
  double get _lon2 => double.tryParse(_lon2Ctrl.text) ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD81B60),
        foregroundColor: Colors.white,
        title: const Text('Converter & Distance', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(text: 'Length'),
            Tab(text: 'Temp & Weight'),
            Tab(text: 'Distance'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _LengthTab(value: _value, ctrl: _valueCtrl, onChanged: (v) {
            final d = double.tryParse(v);
            if (d != null) setState(() => _value = d);
          }),
          _TempWeightTab(value: _value, ctrl: _valueCtrl, onChanged: (v) {
            final d = double.tryParse(v);
            if (d != null) setState(() => _value = d);
          }),
          _DistanceTab(
            lat1Ctrl: _lat1Ctrl,
            lon1Ctrl: _lon1Ctrl,
            lat2Ctrl: _lat2Ctrl,
            lon2Ctrl: _lon2Ctrl,
            lat1: _lat1,
            lon1: _lon1,
            lat2: _lat2,
            lon2: _lon2,
            onChanged: (_) => setState(() {}),
          ),
        ],
      ),
    );
  }
}

class _LengthTab extends StatelessWidget {
  const _LengthTab({required this.value, required this.ctrl, required this.onChanged});
  final double value;
  final TextEditingController ctrl;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ValueInput(ctrl: ctrl, onChanged: onChanged, unit: 'meters'),
        const SizedBox(height: 16),
        _ConversionCard(
          color: const Color(0xFFD81B60),
          title: 'Length Conversions (from meters)',
          items: [
            _CR('toKilometersPro', '${value.toKilometersPro.toStringAsFixed(4)} km'),
            _CR('toMilesPro', '${value.toMilesPro.toStringAsFixed(4)} mi'),
            _CR('toMetersFromFeetPro', '${value.toMetersFromFeetPro.toStringAsFixed(4)} m (from ft)'),
            _CR('toCentimetersFromInchesPro', '${value.toCentimetersFromInchesPro.toStringAsFixed(4)} cm'),
            _CR('toInchesFromCentimetersPro', '${value.toInchesFromCentimetersPro.toStringAsFixed(4)} in'),
          ],
        ),
        const SizedBox(height: 12),
        _ConversionCard(
          color: const Color(0xFF1565C0),
          title: 'Digital Storage (from MB)',
          items: [
            _CR('toGBPro', '${value.toGBPro.toStringAsFixed(4)} GB'),
            _CR('toKilobytesPro', '${value.toKilobytesPro.toStringAsFixed(0)} KB'),
            _CR('toMBPro', '${value.toMBPro.toStringAsFixed(0)} MB (from GB)'),
          ],
        ),
        const SizedBox(height: 12),
        _ConversionCard(
          color: const Color(0xFF00695C),
          title: 'Speed',
          items: [
            _CR('toMilesPerHourPro', '${value.toMilesPerHourPro.toStringAsFixed(3)} mph'),
            _CR('toKilometersPerHourPro', '${value.toKilometersPerHourPro.toStringAsFixed(3)} km/h'),
          ],
        ),
      ],
    );
  }
}

class _TempWeightTab extends StatelessWidget {
  const _TempWeightTab({required this.value, required this.ctrl, required this.onChanged});
  final double value;
  final TextEditingController ctrl;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ValueInput(ctrl: ctrl, onChanged: onChanged, unit: 'value'),
        const SizedBox(height: 16),
        _ConversionCard(
          color: const Color(0xFFE65100),
          title: 'Temperature',
          items: [
            _CR('toFahrenheitPro (°C → °F)', '${value.toFahrenheitPro.toStringAsFixed(2)} °F'),
            _CR('toCelsiusPro (°F → °C)', '${value.toCelsiusPro.toStringAsFixed(2)} °C'),
          ],
        ),
        const SizedBox(height: 12),
        _ConversionCard(
          color: const Color(0xFF6A1B9A),
          title: 'Weight',
          items: [
            _CR('toPoundsPro (kg → lb)', '${value.toPoundsPro.toStringAsFixed(4)} lb'),
            _CR('toKilogramsPro (lb → kg)', '${value.toKilogramsPro.toStringAsFixed(4)} kg'),
            _CR('toGramsPro (oz → g)', '${value.toGramsPro.toStringAsFixed(4)} g'),
            _CR('toOuncesPro (g → oz)', '${value.toOuncesPro.toStringAsFixed(4)} oz'),
          ],
        ),
        const SizedBox(height: 12),
        _ConversionCard(
          color: const Color(0xFF1B5E20),
          title: 'Time',
          items: [
            _CR('toMinutesPro (s → min)', '${value.toMinutesPro.toStringAsFixed(4)} min'),
            _CR('toHoursPro (s → hr)', '${value.toHoursPro.toStringAsFixed(6)} hr'),
            _CR('toDaysPro (hr → days)', '${value.toDaysPro.toStringAsFixed(4)} days'),
          ],
        ),
        const SizedBox(height: 12),
        _ConversionCard(
          color: const Color(0xFF0D47A1),
          title: 'Energy & Power',
          items: [
            _CR('toCaloriesPro (J → cal)', '${value.toCaloriesPro.toStringAsFixed(4)} cal'),
            _CR('toJoulesPro (cal → J)', '${value.toJoulesPro.toStringAsFixed(4)} J'),
            _CR('toKilowattsPro (W → kW)', '${value.toKilowattsPro.toStringAsFixed(4)} kW'),
          ],
        ),
      ],
    );
  }
}

class _DistanceTab extends StatelessWidget {
  const _DistanceTab({
    required this.lat1Ctrl, required this.lon1Ctrl,
    required this.lat2Ctrl, required this.lon2Ctrl,
    required this.lat1, required this.lon1,
    required this.lat2, required this.lon2,
    required this.onChanged,
  });
  final TextEditingController lat1Ctrl, lon1Ctrl, lat2Ctrl, lon2Ctrl;
  final double lat1, lon1, lat2, lon2;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final distance = 0.calculateDistance(
      startLatitude: lat1, startLongitude: lon1,
      endLatitude: lat2, endLongitude: lon2,
    );

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _LocationCard(title: 'Point A', icon: Icons.location_on, color: const Color(0xFF1E88E5), latCtrl: lat1Ctrl, lonCtrl: lon1Ctrl, onChanged: onChanged),
        const SizedBox(height: 12),
        _LocationCard(title: 'Point B', icon: Icons.flag_outlined, color: const Color(0xFFE53935), latCtrl: lat2Ctrl, lonCtrl: lon2Ctrl, onChanged: onChanged),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFFD81B60), Color(0xFF880E4F)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Icon(Icons.social_distance, color: Colors.white70, size: 32),
              const SizedBox(height: 8),
              const Text('Distance Between Points', style: TextStyle(color: Colors.white70, fontSize: 13)),
              const SizedBox(height: 8),
              Text(
                '${distance.toStringAsFixed(2)} km',
                style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                '${(distance * 0.621371).toStringAsFixed(2)} miles',
                style: const TextStyle(color: Colors.white60, fontSize: 16),
              ),
              const SizedBox(height: 12),
              const Text('calculateDistance() extension on num', style: TextStyle(fontFamily: 'monospace', color: Colors.white38, fontSize: 11)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _PresetCard(
          presets: const [
            _Preset('Delhi → Mumbai', 28.7041, 77.1025, 19.0760, 72.8777),
            _Preset('New York → London', 40.7128, -74.0060, 51.5074, -0.1278),
            _Preset('Sydney → Tokyo', -33.8688, 151.2093, 35.6762, 139.6503),
          ],
          lat1Ctrl: lat1Ctrl,
          lon1Ctrl: lon1Ctrl,
          lat2Ctrl: lat2Ctrl,
          lon2Ctrl: lon2Ctrl,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _Preset {
  const _Preset(this.label, this.lat1, this.lon1, this.lat2, this.lon2);
  final String label;
  final double lat1, lon1, lat2, lon2;
}

class _PresetCard extends StatelessWidget {
  const _PresetCard({required this.presets, required this.lat1Ctrl, required this.lon1Ctrl, required this.lat2Ctrl, required this.lon2Ctrl, required this.onChanged});
  final List<_Preset> presets;
  final TextEditingController lat1Ctrl, lon1Ctrl, lat2Ctrl, lon2Ctrl;
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
            const Text('Try Presets', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            ...presets.map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      lat1Ctrl.text = p.lat1.toString();
                      lon1Ctrl.text = p.lon1.toString();
                      lat2Ctrl.text = p.lat2.toString();
                      lon2Ctrl.text = p.lon2.toString();
                      onChanged('');
                    },
                    icon: const Icon(Icons.place_outlined, size: 16),
                    label: Text(p.label, style: const TextStyle(fontSize: 12)),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({required this.title, required this.icon, required this.color, required this.latCtrl, required this.lonCtrl, required this.onChanged});
  final String title;
  final IconData icon;
  final Color color;
  final TextEditingController latCtrl, lonCtrl;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: color.withAlpha(60))),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 18),
                const SizedBox(width: 8),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _CoordField(label: 'Latitude', ctrl: latCtrl, onChanged: onChanged)),
                const SizedBox(width: 10),
                Expanded(child: _CoordField(label: 'Longitude', ctrl: lonCtrl, onChanged: onChanged)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CoordField extends StatelessWidget {
  const _CoordField({required this.label, required this.ctrl, required this.onChanged});
  final String label;
  final TextEditingController ctrl;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ctrl,
      onChanged: onChanged,
      keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        isDense: true,
      ),
    );
  }
}

class _ValueInput extends StatelessWidget {
  const _ValueInput({required this.ctrl, required this.onChanged, required this.unit});
  final TextEditingController ctrl;
  final ValueChanged<String> onChanged;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const Icon(Icons.input_outlined, color: Color(0xFFD81B60)),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: ctrl,
                onChanged: onChanged,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Value ($unit)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CR {
  const _CR(this.label, this.value);
  final String label;
  final String value;
}

class _ConversionCard extends StatelessWidget {
  const _ConversionCard({required this.color, required this.title, required this.items});
  final Color color;
  final String title;
  final List<_CR> items;

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
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color)),
              ],
            ),
          ),
          ...items.map((r) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                child: Row(
                  children: [
                    Expanded(flex: 5, child: Text(r.label, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF546E7A)))),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
                        child: Text(r.value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis, textAlign: TextAlign.right),
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
