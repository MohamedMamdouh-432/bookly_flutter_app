import 'package:bookly/core/entities/failure.dart';
import 'package:bookly/splash/models/book/book.dart';
import 'package:dartz/dartz.dart';

abstract class BaseSearchRepo {
  Future<Either<Failure, List<Book>>> searchForBook(String subject);
}