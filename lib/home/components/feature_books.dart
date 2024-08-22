import 'package:bookly/core/entities/request_status.dart';
import 'package:bookly/home/controllers/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly/home/widgets/horizontal_books_series.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooks extends StatelessWidget {
  const FeatureBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        return state.status == RequestStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : state.status == RequestStatus.failure
                ? Center(child: Text(state.errMsg))
                : HorizontalBooksSeries(books: state.books);
      },
    );
  }
}
