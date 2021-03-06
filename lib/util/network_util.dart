import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:sould_food_guide/model/repoResponse_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sould_food_guide/network/network_config.dart';
import 'package:sould_food_guide/network/network_endpoints.dart';

/// Network Util Class -> A utility class for handling network operations
class NetworkUtil {
  //----------------------------------------------------------- Singleton-Instance ------------------------------------------------------------------
  // Singleton Instance
  static NetworkUtil _instance = new NetworkUtil.internal();

  http.Client _client = new http.Client();
  // http.Client get client => _client;
  //
  // set client(http.Client value) {
  //   _client = value;
  // }

  close() {
    _client.close();
    _client = new http.Client();
  }

  /// NetworkUtil Private Constructor -> NetworkUtil
  /// @param -> _
  /// @usage -> Returns the instance of NetworkUtil class
  NetworkUtil.internal();

  /// NetworkUtil Factory Constructor -> NetworkUtil
  /// @dependency -> _
  /// @usage -> Returens the instance of NetworkUtil class
  factory NetworkUtil() => _instance;

  //------------------------------------------------------------- Variables ---------------------------------------------------------------------------
  // JsonDecoder object
  final JsonDecoder _decoder = new JsonDecoder();

  //------------------------------------------------------------- Methods -----------------------------------------------------------------------------
  /// Get Method -> Future<dynamic>
  /// @param ->  url -> String
  /// @usage -> Make HTTP-GET request to specified URL and returns the response in JSON format

  Future<RepositoryResponse> get({String url, Map headers}) async {
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    repositoryResponse.data = null;

    print('******* Get request *********');
    print('******* Get request URL *********');
    print(url);
    print('******* Get request headers *********');
    print(headers.toString());

    try {
      var response = await _client.get(Uri.parse(url), headers: headers).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response('Slow Internet Connection',
              500); // Replace 500 with your http code.
        },
      );
      final String res = response.body;
      var data = _decoder.convert(res);

      print("Response $data}");
      repositoryResponse.msg = data["message"];
      repositoryResponse.success = data["success"];
      repositoryResponse.data = data;
      return repositoryResponse;
    } on SocketException {
      print("********Socket Exception ");
      repositoryResponse.code = 1;
      repositoryResponse.msg =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      return repositoryResponse;
    } on FormatException {
      print("********Format Exception ");
      repositoryResponse.code = 2;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } on HttpException {
      print("********Http Exception ");
      repositoryResponse.code = 3;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } catch (e) {
      print("********Unknown Exception ${e.toString()}");
      repositoryResponse.code = 4;
      repositoryResponse.msg =
          "Something went wrong, Our team has been notified";
      return repositoryResponse;
    }
  }

  /// Post Method -> Future<dynamic>
  /// @param ->  url -> String
  ///        -> headers -> Map
  ///        -> body -> dynamic
  ///        -> encoding -> dynamic
  ///  @usage -> Make HTTP-POST request to specified URL and returns the response in JSON format

  Future<RepositoryResponse> post(
      {String url, Map headers, body, encoding}) async {
    Dio dio = Dio();
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    repositoryResponse.data = null;

    print('******* Post request *********');
    try {

      var response = await _client.post(Uri.parse(url),
          body: body, headers: headers, encoding: encoding).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response('Slow Internet Connection',
              500); // Replace 500 with your http code.
        },
      );
      print("request ${response.request.toString()}");
      //var response = await http.post(url,body: body,headers: headers,encoding: encoding);
      final String res = response.body;
      var data = _decoder.convert(res);

      print("Response $data}");
      repositoryResponse.msg = data["message"];

      repositoryResponse.success = data["success"];
      repositoryResponse.data = data["data"];

      return repositoryResponse;
    } on SocketException {
      print("********Socket Exception ");
      repositoryResponse.code = 1;
      repositoryResponse.msg =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      return repositoryResponse;
    } on FormatException catch(e){
      print("********Format Exception ${e.toString()}");
      repositoryResponse.code = 2;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } on HttpException {
      print("********Http Exception ");
      repositoryResponse.code = 3;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } catch (e) {
      print("********Unknown Exception ${e.toString()}");
      repositoryResponse.code = 4;
      repositoryResponse.msg =
          "Something went wrong, Our team has been notified";
      return repositoryResponse;
    }
  }

  Future<RepositoryResponse> uploadMultiMedia( {String url,String path,String param,body,Map headers}) async {
    var uri = Uri.parse(url);
    final mimeTypeData = lookupMimeType(path, headerBytes: [0xFF, 0xD8]).split('/');

    // Intilize the multipart request
    final imageUploadRequest = http.MultipartRequest('POST', uri);
if(body!=null)
    imageUploadRequest.fields.addAll(body);
if(headers!=null)
  imageUploadRequest.headers.addAll(headers);
    // Attach the file in the request
    final file = await http.MultipartFile.fromPath(param, path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    imageUploadRequest.files.add(file);

    // add headers if needed
    //imageUploadRequest.headers.addAll(<some-headers>);
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    repositoryResponse.data = null;
    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      final String res = response.body;
      var data = _decoder.convert(res);

      print("Response $data}");
      repositoryResponse.msg = data["message"];

      repositoryResponse.success = data["success"];
      repositoryResponse.data = data["data"];

      return repositoryResponse;
    } on SocketException {
      print("********Socket Exception ");
      repositoryResponse.code = 1;
      repositoryResponse.msg =
      "No Internet Available.\nPlease check your internet connection & Try Again!";
      return repositoryResponse;
    } on FormatException catch(e){
print(e);
      print("********Format Exception ${e.toString()}");
      repositoryResponse.code = 2;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } on HttpException {
      print("********Http Exception ");
      repositoryResponse.code = 3;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } catch (e) {
      print("********Unknown Exception ${e.toString()}");
      repositoryResponse.code = 4;
      repositoryResponse.msg =
      "Something went wrong, Our team has been notified";
      return repositoryResponse;
    }
  }

  Future<RepositoryResponse> postHotel(
      {String url, Map headers, body, encoding}) async {
    Dio dio = Dio();
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    repositoryResponse.data = null;

    print('******* Post request *********');
    print('******* url $url');
    print('******* body ' + jsonEncode(body));
    print('******* headers ' + headers.toString());
    // var res;
    try {

      http.Response response = await _client
          .post((Uri.parse(url)),
          body: jsonEncode(body), headers: headers, encoding: encoding)
          .timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response('Slow Internet Connection',
              500); // Replace 500 with your http code.
        },
      );
      //var response = await http.post(url,body: body,headers: headers,encoding: encoding);

      final String res = response.body;

      var data = _decoder.convert(res);

      print("Response $data}");
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        repositoryResponse.msg = "Hotels fetched successfully.";

        repositoryResponse.success = true;
        repositoryResponse.data = data;
      } else {
        print("statusCode " + response.statusCode.toString());
        repositoryResponse.success = false;
        repositoryResponse.data = data;
      }

      return repositoryResponse;
    } on SocketException {
      print("********Socket Exception ");
      repositoryResponse.code = 1;
      repositoryResponse.msg =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      return repositoryResponse;
    } on FormatException {
      print("********Format Exception ");
      repositoryResponse.code = 2;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } on HttpException {
      print("********Http Exception ");
      repositoryResponse.code = 3;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } catch (e) {
      print("********Unknown Exception ${e.toString()}");
      repositoryResponse.code = 4;
      repositoryResponse.msg =
          "Something went wrong, Our team has been notified";
      return repositoryResponse;
    }
  }

  Future<RepositoryResponse> getEvents({String url}) async {
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    repositoryResponse.data = null;
    try {
      var response = await _client.get(Uri.parse(url)).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response('Slow Internet Connection',
              500); // Replace 500 with your http code.
        },
      );
      final String res = response.body;
      var data = _decoder.convert(res);
      print("Response $data}");
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        repositoryResponse.msg = "Hotels fetched successfully.";

        repositoryResponse.success = true;
        repositoryResponse.data = data;
      } else {
        print("statusCode " + response.statusCode.toString());
        repositoryResponse.success = false;
        repositoryResponse.data = data;
      }

      return repositoryResponse;
    } on SocketException {
      print("********Socket Exception ");
      repositoryResponse.code = 1;
      repositoryResponse.msg =
      "No Internet Available.\nPlease check your internet connection & Try Again!";
      return repositoryResponse;
    } on FormatException {
      print("********Format Exception ");
      repositoryResponse.code = 2;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } on HttpException {
      print("********Http Exception ");
      repositoryResponse.code = 3;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } catch (e) {
      print("********Unknown Exception ${e.toString()}");
      repositoryResponse.code = 4;
      repositoryResponse.msg =
      "Something went wrong, Our team has been notified";
      return repositoryResponse;
    }
  }

  Future<RepositoryResponse> getHotel({String url, Map headers}) async {
    Dio dio = Dio();
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    repositoryResponse.data = null;

    print('******* get request *********');
    print('******* url $url');
    print('******* headers ' + headers.toString());
    // var res;
    try {
      var response = await _client.get(Uri.parse(url), headers: headers).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response('Slow Internet Connection',
              500); // Replace 500 with your http code.
        },
      );
      final String res = response.body;
      var data = _decoder.convert(res);
      print("Response $data}");
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        repositoryResponse.msg = "Hotels fetched successfully.";

        repositoryResponse.success = true;
        repositoryResponse.data = data;
      } else {
        print("statusCode " + response.statusCode.toString());
        repositoryResponse.success = false;
        repositoryResponse.data = data;
      }

      return repositoryResponse;
    } on SocketException {
      print("********Socket Exception ");
      repositoryResponse.code = 1;
      repositoryResponse.msg =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      return repositoryResponse;
    } on FormatException {
      print("********Format Exception ");
      repositoryResponse.code = 2;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } on HttpException {
      print("********Http Exception ");
      repositoryResponse.code = 3;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } catch (e) {
      print("********Unknown Exception ${e.toString()}");
      repositoryResponse.code = 4;
      repositoryResponse.msg =
          "Something went wrong, Our team has been notified";
      return repositoryResponse;
    }
  }

  /// Put Method -> Future<dynamic>
  /// @param ->  url -> String
  ///        -> headers -> Map
  ///        -> body -> dynamic
  ///        -> encoding -> dynamic
  ///  @usage -> Make HTTP-POST request to specified URL and returns the response in JSON format

  Future<RepositoryResponse> put(
      {String url, Map headers, body, encoding}) async {
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    repositoryResponse.data = null;

    print('******* Put request *********');
    try {
      var response = await _client.put(Uri.parse(url),
          headers: headers, body: body, encoding: encoding).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response('Slow Internet Connection',
              500); // Replace 500 with your http code.
        },
      );
      final String res = response.body;
      var data = _decoder.convert(res);

      print("Response $data}");
      repositoryResponse.msg = data["message"];
      repositoryResponse.success = data["success"];
      repositoryResponse.data = data;
      return repositoryResponse;
    } on SocketException {
      print("********Socket Exception ");
      repositoryResponse.code = 1;
      repositoryResponse.msg =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      return repositoryResponse;
    } on FormatException {
      print("********Format Exception ");
      repositoryResponse.code = 2;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } on HttpException {
      print("********Http Exception ");
      repositoryResponse.code = 3;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } catch (e) {
      print("********Unknown Exception ${e.toString()}");
      repositoryResponse.code = 4;
      repositoryResponse.msg =
          "Something went wrong, Our team has been notified";
      return repositoryResponse;
    }
  }

  /// Delete Method -> Future<dynamic>
  /// @param ->  url -> String
  /// @usage -> Make HTTP-DELETE request to specified URL and returns the response in JSON format

  Future<RepositoryResponse> delete({String url, Map headers}) async {
    RepositoryResponse repositoryResponse = new RepositoryResponse();
    repositoryResponse.success = false;
    repositoryResponse.data = null;

    print('******* Delete request *********');
    try {
      var response = await _client.delete(Uri.parse(url), headers: headers).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response('Slow Internet Connection',
              500); // Replace 500 with your http code.
        },
      );
      final String res = response.body;
      var data = _decoder.convert(res);

      print("Response $data}");
      repositoryResponse.msg = data["message"];
      repositoryResponse.success = data["success"];
      repositoryResponse.data = data;
      return repositoryResponse;
    } on SocketException {
      print("********Socket Exception ");
      repositoryResponse.code = 1;
      repositoryResponse.msg =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      return repositoryResponse;
    } on FormatException {
      print("********Format Exception ");
      repositoryResponse.code = 2;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } on HttpException {
      print("********Http Exception ");
      repositoryResponse.code = 3;
      repositoryResponse.msg = "Something went wrong, Please try again.";
      return repositoryResponse;
    } catch (e) {
      print("********Unknown Exception ${e.toString()}");
      repositoryResponse.code = 4;
      repositoryResponse.msg =
          "Something went wrong, Our team has been notified";
      return repositoryResponse;
    }
  }
}
