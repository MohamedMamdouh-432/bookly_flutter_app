import 'dart:math';

import 'package:bookly/core/utils/constants_manager.dart';
import 'package:bookly/core/utils/text_style_manager.dart';
import 'package:bookly/home/screens/book_details_screen.dart';
import 'package:bookly/shared/widgets/book_image_card.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NewestBookCard extends StatelessWidget {
  final Book book;

  const NewestBookCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => BookDetailsScreen(book: book),
        transition: Transition.zoom,
        duration: ConstantsManager.navDuration,
      ),
      child: Container(
        height: 180,
        margin: const EdgeInsets.only(right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookImageCard(book: book),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.title ?? 'UnKnown',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.style20,
                  ),
                  Text(
                    book.authors?.first ?? 'UnKnown',
                    style: TextStyleManager.style18.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Free", style: TextStyleManager.style18),
                      const Spacer(),
                      RatingBar.readOnly(
                        size: 25,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        halfFilledIcon: Icons.star_half,
                        initialRating: max(1, Random().nextDouble() * 5.0),
                        isHalfAllowed: true,
                        alignment: Alignment.center,
                      ),
                      const Gap(10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
