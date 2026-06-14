import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/utils/extensions/responsive.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NewestBooksList extends StatelessWidget {
  const NewestBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: ()=> context.push(Routes.kDetails),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/test.png'),
                      fit: BoxFit.fill,
                    ),
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
                          text:
                              'The Psychology of Money The Psychology of Money The Psychology of Money',
                          style: AppTextStyles.textStyle20,
                        ),
                      ),
                      Gap(10),
                      CustomText(
                        text: 'J.K. Rowling',
                        style: AppTextStyles.textStyle16,
                      ),
                      Gap(10),
                      Row(
                        children: [
                          CustomText(
                            text: '€ 19.99',
                            style: AppTextStyles.textStyle20,
                          ),
                          Spacer(),
                          FaIcon(
                            FontAwesomeIcons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Gap(5),
                          CustomText(
                            text: '4.5',
                            style: AppTextStyles.textStyle16,
                          ),
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
        ),
      ),
    );
  }
}
