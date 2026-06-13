import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/utils/extensions/responsive.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BookPurchaseSection extends StatelessWidget {
  const BookPurchaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              color: Colors.white,
              raduis: 0,
              borderRadiusGeometry: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: CustomText(
                        style: AppTextStyles.textStyle20.copyWith(
                          color: Colors.black,
                        ),

                        text: '€ 19.80',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              raduis: 0,
              color: const Color.fromARGB(255, 231, 131, 111),
              borderRadiusGeometry: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                    child: Center(
                      child: CustomText(
                        style: AppTextStyles.textStyle20.copyWith(
                          color: Colors.white,
                        ),

                        text: 'Free Preview',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
