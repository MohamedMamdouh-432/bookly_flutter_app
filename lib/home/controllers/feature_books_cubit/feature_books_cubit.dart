import 'package:bookly/core/entities/request_status.dart';
import 'package:bookly/home/controllers/repository/base_home_repo.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  final BaseHomeRepo homeRepo;
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksState.initial);

  Future<void> fetchFeatureBooks() async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final result = await homeRepo.fetchFeaturedBooks();
      result.fold(
        (error) => emit(
          state.copyWith(
            errMsg: error.message,
            status: RequestStatus.failure,
          ),
        ),
        (data) => emit(
          state.copyWith(
            books: data,
            status: RequestStatus.success,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errMsg: e.toString(),
          status: RequestStatus.failure,
        ),
      );
    }
  }
}
