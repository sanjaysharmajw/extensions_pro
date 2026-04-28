import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  DateTime _now = DateTime.now();
  Timer? _timer;
  String? _pickedDate;
  TimeOfDay? _pickedTime;
  final _birthYearCtrl = TextEditingController(text: '1995');

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _birthYearCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final birthYear = int.tryParse(_birthYearCtrl.text) ?? 1995;
    final birthday = DateTime(birthYear, 6, 15);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        foregroundColor: Colors.white,
        title: const Text('Date & Time', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ClockCard(now: _now),
          const SizedBox(height: 12),
          _PickerCard(
            pickedDate: _pickedDate,
            pickedTime: _pickedTime,
            onPickDate: () async {
              final date = await context.pickDate(
                dateFormatChange: 'dd MMM yyyy',
                primaryColor: const Color(0xFF8E24AA),
                surfaceColor: Colors.white,
                headerTextColor: Colors.white,
              );
              if (date != null) setState(() => _pickedDate = date);
            },
            onPickTime: () async {
              final time = await context.pickTime();
              if (time != null) setState(() => _pickedTime = time);
            },
          ),
          const SizedBox(height: 12),
          _DateInfoCard(now: _now),
          const SizedBox(height: 12),
          _AgeCard(birthYearCtrl: _birthYearCtrl, birthday: birthday, onChanged: (_) => setState(() {})),
          const SizedBox(height: 12),
          _DateMathCard(now: _now),
          const SizedBox(height: 12),
          _TimeExtCard(now: _now),
        ],
      ),
    );
  }
}

class _ClockCard extends StatelessWidget {
  const _ClockCard({required this.now});
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF8E24AA), Color(0xFF5E35B1)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            now.toDigitalTimeWithSeconds(),
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w200, color: Colors.white, letterSpacing: 4),
          ),
          const SizedBox(height: 4),
          Text(
            now.toDigitalTime(),
            style: const TextStyle(fontSize: 16, color: Colors.white60),
          ),
          const SizedBox(height: 12),
          Text(
            now.format('EEEE, dd MMMM yyyy'),
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TimeChip(now.isMorning ? '☀️ Morning' : now.isAfternoon ? '🌤 Afternoon' : '🌙 Evening'),
              const SizedBox(width: 8),
              _TimeChip(now.weekdayName),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  const _TimeChip(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(40),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white38),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}

class _PickerCard extends StatelessWidget {
  const _PickerCard({required this.pickedDate, required this.pickedTime, required this.onPickDate, required this.onPickTime});
  final String? pickedDate;
  final TimeOfDay? pickedTime;
  final VoidCallback onPickDate;
  final VoidCallback onPickTime;

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
            const Text('Pickers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _PickerButton(
                    icon: Icons.calendar_today_outlined,
                    label: pickedDate ?? 'Pick Date',
                    color: const Color(0xFF8E24AA),
                    onTap: onPickDate,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _PickerButton(
                    icon: Icons.schedule_outlined,
                    label: pickedTime != null ? pickedTime!.format(context) : 'Pick Time',
                    color: const Color(0xFF5E35B1),
                    onTap: onPickTime,
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

class _PickerButton extends StatelessWidget {
  const _PickerButton({required this.icon, required this.label, required this.color, required this.onTap});
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: color.withAlpha(15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withAlpha(60)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Expanded(child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13), overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }
}

class _DateInfoCard extends StatelessWidget {
  const _DateInfoCard({required this.now});
  final DateTime now;

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
            const Text('DateTime Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 12),
            _Row('format("dd MMM yyyy")', now.format('dd MMM yyyy')),
            _Row('format("hh:mm a")', now.format('hh:mm a')),
            _Row('startOfDay', now.startOfDay.toIso8601String().substring(0, 19)),
            _Row('endOfDay', now.endOfDay.toIso8601String().substring(0, 19)),
            _Row('isToday', now.isToday.toString()),
            _Row('isYesterday', now.subtract(const Duration(days: 1)).isYesterday.toString()),
            _Row('isTomorrow', now.add(const Duration(days: 1)).isTomorrow.toString()),
            _Row('weekdayName', now.weekdayName),
          ],
        ),
      ),
    );
  }
}

class _AgeCard extends StatelessWidget {
  const _AgeCard({required this.birthYearCtrl, required this.birthday, required this.onChanged});
  final TextEditingController birthYearCtrl;
  final DateTime birthday;
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
            const Text('Age Calculator', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: birthYearCtrl,
                    onChanged: onChanged,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Birth Year',
                      prefixIcon: const Icon(Icons.cake_outlined, size: 20),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8E24AA).withAlpha(15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF8E24AA).withAlpha(60)),
                  ),
                  child: Text('${birthday.age} yrs', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF8E24AA))),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Birthday: ${birthday.format('dd MMM yyyy')} (June 15, ${ birthYearCtrl.text})', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _DateMathCard extends StatelessWidget {
  const _DateMathCard({required this.now});
  final DateTime now;

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
            const Text('Date Math (from today)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 12),
            _Row('addDays(7)', now.addDays(7).format('dd MMM yyyy')),
            _Row('subtractDays(30)', now.subtractDays(30).format('dd MMM yyyy')),
            _Row('addMonths(3)', now.addMonths(3).format('dd MMM yyyy')),
            _Row('subtractMonths(6)', now.subtractMonths(6).format('dd MMM yyyy')),
            _Row('addYears(1)', now.addYears(1).format('dd MMM yyyy')),
            _Row('subtractYears(5)', now.subtractYears(5).format('dd MMM yyyy')),
          ],
        ),
      ),
    );
  }
}

class _TimeExtCard extends StatelessWidget {
  const _TimeExtCard({required this.now});
  final DateTime now;

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
            const Text('Time Extensions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 12),
            _Row('currentDateFormatted', now.currentDateFormatted),
            _Row('currentTimeFormatted', now.currentTimeFormatted),
            _Row('isMorning', now.isMorning.toString()),
            _Row('isAfternoon', now.isAfternoon.toString()),
            _Row('isEvening', now.isEvening.toString()),
          ],
        ),
      ),
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
