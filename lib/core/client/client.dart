import 'package:dio/dio.dart';

class Client {
   late Dio dio;
  static final Client _singleton= Client._internal();
  factory Client() => _singleton;
  Client._internal();
	
  Future setupClient() async {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://pokeapi.co/api/v2/",
        connectTimeout: const Duration(seconds: 15000),
        receiveTimeout: const Duration(seconds: 15000),
        contentType: "application/json",
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          // Do something with response error
          return handler.next(e); //continue
        },
      ),
    );

    setDioHeader();
  }

  void setDioHeader() {
    dio.options.headers = {
      'accept': 'application/json',
    };
  }
}