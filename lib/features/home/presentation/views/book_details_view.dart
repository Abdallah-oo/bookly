import 'package:bookly/core/routing/app_router.dart';
import 'package:bookly/features/home/presentation/views/widgets/product_details_widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookDetails});
  final BookDetails bookDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:BookDetailsViewBody(bookDetails: bookDetails));
  }
}
