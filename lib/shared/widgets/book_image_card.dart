import 'package:bookly/core/utils/constants_manager.dart';
import 'package:bookly/home/screens/book_details_screen.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookImageCard extends StatelessWidget {
  final Book book;
  const BookImageCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => BookDetailsScreen(book: book),
        transition: Transition.leftToRightWithFade,
        duration: ConstantsManager.navDuration,
      ),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(book.imageLinks?.thumbnail ??
                  'https://img.freepik.com/free-photo/book-composition-with-open-book_23-2147690555.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
