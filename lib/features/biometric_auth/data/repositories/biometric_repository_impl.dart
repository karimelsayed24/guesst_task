import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/biometric_repository.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  final LocalAuthentication _localAuth;
  final SharedPreferences _prefs;
  static const String _biometricEnabledKey = 'biometric_enabled';

  BiometricRepositoryImpl(this._localAuth, this._prefs);

  @override
  Future<bool> isBiometricAvailable() async {
    try {
      final canCheckBiometrics = await _localAuth.canCheckBiometrics;
      final isDeviceSupported = await _localAuth.isDeviceSupported();
      return canCheckBiometrics && isDeviceSupported;
    } catch (e) {
      debugPrint('Biometric availability check failed: $e');
      return false;
    }
  }

  @override
  Future<bool> authenticate() async {
    try {
      final isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        return false;
      }

      return await _localAuth.authenticate(
        localizedReason: 'Please authenticate to enable biometric login',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint('Biometric authentication failed: ${e.message}');
      if (e.code == 'no_fragment_activity') {
        // Handle the case where the activity is not a FragmentActivity
        debugPrint(
            'Activity is not a FragmentActivity. Please ensure your MainActivity extends FlutterFragmentActivity');
      }
      return false;
    } catch (e) {
      debugPrint('Biometric authentication error: $e');
      return false;
    }
  }

  @override
  Future<void> setBiometricEnabled(bool enabled) async {
    try {
      await _prefs.setBool(_biometricEnabledKey, enabled);
    } catch (e) {
      debugPrint('Failed to set biometric enabled state: $e');
    }
  }

  @override
  Future<bool> isBiometricEnabled() async {
    try {
      return _prefs.getBool(_biometricEnabledKey) ?? false;
    } catch (e) {
      debugPrint('Failed to get biometric enabled state: $e');
      return false;
    }
  }
}
