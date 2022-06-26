import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// enum for http verbs
enum HttpRequestType { get, post, delete }

// args to be sent to client to make request
class HttpArgs {
  final String url;
  final HttpRequestType verb;
  final dynamic body;
  final bool useAuthorization;

  HttpArgs({
    required this.url,
    this.verb = HttpRequestType.get,
    this.body = '',
    this.useAuthorization = true,
  });
}

class HttpClient {
  static const API_URL = 'http://192.168.0.101:8000/api/';
  static dynamic _authHeaders;

  // helper to build urls
  static String apiUrl(String path) {
    return API_URL + path;
  }

  // make http request
  static Future<http.Response> request(HttpArgs args) async {
    http.Response response;
    switch (args.verb) {
      case HttpRequestType.get:
        response = await http.get(Uri.parse(args.url),
            headers: args.useAuthorization ? _authHeaders : {});
        break;

      case HttpRequestType.post:
        response = await http.post(Uri.parse(args.url),
            body: args.body,
            headers: args.useAuthorization ? _authHeaders : {});
        break;

      default:
        throw Exception('Invalid Http Request Type');
        break;
    }
    return response;
  }
}
