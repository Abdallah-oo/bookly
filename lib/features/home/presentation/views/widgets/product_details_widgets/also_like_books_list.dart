import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlsoLikeBooksList extends StatelessWidget {
  const AlsoLikeBooksList({super.key, required this.alsoLikeBooks});
  final List<BookEntity> alsoLikeBooks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: alsoLikeBooks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(width: 80,child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: alsoLikeBooks[index].image ?? '',
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
              ),),
          );
        },
      ),
    );
  }
}
