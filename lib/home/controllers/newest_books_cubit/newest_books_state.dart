part of 'newest_books_cubit.dart';

class NewestBooksState extends Equatable {
  final List<Book> books;
  final RequestStatus status;
  final String errMsg;

  const NewestBooksState({
    required this.books,
    required this.status,
    required this.errMsg,
  });

  static const NewestBooksState initial = NewestBooksState(
    books: [],
    status: RequestStatus.initial,
    errMsg: '',
  );

  NewestBooksState copyWith({
    List<Book>? books,
    RequestStatus? status,
    String? errMsg,
  }) {
    return NewestBooksState(
      books: books ?? this.books,
      status: status ?? this.status,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  String toString() => 'NewestBooksState: \n'
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
