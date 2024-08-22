part of 'search_cubit_cubit.dart';

class BooksSearchState extends Equatable {
  final List<Book> books;
  final RequestStatus status;
  final String errMsg;
  final String query;

  const BooksSearchState({
    required this.books,
    required this.status,
    required this.errMsg,
    required this.query,
  });

    static const BooksSearchState initial = BooksSearchState(
    books: [],
    status: RequestStatus.initial,
    errMsg: '',
    query: '',
  );

  BooksSearchState copyWith({
    List<Book>? books,
    RequestStatus? status,
    String? errMsg,
    String? query,
  }) {
    return BooksSearchState(
      books: books ?? this.books,
      status: status ?? this.status,
      errMsg: errMsg ?? this.errMsg,
      query: query ?? this.query,
    );
  }
  
  @override
  String toString() => 'BooksSearchState: \n'
      'Request Statue: ${status.name}\n'
      'Query: $query\n'
      'Error Message: $errMsg\n'
      'Books List: $books\n';

  @override
  List<Object> get props => [books, status, errMsg, query];
}
