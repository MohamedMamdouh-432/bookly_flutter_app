import 'package:bookly/core/entities/request_status.dart';
import 'package:bookly/core/utils/utils.dart';
import 'package:bookly/home/controllers/related_books_cubit/related_books_cubit.dart';
import 'package:bookly/home/widgets/horizontal_books_series.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RelatedBooks extends StatelessWidget {
  const RelatedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'You can also like',
            style: TextStyleManager.style18,
          ),
          const Gap(20),
          BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
            builder: (context, state) {
              return state.status == RequestStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : state.status == RequestStatus.failure
                      ? Center(child: Text(state.errMsg))
                      : HorizontalBooksSeries(books: state.books);
            },
          )
        ],
      ),
    );
  }
}
