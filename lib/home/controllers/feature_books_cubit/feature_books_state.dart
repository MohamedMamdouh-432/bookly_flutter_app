part of 'feature_books_cubit.dart';

class FeatureBooksState extends Equatable {
  final List<Book> books;
  final RequestStatus status;
  final String errMsg;

  const FeatureBooksState({
    required this.books,
    required this.status,
    required this.errMsg,
  });

  static const FeatureBooksState initial = FeatureBooksState(
    books: [],
    status: RequestStatus.initial,
    errMsg: '',
  );

  FeatureBooksState copyWith({
    List<Book>? books,
    RequestStatus? status,
    String? errMsg,
  }) {
    return FeatureBooksState(
      books: books ?? this.books,
      status: status ?? this.status,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  String toString() => 'FeatureBooksState: \n'
      'Request Statue: ${status.name}\n'
      'Error Message: $errMsg\n'
      'Books List: $books\n';

  @override
  List<Object> get props => [
        books,
        status,
        errMsg,
      ];
}
