import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/biometric_repository.dart';
import 'biometric_state.dart';

class BiometricCubit extends Cubit<BiometricState> {
  final BiometricRepository _repository;

  BiometricCubit(this._repository) : super(BiometricState.initial()) {
    checkBiometricAvailability().then((_) {
      if (state.status == BiometricStatus.available) {
        authenticate(); 
      }
    });
  }

  Future<void> checkBiometricAvailability() async {
   try {
      final isAvailable = await _repository.isBiometricAvailable();
      if (isAvailable) {
        emit(state.copyWith(status: BiometricStatus.available));
      } else {
        emit(state.copyWith(status: BiometricStatus.unavailable));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BiometricStatus.unavailable,
        errorMessage: 'Failed to check biometric availability',
      ));
    }
  }
  Future<void> authenticate() async {
   try {
      final success = await _repository.authenticate();
      if (success) {
        await _repository.setBiometricEnabled(true);
        emit(state.copyWith(status: BiometricStatus.authenticated));
      } else {
        emit(state.copyWith(
          status: BiometricStatus.failed,
          errorMessage: 'Authentication failed',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BiometricStatus.failed,
        errorMessage: 'Authentication error',
      ));
    }
  } 

  
  Future<void> skip() async {
    await _repository.setBiometricEnabled(false);
    emit(state.copyWith(status: BiometricStatus.skipped));
  }
}
