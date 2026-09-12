import 'package:bookly/core/themes/app_text_styles.dart';
import 'package:bookly/core/widgets/custom_text.dart';
import 'package:bookly/features/home/presentation/manager/cubit/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/home_books_list_builder.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/home_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/newest_books_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
   late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = context.read<FetchNewestBooksCubit>().state;

    if (state is !FetchNewestBooksLoadingMore &&
       !( state is FetchNewestBooksSuccess && state.hasReachedMax)  &&
        _scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels >= maxScroll - 300) {
      context.read<FetchNewestBooksCubit>().fetchNextPage();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller:_scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              SafeArea(child: HomeAppBar()),
              Gap(40),
              HomeBooksListBuilder(),
              Gap(40),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomText(
                  text: 'Best Seller',
                  style: AppTextStyles.textStyle20,
                ),
              ),
              Gap(10),
            ],
          ),
        ),

           NewestBooksListBuilder(),


      ],
    );
  }
}
