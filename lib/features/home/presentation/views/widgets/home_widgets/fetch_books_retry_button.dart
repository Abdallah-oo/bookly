import 'package:flutter/material.dart';

class FetchBooksRetryButton extends StatelessWidget {
  const FetchBooksRetryButton({super.key, required this.cubit});

  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => cubit.fetchNewestBooks(),
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
