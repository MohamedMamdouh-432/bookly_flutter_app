import 'package:bookly/splash/models/book/book.dart';
import 'package:bookly/home/widgets/newest_book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerticalBooksSeries extends StatelessWidget {
  final List<Book> books;
  
  const VerticalBooksSeries({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: books.length,
      itemBuilder: (_, i) => NewestBookCard(book: books[i]),
      separatorBuilder: (_, index) => const Gap(20),
    );
  }
}
