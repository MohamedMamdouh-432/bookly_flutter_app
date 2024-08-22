import 'package:dio/dio.dart';

class APIService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  const APIService(this._dio);

  Future<Map<String, dynamic>> getBooks(String resource, String? query) async {
    String reqUrl = _baseUrl + resource;
    if (query != null) reqUrl += '?$query';
    final res = await _dio.get(reqUrl);
    return res.data;
  }
}
