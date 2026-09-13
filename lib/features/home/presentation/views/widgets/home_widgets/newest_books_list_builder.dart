import 'package:bookly/core/utils/extensions/responsive.dart';
import 'package:bookly/features/home/presentation/manager/cubit/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/fetch_books_retry_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/home_books_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/loading_newest_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/newest_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewestBooksListBuilder extends StatelessWidget {
  const NewestBooksListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        final cubit = context.read<FetchNewestBooksCubit>();

        if (state is FetchNewestBooksSuccess) {
          return SliverPadding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
            sliver: NewestBooksList(
              newestBooks: state.books,
              trailingStatus: state.hasReachedMax
                  ? HomeBooksTrailingStatus.completed
                  : HomeBooksTrailingStatus.idle,
              onFetchNextPage: cubit.fetchNextPage,
            ),
          );
        } else if (state is FetchNewestBooksLoadingMore) {
          return SliverPadding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
            sliver: NewestBooksList(
              newestBooks: state.books,
              trailingStatus: HomeBooksTrailingStatus.loadingMore,
              onFetchNextPage: cubit.fetchNextPage,
            ),
          );
        } else if (state is FetchNewestBooksLoadMoreFailure) {
          return NewestBooksList(
            newestBooks: state.books,
            trailingStatus: HomeBooksTrailingStatus.error,
            onFetchNextPage: cubit.fetchNextPage,
          );
        } else if (state is FetchNewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Text(state.errorMessage),
                  Gap(20),
                  FetchBooksRetryButton(cubit: cubit),
                ],
              ),
            ),
          );
        } else {
          return SliverPadding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
            sliver: LoadingNewestBooksState(),
          );
        }
      },
    );
  }
}

