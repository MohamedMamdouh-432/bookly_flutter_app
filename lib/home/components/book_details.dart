import 'dart:math';

import 'package:bookly/core/utils/utils.dart';
import 'package:bookly/home/components/price_preview_button.dart';
import 'package:bookly/shared/widgets/book_image_card.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BookDetails extends StatelessWidget {
  final Book book;

  const BookDetails({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            width: Get.width * 0.5,
            margin: const EdgeInsets.only(bottom: 20),
            child: BookImageCard(book: book),
          ),
          Text(
            book.title ?? 'UnKnown',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyleManager.style20,
            textAlign: TextAlign.center,
          ),
          const Gap(5),
          Text(
            book.authors?.first ?? 'UnKnown',
            style: TextStyleManager.style18.copyWith(
              color: Colors.grey,
            ),
          ),
          const Gap(5),
          RatingBar.readOnly(
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            halfFilledIcon: Icons.star_half,
            initialRating: max(1, Random().nextDouble() * 5.0),
            isHalfAllowed: true,
            alignment: Alignment.center,
          ),
          const Gap(20),
          PricePreviewButton(bookUrl: book.previewLink!),
        ],
      ),
    );
  }
}
