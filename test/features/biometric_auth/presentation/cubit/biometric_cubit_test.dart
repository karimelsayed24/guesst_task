// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:guessit_task/features/biometric_auth/domain/repositories/biometric_repository.dart';
// import 'package:guessit_task/features/biometric_auth/presentation/cubit/biometric_cubit.dart';
// import 'package:guessit_task/features/biometric_auth/presentation/cubit/biometric_state.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// @GenerateMocks([BiometricRepository])
// void main() {
//   late BiometricCubit cubit;
//   late MockBiometricRepository mockRepository;

//   setUp(() {
//     mockRepository = MockBiometricRepository();
//     cubit = BiometricCubit(mockRepository);
//   });

//   group('BiometricCubit', () {
//     test('initial state is correct', () {
//       expect(
//           cubit.state, const BiometricState(status: BiometricStatus.available));
//     });

//     blocTest<BiometricCubit, BiometricState>(
//       'emits unavailable state when biometric check fails',
//       build: () {
//         when(mockRepository.isBiometricAvailable())
//             .thenAnswer((_) async => false);
//         return cubit;
//       },
//       act: (cubit) => cubit.checkBiometricAvailability(),
//       expect: () => [
//         const BiometricState(
//           status: BiometricStatus.unavailable,
//           errorMessage: 'Failed to check biometric availability',
//         ),
//       ],
//     );

//     blocTest<BiometricCubit, BiometricState>(
//       'emits authenticated state when authentication succeeds',
//       build: () {
//         when(mockRepository.authenticate()).thenAnswer((_) async => true);
//         when(mockRepository.setBiometricEnabled(true)).thenAnswer((_) async {});
//         return cubit;
//       },
//       act: (cubit) => cubit.authenticate(),
//       expect: () => [
//         const BiometricState(status: BiometricStatus.authenticated),
//       ],
//     );

//     blocTest<BiometricCubit, BiometricState>(
//       'emits failed state when authentication fails',
//       build: () {
//         when(mockRepository.authenticate()).thenAnswer((_) async => false);
//         return cubit;
//       },
//       act: (cubit) => cubit.authenticate(),
//       expect: () => [
//         const BiometricState(
//           status: BiometricStatus.failed,
//           errorMessage: 'Authentication failed',
//         ),
//       ],
//     );

//     blocTest<BiometricCubit, BiometricState>(
//       'emits skipped state when skip is called',
//       build: () {
//         when(mockRepository.setBiometricEnabled(false))
//             .thenAnswer((_) async {});
//         return cubit;
//       },
//       act: (cubit) => cubit.skip(),
//       expect: () => [
//         const BiometricState(status: BiometricStatus.skipped),
//       ],
//     );
//   });
// }
