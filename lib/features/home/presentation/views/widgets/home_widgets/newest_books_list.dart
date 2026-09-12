import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/utils/extensions/responsive.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/home_books_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NewestBooksList extends StatelessWidget {
  const NewestBooksList({
    super.key,
    required this.newestBooks,
    required this.trailingStatus,
    required this.onFetchNextPage,
  });
  final List<BookEntity> newestBooks;
  final HomeBooksTrailingStatus trailingStatus;
  final VoidCallback onFetchNextPage;

  @override
  Widget build(BuildContext context) {
    final itemCount = newestBooks.length + (newestBooks.isEmpty ? 0 : 1);
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: itemCount, (context, index) {
        if (index >= newestBooks.length) return _buildTrailingItem();

        return _buildNewestBookItem(context: context, newestBook: newestBooks[index]);
      }),
    );
  }

  Widget _buildNewestBookItem({required BuildContext context, required BookEntity newestBook}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () => context.push(Routes.kDetails),
        child: Row(
          children: [
            Container(
              height: 140,
              width: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: newestBook.image ?? '',
                  placeholder: (_, _) => Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  ),
                  errorWidget: (_, _, _) => Container(
                    color: Colors.grey.shade300,
                    child: Image.asset('assets/images/test.png', fit: BoxFit.cover),
                  ),
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
                      text: newestBook.title ?? 'No Title',
                      style: AppTextStyles.textStyle20,
                    ),
                  ),
                  Gap(10),
                  CustomText(
                    text: newestBook.autherName ?? 'Unknown Author',
                    style: AppTextStyles.textStyle16,
                  ),
                  Gap(10),
                  Row(
                    children: [
                      CustomText(
                        text: ' ${newestBook.price ?? 19.5} ',
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
  }

  Widget _buildTrailingItem() {
    switch (trailingStatus) {
      case HomeBooksTrailingStatus.loadingMore:
        return const Padding(
          padding: EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 150,
            child: Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
            ),
          ),
        );
      case HomeBooksTrailingStatus.error:
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 150,
            child: InkWell(
              onTap: onFetchNextPage,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: Colors.redAccent),
                    SizedBox(height: 4),
                    Text('Retry', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        );
      case HomeBooksTrailingStatus.completed:
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 150,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.grey.shade500),
                  const SizedBox(height: 4),
                  CustomText(text: 'No more books', style: AppTextStyles.textStyle16),
                ],
              ),
            ),
          ),
        );
      case HomeBooksTrailingStatus.idle:
        return const SizedBox(width: 10);
    }
  }
}
