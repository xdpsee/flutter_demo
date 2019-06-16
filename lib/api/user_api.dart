
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drip/model/user.dart';

class UserApi {

  final String baseUrl = 'https://my-json-server.typicode.com/xdpsee/json';

  Future<List<User>> listUsers(int page, int pageSize) async {

    Dio dio = new Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;

    Response response = await dio.get('/users');

    if (response.statusCode == 200) {
      return null;
    } else {
      throw Exception('listUsers error');
    }

  }
}