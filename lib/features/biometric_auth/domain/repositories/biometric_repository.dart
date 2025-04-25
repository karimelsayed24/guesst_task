abstract class BiometricRepository {
  Future<bool> isBiometricAvailable();
  Future<bool> authenticate();
  Future<void> setBiometricEnabled(bool enabled);
  Future<bool> isBiometricEnabled();
}
