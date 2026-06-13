import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/best_seller_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/home_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/home_books_list.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              HomeAppBar(),
              Gap(40),
              HomeBooksList(),
              Gap(40),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomText(
                  text: 'Best Seller',
                  style: AppTextStyles.textStyle20,
                ),
              ),
              Gap(10),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          sliver: BestSellerList(),
        ),
      ],
    );
  }
}
