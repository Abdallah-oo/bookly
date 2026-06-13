import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.fromLTRB(20, 0, 20, 30),
      child: CustomButton(
        onPressed: () => context.pushReplacement(Routes.kHome),
        padding: const EdgeInsets.symmetric(vertical: 15),

        raduis: 10,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CustomText(text: 'Get Started',style: AppTextStyles.textStyle20,)],
        ),
      ),
    );
  }
}
