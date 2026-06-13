import 'package:bookly/core/widgets/custom_text.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/also_like_books_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_details_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_details_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_purchase_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          BookDetailsAppBar(),
          Gap(40),
          BookDetailsImage(),
          Gap(20),
          BookDetailsWidget(),
          Gap(35),
          BookPurchaseSection(),
          Gap(45),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomText(text: 'You Can Also Like'),
          ),
          Gap(20),
          AlsoLikeBooksList(),
          Gap(20)
       
        ],
      ),
    );
  }
}

