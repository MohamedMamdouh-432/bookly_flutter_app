import 'package:bookly/core/entities/failure.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:dartz/dartz.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Book>>> fetchNewestBooks();
  Future<Either<Failure, List<Book>>> fetchRelatedBooks(String category);
}
