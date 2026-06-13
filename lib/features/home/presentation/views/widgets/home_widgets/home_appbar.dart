import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Row(
        children: [
          CustomText(text: 'Bookly', style: AppTextStyles.textStyle20),
          Spacer(),
          Icon(CupertinoIcons.search, size: 25),
        ],
      ),
    );
  }
}
