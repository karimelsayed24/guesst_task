// enum BiometricStatus { available, unavailable, authenticated, failed, skipped }

// class BiometricState {
//   final BiometricStatus status;
//   final String? errorMessage;

//   const BiometricState({
//     required this.status,
//     this.errorMessage,
//   });

//   factory BiometricState.initial() =>
//       const BiometricState(status: BiometricStatus.available);

//   BiometricState copyWith({
//     BiometricStatus? status,
//     String? errorMessage,
//   }) {
//     return BiometricState(
//       status: status ?? this.status,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
// }
