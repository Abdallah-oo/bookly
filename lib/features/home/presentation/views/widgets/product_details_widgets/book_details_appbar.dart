import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [Icon(Icons.close), Spacer(), Icon(CupertinoIcons.cart)],
      ),
       
    
    );
  }
}
