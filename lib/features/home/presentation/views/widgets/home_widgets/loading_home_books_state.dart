import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingHomeBooksState extends StatelessWidget {
  const LoadingHomeBooksState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>Skeletonizer(
         enabled: true,
        child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset('assets/images/test.png', fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 28, 28, 28).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_arrow_rounded,color: Colors.amberAccent,),
              ),
            ),
          ],
        ),
              ),
            ),
      )
    );
  }
}
