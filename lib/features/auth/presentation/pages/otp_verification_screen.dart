import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import '../widgets/otp_input_field.dart';
import 'create_new_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String contactInfo;
  final bool isEmail;

  const OtpVerificationScreen({
    super.key,
    required this.contactInfo,
    required this.isEmail,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _otp = '';
  int _remainingSeconds = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _remainingSeconds = 60;
      _canResend = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _handleOtpChanged(String value) {
    setState(() {
      _otp = value;
    });
  }

  void _handleResend() {
    if (_canResend) {
      _startTimer();
      // TODO: Implement resend OTP logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),

                  Text(
                    'OTP Code verification',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Enter code sent to ${widget.contactInfo}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  OtpInputField(
                    onChanged: _handleOtpChanged,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: _canResend
                        ? GestureDetector(
                            onTap: _handleResend,
                            child: const Text(
                              'Resend code',
                              style: TextStyle(
                                color: Color(0xff4E80C5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Text(
                            'Resend code in $_remainingSeconds s',
                            style: const TextStyle(color: Colors.grey),
                          ),
                  ),
                  const SizedBox(height: 120),
                  // Continue Button
                  CustomButton(
                    text: 'Continue',
                    onPressed: _otp.length == 4
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CreateNewPasswordScreen(),
                              ),
                            );
                          }
                        : () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
