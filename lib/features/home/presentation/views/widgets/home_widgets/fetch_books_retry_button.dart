import 'package:bookly/features/home/presentation/manager/cubit/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:flutter/material.dart';

class FetchBooksRetryButton extends StatelessWidget {
  const FetchBooksRetryButton({super.key, required this.cubit});

  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => cubit is FetchNewestBooksCubit ? cubit.fetchNewestBooks() : cubit.fetchHomeBooks(),
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
        backgroundColor: WidgetStatePropertyAll(Color(0xFF6040E8)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Retry',style: TextStyle(color: Colors.white, fontSize: 16),),
        ],
      ),
    );
  }
}
