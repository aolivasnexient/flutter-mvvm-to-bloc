import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../adapters/rest_adapter.dart';


class RestServiceV2 implements RestAdapter{
  final http.Client client;

  RestServiceV2(this.client);

  @override
  Future<T> get<T>(String url) async {
    try {
      final response = await client.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final decodedData = json.decode(response.body);
        return decodedData as T;
      }
      throw NetworkException(response.reasonPhrase! , response.statusCode);
    } on SocketException {
      throw NetworkException("No internet connection" , 101);
    }
  }

}


class NetworkException implements Exception {
  String message;
  int code;

  NetworkException(this.message, this.code);

  @override
  String toString() {
    return '$message: response code: $code';
  }
}
