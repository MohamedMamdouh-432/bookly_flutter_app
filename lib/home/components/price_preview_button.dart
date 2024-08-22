import 'package:bookly/core/utils/utils.dart';
import 'package:bookly/home/widgets/half_preview_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PricePreviewButton extends StatelessWidget {
  final String bookUrl;
  const PricePreviewButton({
    super.key,
    required this.bookUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.06,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HalfPreviewButton(
            content: 'Free',
            color: Colors.white,
            style: TextStyleManager.style18.copyWith(color: Colors.black),
          ),
          HalfPreviewButton(
            content: 'Preview',
            color: const Color(ConstantsManager.pinkColor),
            style: TextStyleManager.style18,
            onTap: () => launchUrl(Uri.parse(bookUrl)),
          ),
        ],
      ),
    );
  }
}
