import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
              text: 'Welcome To Bookly App!',
              style: AppTextStyles.textStyle16,
            ),
          ),
        ],
      ),
    );
  }
}
