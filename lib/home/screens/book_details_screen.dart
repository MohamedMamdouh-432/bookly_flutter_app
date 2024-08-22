import 'package:bookly/home/components/book_details.dart';
import 'package:bookly/home/components/related_books.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:bookly/home/controllers/related_books_cubit/related_books_cubit.dart';
import 'package:bookly/home/controllers/repository/home_repo.dart';
import 'package:bookly/shared/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RelatedBooksCubit(sl.get<HomeRepo>())..fetchRelatedBooks(book.categories![0]),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(FontAwesomeIcons.xmark),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(FontAwesomeIcons.cartShopping),
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              BookDetails(book: book),
              const SliverToBoxAdapter(child: RelatedBooks()),
            ],
          ),
        ),
      ),
    );
  }
}
