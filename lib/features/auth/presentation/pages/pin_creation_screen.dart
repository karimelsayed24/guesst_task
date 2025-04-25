import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../biometric_auth/presentation/pages/biometric_screen.dart';
import '../widgets/pin_input_field.dart';

class PinCreationScreen extends StatefulWidget {
  const PinCreationScreen({super.key});

  @override
  State<PinCreationScreen> createState() => _PinCreationScreenState();
}

class _PinCreationScreenState extends State<PinCreationScreen> {
  String? _pin;
  bool _isPinComplete = false;

  void _handlePinCompleted(String pin) {
    setState(() {
      _pin = pin;
      _isPinComplete = true;
    });
  }

  void _handleContinue() {
    if (_isPinComplete) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BiometricScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Title
                Text(
                  'Create New PIN',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // Subtitle
                const Text(
                  'Add PIN Number to secure your account',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                // PIN Input Fields
                PinInputField(
                  onPinCompleted: _handlePinCompleted,
                  obscureText: true,
                ),
                const SizedBox(height: 120),
                // Continue Button
                if (_isPinComplete)
                  CustomButton(
                    text: 'Continue',
                    onPressed: _handleContinue,
                  )
                else
                  CustomButton(
                    text: 'Continue',
                    onPressed: () {},
                    backgroundColor: Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
