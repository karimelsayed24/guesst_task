import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/success_dialog.dart';
import '../../../home/presentation/pages/main_page.dart';
import '../../domain/repositories/biometric_repository.dart';
import '../cubit/biometric_cubit.dart';
import '../cubit/biometric_state.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BiometricCubit(
        GetIt.instance<BiometricRepository>(),
      ),
      child: const _BiometricScreenView(),
    );
  }
}

class _BiometricScreenView extends StatelessWidget {
  const _BiometricScreenView();

  Future<void> _handleSuccess(BuildContext context) async {
    await SuccessDialog.show(
      context,
      'Your account is ready you will be redirected to home page',
    );
    await Future.delayed(const Duration(milliseconds: 200));
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Title
              Text(
                'Set your Finger Print',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Subtitle
              Text(
                'Approve with finger print for more security',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              // Fingerprint Icon
              SvgPicture.asset(
                AppAssets.fingerprint,
                width: 120,
                height: 120,
              ),
              const Spacer(),
              // Buttons
              BlocConsumer<BiometricCubit, BiometricState>(
                listener: (context, state) {
                  if (state.status == BiometricStatus.skipped) {
                    Navigator.pop(context, false);
                  } else if (state.status == BiometricStatus.failed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text(state.errorMessage ?? 'Authentication failed'),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'SKIP',
                          onPressed: () =>
                              context.read<BiometricCubit>().skip(),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: state.status == BiometricStatus.authenticated
                            ? CustomButton(
                                text: 'FINISH',
                                onPressed: () => _handleSuccess(context),
                              )
                            : CustomButton(
                                text: 'FINISH',
                                onPressed: () {},
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest,
                              ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
