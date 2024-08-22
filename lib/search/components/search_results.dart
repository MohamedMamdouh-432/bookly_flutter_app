import 'package:bookly/core/entities/request_status.dart';
import 'package:bookly/search/controllers/cubit/search_cubit_cubit.dart';
import 'package:bookly/shared/widgets/book_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksSearchCubit, BooksSearchState>(
      builder: (context, state) {
        return state.status == RequestStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : state.status == RequestStatus.failure
                ? Center(child: Text(state.errMsg))
                : GridView.builder(
                    itemCount: state.books.length,
                    itemBuilder: (_, i) => BookImageCard(book: state.books[i]),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 1.4 / 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 5,
                    ),
                  );
      },
    );
  }
}
