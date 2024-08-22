import 'package:bookly/core/bookly_launcher.dart';
import 'package:bookly/core/bookly_observer.dart';
import 'package:bookly/core/utils/constants_manager.dart';
import 'package:bookly/shared/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  Bloc.observer = BooklyObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(ConstantsManager.primaryColor),
    systemNavigationBarColor: Color(ConstantsManager.primaryColor),
  ));
  setup();
  runApp(const BooklyApp());
}
