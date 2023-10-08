import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/presentation/pages/authentication/register/regsiter_page.dart';
import 'package:hankofiles/presentation/pages/authentication/sign_in/sign_in.dart';
import 'package:hankofiles/presentation/pages/splash/onboarding_screen.dart';
import 'package:hankofiles/presentation/pages/splash/splash_screen.dart';
import 'package:hankofiles/presentation/pages/storage/folder_page.dart';
// import 'package:hankofiles/presentation/pages/home/home_page.dart';
// import 'package:hankofiles/presentation/pages/home/home_scaffold.dart';
// import 'package:hankofiles/presentation/pages/storage/storage_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    initialLocation: "/",
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const SignInPage(),
      ),
      // ShellRoute(
      //   navigatorKey: _shellNavigatorKey,
      //   builder: (context, state, child) {
      //     return HomeScaffold(child: child);
      //   },
      //   routes: [
      //     GoRoute(
      //       path: '/home',
      //       pageBuilder: (context, state) =>
      //           const NoTransitionPage(child: HomePage()),
      //     ),
      //     GoRoute(
      //       path: '/storage',
      //       pageBuilder: (context, state) =>
      //           const NoTransitionPage(child: StoragePage()),
      //     ),
      //   ],
      // ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: "/folder",
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: Folderpage()),
        ),
    ],
    debugLogDiagnostics: true);
