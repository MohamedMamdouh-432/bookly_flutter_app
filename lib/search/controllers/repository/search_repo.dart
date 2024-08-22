import 'package:bookly/core/entities/failure.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:bookly/search/controllers/repository/base_search_repo.dart';
import 'package:bookly/shared/services/api_service.dart';
import 'package:dartz/dartz.dart';

class SearchRepo implements BaseSearchRepo{
  final APIService apiService;

  SearchRepo(this.apiService);
  
  @override
  Future<Either<Failure, List<Book>>> searchForBook(String subject) async {
    try {
      final results = await apiService.getBooks(
        'volumes',
        'Filtering=free-ebooks&q=subjest:$subject&Sorting=newest',
      );
      List<Book> books = [];
      for (Map<String, dynamic> item in results["items"])
        books.add(Book.fromJson(item));
      return right(books);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }
}