import 'package:bookly/core/entities/request_status.dart';
import 'package:bookly/search/controllers/repository/base_search_repo.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_cubit_state.dart';

class BooksSearchCubit extends Cubit<BooksSearchState> {
  final BaseSearchRepo searchRepo;
  BooksSearchCubit(this.searchRepo) : super(BooksSearchState.initial);
  
  void setQuery(String query) {
    emit(state.copyWith(query: query));
  }
  
  Future<void> searchForBooks() async {
    try {
      emit(state.copyWith(status: RequestStatus.loading));
      final result = await searchRepo.searchForBook(state.query);
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
