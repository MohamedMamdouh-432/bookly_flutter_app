import 'package:bookly/core/utils/utils.dart';
import 'package:bookly/home/components/feature_books.dart';
import 'package:bookly/home/components/newest_books.dart';
import 'package:bookly/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            ImageManager.logo,
            height: 45,
            width: 140,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () => Get.to(
                  () => const SearchScreen(),
                  duration: ConstantsManager.navDuration,
                  transition: Transition.size,
                ),
                iconSize: 25,
                icon: const Icon(FontAwesomeIcons.magnifyingGlass),
              ),
            )
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: FeatureBooks()),
              SliverGap(30),
              SliverToBoxAdapter(
                child: Text(
                  'Newest Books',
                  style: TextStyleManager.style18,
                ),
              ),
              SliverGap(10),
              SliverFillRemaining(child: NewestBooks()),
            ],
          ),
        ),
      ),
    );
  }
}
