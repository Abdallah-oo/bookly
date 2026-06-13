import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BookDetailsWidget extends StatelessWidget {
  const BookDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: 'The Jungle Book', style: AppTextStyles.textStyle20),
        Gap(5),
        CustomText(text: 'Rudyred Kiping', style: AppTextStyles.textStyle16),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.star, color: Colors.amber, size: 16),
            Gap(5),
            CustomText(text: '4.5', style: AppTextStyles.textStyle16),
            Gap(1),
            CustomText(text: '(310)'),
          ],
        ),
      ],
    );
  }
}
