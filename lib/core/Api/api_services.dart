import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/di/injections.dart';

class ApiServices {
  static var headers = {'Content-Type': 'application/json'};
  static Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    Response response = await getIt.get<Dio>().get(
          endPoint,
          data: data,
          queryParameters: query,
        );
    return response.data;
  }

  static Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    getIt.get<Dio>().options.headers = headers;
    Response response = await getIt.get<Dio>().post(
          endPoint,
          data: data,
          queryParameters: query,
        );
    return response.data;
  }
}
