// write base http client
// that handles GET & POST
// try out enums

import 'package:dio/dio.dart';

enum Method { get, post }

class HttpService {
  Future<Response> request({
    required String url,
    required Method method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? post,
  }) async {
    Response? response;
    try {
      if (method == Method.get) {
        response = await Dio().get(url);
      } else if (method == Method.post) {
        response = await Dio().post(url, data: post);
      }
      return response!;
    } catch (_) {
      throw Exception();
    }
  }
}
