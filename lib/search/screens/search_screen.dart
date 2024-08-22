import 'package:bookly/search/components/book_search_field.dart';
import 'package:bookly/search/components/search_results.dart';
import 'package:bookly/search/controllers/cubit/search_cubit_cubit.dart';
import 'package:bookly/search/controllers/repository/search_repo.dart';
import 'package:bookly/shared/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksSearchCubit(sl.get<SearchRepo>()),
      child: const SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: BookSearchField()),
                SliverGap(20),
                SliverFillRemaining(child: SearchResults()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
