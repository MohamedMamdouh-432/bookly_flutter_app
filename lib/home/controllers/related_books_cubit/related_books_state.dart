part of 'related_books_cubit.dart';

class RelatedBooksState extends Equatable {
  final List<Book> books;
  final RequestStatus status;
  final String errMsg;
  
  const RelatedBooksState({
    required this.books,
    required this.status,
    required this.errMsg,
  });
  
  static const RelatedBooksState initial = RelatedBooksState(
    books: [],
    status: RequestStatus.initial,
    errMsg: '',
  );

  RelatedBooksState copyWith({
    List<Book>? books,
    RequestStatus? status,
    String? errMsg,
  }) {
    return RelatedBooksState(
      books: books ?? this.books,
      status: status ?? this.status,
      errMsg: errMsg ?? this.errMsg,
    );
  }
  
  @override
  List<Object> get props => [books, status, errMsg];
}
