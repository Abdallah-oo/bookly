import 'package:bookly/core/dependency_injection/get_it.dart';
import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/cubit/fetch_home_books_cubit/fetch_home_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/cubit/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: Routes.kinitial, builder: (context, state) => const SplashView()),
      GoRoute(
        path: Routes.kHome,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<FetchHomeBooksCubit>(
              create: (context) => getIt<FetchHomeBooksCubit>()..fetchHomeBooks(),
            ),
            BlocProvider<FetchNewestBooksCubit>(
              create: (context) => getIt<FetchNewestBooksCubit>()..fetchNewestBooks(),
            ),
          ],
          child: const HomeView(),
        ),
      ),

      GoRoute(
        path: Routes.kDetails,

        pageBuilder: (context, state) {
          final bookDetails = state.extra as BookDetails;

          return CustomTransitionPage(
            child: BookDetailsView(bookDetails: bookDetails),

            transitionsBuilder: (context, animation, _, child) =>
                FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 400),
          );
        },
      ),
    ],
  );
}

class BookDetails {
  final String title;
  final String author;

  final String imageUrl;
  List<BookEntity> alsoLikeBooks;

  BookDetails({required this.title, required this.author, required this.imageUrl,required this.alsoLikeBooks});
}
