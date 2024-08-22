import 'package:bookly/core/entities/request_status.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:bookly/home/controllers/repository/base_home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  final BaseHomeRepo homeRepo;
  RelatedBooksCubit(this.homeRepo) : super(RelatedBooksState.initial);

  Future<void> fetchRelatedBooks(String category) async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final result = await homeRepo.fetchRelatedBooks(category);
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
