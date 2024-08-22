import 'package:bookly/core/entities/failure.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:bookly/home/controllers/repository/base_home_repo.dart';
import 'package:bookly/shared/services/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepo implements BaseHomeRepo {
  final APIService apiService;

  HomeRepo(this.apiService);

  @override
  Future<Either<Failure, List<Book>>> fetchNewestBooks() async {
    try {
      final results = await apiService.getBooks(
        'volumes',
        'Filtering=free-ebooks&q=subjest:programming&Sorting=newest',
      );
      List<Book> books = [];
      for (Map<String, dynamic> item in results["items"])
        books.add(Book.fromJson(item));
      return right(books);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    try {
      final results = await apiService.getBooks(
        'volumes',
        'Filtering=free-ebooks&q=subjest:ai',
      );
      List<Book> books = [];
      for (Map<String, dynamic> item in results["items"])
        books.add(Book.fromJson(item));
      return right(books);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<Book>>> fetchRelatedBooks(String category) async {
    try {
      final results = await apiService.getBooks(
        'volumes',
        'Filtering=free-ebooks&Sorting=relevance&q=subjest:$category',
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
