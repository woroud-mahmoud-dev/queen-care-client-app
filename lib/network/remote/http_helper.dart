import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/core/failure/failures.dart';

class ApiBaseHelper {
  final String baseUrl = "https://queencare.net/queencare/public/api/";

  Future<dynamic> get(String url) async {
    var myUrl = Uri.parse(baseUrl + url);
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    try {
      final response = await http.get(myUrl);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(
    http.Response response,
  ) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        if (kDebugMode) {
          print(responseJson);
        }
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());

      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> post(String url, Object? body) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    var myUrl = Uri.parse(baseUrl + url);
    try {
      final response = await http.post(myUrl, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
