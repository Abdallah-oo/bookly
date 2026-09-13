import 'package:flutter/material.dart';

class BooklyLogo extends StatelessWidget {
  const BooklyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF9B7CFF), Color(0xFF6C4DFF)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7655FF).withValues(alpha: 0.35),
                blurRadius: 22,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(Icons.auto_stories_rounded, color: Colors.white, size: 23),
        ),

        const SizedBox(width: 12),

        const Text(
          'bookly',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
        ),
      ],
    );
  }
}
