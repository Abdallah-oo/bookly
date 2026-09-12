import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/utils/extensions/responsive.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum HomeBooksTrailingStatus { idle, loadingMore, completed, error }

class HomeBooksList extends StatefulWidget {
  const HomeBooksList({
    super.key,
    required this.books,
    required this.trailingStatus,
    required this.onFetchNextPage,
  });

  final List<BookEntity> books;
  final HomeBooksTrailingStatus trailingStatus;
  final VoidCallback onFetchNextPage;

  @override
  State<HomeBooksList> createState() => _HomeBooksListState();
}

class _HomeBooksListState extends State<HomeBooksList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (widget.trailingStatus != HomeBooksTrailingStatus.loadingMore &&
        widget.trailingStatus != HomeBooksTrailingStatus.completed &&
        _scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels >= maxScroll - 300) {
        widget.onFetchNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.books.length + (widget.books.isEmpty ? 0 : 1);

    return SizedBox(
      height: context.screenHeight * 0.28,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: itemCount,
        padding: const EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index >= widget.books.length) return _buildTrailingItem();
          return _buildBookItem(widget.books[index]);
        },
      ),
    );
  }

  Widget _buildBookItem(BookEntity book) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: book.image ?? '',
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
            Positioned(
              bottom: 10,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.bookmark_outline, color: Color.fromARGB(255, 255, 255, 255), size: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrailingItem() {
    switch (widget.trailingStatus) {
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
              onTap: widget.onFetchNextPage,
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
