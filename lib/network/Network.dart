import 'package:dio/dio.dart';

class Network {
  static Dio getDio() {

    Dio dio = new Dio();

    return dio;
  }
}
