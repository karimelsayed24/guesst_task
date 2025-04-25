import 'package:get_it/get_it.dart';
import 'package:guessit_task/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:guessit_task/features/auth/domain/repositories/auth_repository.dart';
import 'package:guessit_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/biometric_auth/data/repositories/biometric_repository_impl.dart';
import '../../features/biometric_auth/domain/repositories/biometric_repository.dart';
import '../../features/biometric_auth/presentation/cubit/biometric_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => LocalAuthentication());

  // Cubits
  sl.registerFactory(
    () => AuthCubit(sl()),
  );
  sl.registerFactory(
    () => BiometricCubit(sl()),
  );
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );

  sl.registerLazySingleton<BiometricRepository>(
    () => BiometricRepositoryImpl(
      sl<LocalAuthentication>(),
      sl<SharedPreferences>(),
    ),
  );
}
