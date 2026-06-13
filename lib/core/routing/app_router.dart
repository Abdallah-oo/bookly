import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.kinitial,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.kHome,
        builder: (context, state) => const HomeView(),
      ),

      GoRoute(
        path: Routes.kDetails,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: BookDetailsView(),

          transitionsBuilder: (context, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        ),
      ),
    ],
  );
}
