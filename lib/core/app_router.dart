import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_screen.dart';
import '../features/auth/presentation/pages/experience_selection_screen.dart';
import '../features/auth/presentation/pages/job_type_selection_screen.dart';
import '../features/auth/presentation/pages/region_selection_screen.dart';
import '../features/onboarding/presentation/view/onboarding_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/region',
      builder: (context, state) => const RegionSelectionScreen(),
    ),
    GoRoute(
      path: '/experience',
      builder: (context, state) => const ExperienceSelectionScreen(),
    ),
    GoRoute(
      path: '/job-type',
      builder: (context, state) => const JobTypeSelectionScreen(),
    ),
  ],
);
