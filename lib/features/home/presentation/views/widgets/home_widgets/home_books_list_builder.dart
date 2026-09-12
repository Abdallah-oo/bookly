import 'package:bookly/core/utils/extensions/responsive.dart';
import 'package:bookly/features/home/presentation/manager/cubit/fetch_home_books_cubit/fetch_home_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/home_books_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/loading_home_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBooksListBuilder extends StatelessWidget {
  const HomeBooksListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHomeBooksCubit, FetchHomeBooksState>(
      builder: (context, state) {
        final cubit = context.read<FetchHomeBooksCubit>();

        if (state is FetchHomeBooksSuccess) {
          return HomeBooksList(
            books: state.books,
            trailingStatus: state.hasReachedMax
                ? HomeBooksTrailingStatus.completed
                : HomeBooksTrailingStatus.idle,
            onFetchNextPage: cubit.fetchNextPage,
          );
        } else if (state is FetchHomeBooksLoadingMore) {
          return HomeBooksList(
            books: state.books,
            trailingStatus: HomeBooksTrailingStatus.loadingMore,
            onFetchNextPage: cubit.fetchNextPage,
          );
        } else if (state is FetchHomeBooksLoadMoreFailure) {
          return HomeBooksList(
            books: state.books,
            trailingStatus: HomeBooksTrailingStatus.error,
            onFetchNextPage: cubit.fetchNextPage,
          );
        } else if (state is FetchHomeBooksFailure) {
          return SizedBox(
            height: context.screenHeight * 0.28,
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SizedBox(
            height: context.screenHeight * 0.28,
            child: const LoadingHomeBooksState(),
          );
        }
      },
    );
  }
}
