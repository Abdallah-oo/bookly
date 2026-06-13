

import 'package:bookly/features/splash/presentation/views/widgets/start_botton.dart';
import 'package:bookly/features/splash/presentation/views/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [WelcomeText(), StartButton()],
    );
  }
}
