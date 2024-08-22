import 'package:bookly/core/utils/constants_manager.dart';
import 'package:bookly/home/controllers/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly/home/controllers/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/home/controllers/repository/home_repo.dart';
import 'package:bookly/shared/services/service_locator.dart';
import 'package:bookly/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureBooksCubit(
            sl.get<HomeRepo>(),
          )..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            sl.get<HomeRepo>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: const BooklyAppLauncher(),
    );
  }
}

class BooklyAppLauncher extends StatelessWidget {
  const BooklyAppLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(ConstantsManager.primaryColor),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          )),
      home: SplashScreen(),
    );
  }
}
