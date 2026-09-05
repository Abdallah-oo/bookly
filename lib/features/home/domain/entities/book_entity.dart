import 'package:bookly/core/services/hive/hive_types_ids.dart';
import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: HiveTypeIds.books) // رقم فريد
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? autherName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.autherName,
    required this.price,
    required this.rating,
  });
}
