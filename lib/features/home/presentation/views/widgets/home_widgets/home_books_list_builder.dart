import 'package:bookly/features/home/presentation/manager/cubit/fetch_home_books_cubit/fetch_home_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_widgets/home_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBooksListBuilder extends StatelessWidget {
  const HomeBooksListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchHomeBooksCubit, FetchHomeBooksState>(
      builder: (context, state) {
        if (state is FetchHomeBooksSuccess) {
          return HomeBooksList(books: state.books);
        } else if (state is FetchHomeBooksFailure) {
          print('Error: ${state.errorMessage}');
          return Text(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
