import 'package:bookly/home/controllers/repository/home_repo.dart';
import 'package:bookly/search/controllers/repository/search_repo.dart';
import 'package:bookly/shared/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setup() {
  sl.registerSingleton<APIService>(APIService(Dio()));
  sl.registerSingleton<HomeRepo>(HomeRepo(sl<APIService>()));
  sl.registerSingleton<SearchRepo>(SearchRepo(sl<APIService>()));
}
