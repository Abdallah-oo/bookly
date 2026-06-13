import 'package:bookly/core/routing/app_router.dart';
import 'package:bookly/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bookly',
      routerConfig: AppRouter.router,
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
