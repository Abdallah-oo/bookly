import 'package:bookly/core/utils/extensions/responsive.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBooksList extends StatelessWidget {
  const HomeBooksList({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.28,
      child: ListView.builder(
        itemCount: books.length,
        padding: const EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
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

                      imageUrl: books[index].image ?? '',
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
                        child: Image.asset('assets/images/test.png',fit: BoxFit.cover,),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow_rounded),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
