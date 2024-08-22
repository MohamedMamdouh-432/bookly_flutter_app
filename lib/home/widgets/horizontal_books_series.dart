import 'package:bookly/shared/widgets/book_image_card.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HorizontalBooksSeries extends StatelessWidget {
  final List<Book> books;

  const HorizontalBooksSeries({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.18,
      child: ListView.separated(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => BookImageCard(book: books[i]),
        separatorBuilder: (_, index) => const Gap(20),
      ),
    );
  }
}
