import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final _emailCtrl = TextEditingController(text: 'user@example.com');
  final _phoneCtrl = TextEditingController(text: '+919876543210');
  final _passCtrl = TextEditingController(text: 'Flutter@123');
  final _confirmCtrl = TextEditingController(text: 'Flutter@123');
  final _otpCtrl = TextEditingController(text: '123456');
  final _cardCtrl = TextEditingController(text: '4532015112830366');
  final _hexCtrl = TextEditingController(text: '#FF6750A4');

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    _otpCtrl.dispose();
    _cardCtrl.dispose();
    _hexCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE53935),
        foregroundColor: Colors.white,
        title: const Text('Validation Extensions', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ValidationField(
            label: 'Email Address',
            icon: Icons.email_outlined,
            controller: _emailCtrl,
            validator: (v) => v.isValidEmail(),
            validLabel: 'Valid Email',
            invalidLabel: 'Invalid Email',
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 12),
          _ValidationField(
            label: 'Phone Number',
            icon: Icons.phone_outlined,
            controller: _phoneCtrl,
            validator: (v) => v.isValidPhoneNumber(),
            validLabel: 'Valid Phone',
            invalidLabel: 'Invalid Phone',
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 12),
          _ValidationField(
            label: 'Password',
            icon: Icons.lock_outline,
            controller: _passCtrl,
            validator: (v) => v.isStrongPassword(),
            validLabel: 'Strong Password',
            invalidLabel: 'Weak Password (need upper, lower, digit, 8+ chars)',
            onChanged: (_) => setState(() {}),
            obscure: true,
          ),
          const SizedBox(height: 12),
          _PasswordMatchField(
            passCtrl: _passCtrl,
            confirmCtrl: _confirmCtrl,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 12),
          _ValidationField(
            label: 'OTP (6 digits)',
            icon: Icons.pin_outlined,
            controller: _otpCtrl,
            validator: (v) => v.isValidOTP(),
            validLabel: 'Valid OTP',
            invalidLabel: 'Invalid OTP (must be 6 digits)',
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 12),
          _ValidationField(
            label: 'Credit Card Number',
            icon: Icons.credit_card_outlined,
            controller: _cardCtrl,
            validator: (v) => v.isValidCreditCardNumber(),
            validLabel: 'Valid Card (Luhn ✓)',
            invalidLabel: 'Invalid Card Number',
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 12),
          _ValidationField(
            label: 'Hex Color',
            icon: Icons.palette_outlined,
            controller: _hexCtrl,
            validator: (v) => v.isValidHexColor(),
            validLabel: 'Valid Hex Color',
            invalidLabel: 'Invalid Hex Color',
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 12),
          _MultiResultCard(
            title: 'More Validators',
            items: [
              _Item('isDigitsOnly("42")', '42'.isDigitsOnly()),
              _Item('isAlphaNumeric("Abc123")', 'Abc123'.isAlphaNumeric()),
              _Item('isAlphaNumeric("Abc@123")', 'Abc@123'.isAlphaNumeric()),
              _Item('isValidLatitude("91.0")', '91.0'.isValidLatitude()),
              _Item('isValidLongitude("120.5")', '120.5'.isValidLongitude()),
            ],
          ),
        ],
      ),
    );
  }
}

class _ValidationField extends StatelessWidget {
  const _ValidationField({
    required this.label,
    required this.icon,
    required this.controller,
    required this.validator,
    required this.validLabel,
    required this.invalidLabel,
    required this.onChanged,
    this.obscure = false,
  });
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool Function(String) validator;
  final String validLabel;
  final String invalidLabel;
  final ValueChanged<String> onChanged;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    final isValid = validator(controller.text);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: isValid ? Colors.green.shade200 : Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              onChanged: onChanged,
              obscureText: obscure,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade50,
                prefixIcon: Icon(icon, size: 20),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                isDense: true,
              ),
            ),
            const SizedBox(height: 8),
            _StatusBadge(isValid: isValid, validLabel: validLabel, invalidLabel: invalidLabel),
          ],
        ),
      ),
    );
  }
}

class _PasswordMatchField extends StatelessWidget {
  const _PasswordMatchField({required this.passCtrl, required this.confirmCtrl, required this.onChanged});
  final TextEditingController passCtrl;
  final TextEditingController confirmCtrl;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final matches = passCtrl.text.isPasswordMatch(confirmCtrl.text);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: matches ? Colors.green.shade200 : Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Confirm Password', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 8),
            TextField(
              controller: confirmCtrl,
              onChanged: onChanged,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade50,
                prefixIcon: const Icon(Icons.lock_outline, size: 20),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                isDense: true,
              ),
            ),
            const SizedBox(height: 8),
            _StatusBadge(isValid: matches, validLabel: 'Passwords match', invalidLabel: 'Passwords do not match'),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.isValid, required this.validLabel, required this.invalidLabel});
  final bool isValid;
  final String validLabel;
  final String invalidLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isValid ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isValid ? Colors.green.shade200 : Colors.red.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isValid ? Icons.check_circle_outline : Icons.cancel_outlined, size: 16, color: isValid ? Colors.green : Colors.red),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              isValid ? validLabel : invalidLabel,
              style: TextStyle(fontSize: 12, color: isValid ? Colors.green.shade700 : Colors.red.shade700, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item {
  const _Item(this.label, this.value);
  final String label;
  final bool value;
}

class _MultiResultCard extends StatelessWidget {
  const _MultiResultCard({required this.title, required this.items});
  final String title;
  final List<_Item> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Expanded(child: Text(item.label, style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF546E7A)))),
                    Icon(item.value ? Icons.check_circle : Icons.cancel, size: 18, color: item.value ? Colors.green : Colors.red),
                  ],
                ),
              )),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
