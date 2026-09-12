import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/utils/extensions/responsive.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingNewestBooksState extends StatelessWidget {
  const LoadingNewestBooksState({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildBuilderDelegate( (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 80,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/test.png', fit: BoxFit.cover),
                  ),
                ),
                Gap(30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.screenWidth * 0.5,
                        child: CustomText(
                          minFontSize: 16,
                          maxLines: 2,
                          text:  'No Title',
                          style: AppTextStyles.textStyle20,
                        ),
                      ),
                      Gap(10),
                      CustomText(
                        text: 'Unknown Author',
                        style: AppTextStyles.textStyle16,
                      ),
                      Gap(10),
                      Row(
                        children: [
                          CustomText(
                            text: ' 19.99 ',
                            style: AppTextStyles.textStyle20,
                          ),
                          Spacer(),
                          FaIcon(FontAwesomeIcons.star, color: Colors.amber, size: 16),
                          Gap(5),
                          CustomText(text: '4.5', style: AppTextStyles.textStyle16),
                          Gap(1),
                          CustomText(text: '(310)'),
                          Gap(10),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

      }),
    );

  }
}
