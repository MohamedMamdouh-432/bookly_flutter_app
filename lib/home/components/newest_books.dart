import 'package:bookly/core/entities/request_status.dart';
import 'package:bookly/home/controllers/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/home/widgets/vertical_books_series.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooks extends StatelessWidget {
  const NewestBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        return state.status == RequestStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : state.status == RequestStatus.failure
                ? Center(child: Text(state.errMsg))
                : VerticalBooksSeries(books: state.books);
      },
    );
  }
}
