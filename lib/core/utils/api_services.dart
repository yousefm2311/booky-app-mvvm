import 'package:dio/dio.dart';

class ApiService {
  static Dio? _dio;
  static init() {
    const baseUrl = 'https://www.googleapis.com/books/v1/';
    _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  Future<Map<String, dynamic>> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    _dio!.options.headers = {'Content-Type': 'application/json'};
    var response = await _dio!.get(url, queryParameters: query);
    return response.data;
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    _dio!.options.headers = {'Content-Type': 'application/json'};
    return _dio!.post(url, queryParameters: query, data: data);
  }
}
