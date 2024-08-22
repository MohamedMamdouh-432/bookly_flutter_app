import 'package:bookly/core/utils/utils.dart';
import 'package:bookly/search/controllers/cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookSearchField extends StatelessWidget {
  const BookSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search for books ...',
      leading: const Icon(FontAwesomeIcons.bookOpen),
      trailing: [
        IconButton(
          onPressed: context.read<BooksSearchCubit>().searchForBooks,
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 15),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyleManager.style18.copyWith(
          color: Colors.amber.shade200,
        ),
      ),
      hintStyle: WidgetStatePropertyAll(
        TextStyleManager.style18.copyWith(
          color: Colors.white70,
        ),
      ),
      onChanged: context.read<BooksSearchCubit>().setQuery,
      onSubmitted: (value) => context.read<BooksSearchCubit>().searchForBooks(),
    );
  }
}
