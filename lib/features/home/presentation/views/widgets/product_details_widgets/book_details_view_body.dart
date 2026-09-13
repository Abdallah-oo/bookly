import 'package:bookly/core/routing/app_router.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/also_like_books_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_details_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_details_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_purchase_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookDetails});
  final BookDetails bookDetails;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          SafeArea(child: BookDetailsAppBar()),
          Gap(40),
          BookDetailsImage(imageUrl: bookDetails.imageUrl,),
          Gap(20),
          BookDetailsWidget(title: bookDetails.title,),
          Gap(35),
          BookPurchaseSection(),
          Gap(45),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomText(text: 'You Can Also Like'),
          ),
          Gap(20),
          AlsoLikeBooksList(alsoLikeBooks: bookDetails.alsoLikeBooks,),
          Gap(30)

        ],
      ),
    );
  }
}

