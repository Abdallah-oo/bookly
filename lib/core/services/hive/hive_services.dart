import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HiveService {
  static const String homebooksBoxsName = 'HomeBooks';
  static const String newestbooksBoxsName = 'HomeBooks';

  /// ---------------- home books ----------------

  static void saveHomeBooks(List<BookEntity> books) {
    final box = Hive.box<BookEntity>(homebooksBoxsName);
    box.clear();
    for (var u in books) {
      box.put(u.bookId, u);
    }
  }

  static List<BookEntity> getHomeBooks() {
    final box = Hive.box<BookEntity>(homebooksBoxsName);
    return box.values.toList();
  }
  /// ---------------- newest books ----------------

  static void saveNewestBooks(List<BookEntity> books) {
    final box = Hive.box<BookEntity>(newestbooksBoxsName);
    box.clear();
    for (var u in books) {
      box.put(u.bookId, u);
    }
  }

  static List<BookEntity> getNewestBooks() {
    final box = Hive.box<BookEntity>(newestbooksBoxsName);
    return box.values.toList();
  }


}
