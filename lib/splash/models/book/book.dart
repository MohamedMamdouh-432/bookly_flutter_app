import 'package:bookly/splash/models/book/image_links.dart';
import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String? title;
  final List<String>? authors;
  final List<String>? categories;
  final ImageLinks? imageLinks;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  const Book({
    this.title,
    this.authors,
    this.categories,
    this.imageLinks,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json['volumeInfo']['title'] as String?,
        authors: (json['volumeInfo']['authors'] as List<dynamic>?)?.cast<String>(),
        categories: (json['volumeInfo']['categories'] as List<dynamic>?)?.cast<String>(),
        imageLinks: json['volumeInfo']['imageLinks'] == null
            ? null
            : ImageLinks.fromJson(json['volumeInfo']['imageLinks'] as Map<String, dynamic>),
        previewLink: json['volumeInfo']['previewLink'] as String?,
        infoLink: json['volumeInfo']['infoLink'] as String?,
        canonicalVolumeLink: json['volumeInfo']['canonicalVolumeLink'] as String?,
      );

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      categories,
      imageLinks,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
