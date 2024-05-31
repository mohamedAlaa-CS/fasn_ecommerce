import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/di/injections.dart';
import 'package:fasn_ecommerce/core/utils/local_data.dart';

class ApiServices {
  static Map<String, dynamic> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'lang': 'en',
      };
  static Map<String, dynamic> get headersAuth => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'lang': 'en',
        'Authorization': LocalData.token ?? ''
      };
  static Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    required bool isAuth,
  }) async {
    //  getIt.get<Dio>().options.headers = headers.addAll({});
    Response response = await getIt.get<Dio>().get(
          endPoint,
          data: data,
          queryParameters: query,
          options: Options(headers: isAuth ? headersAuth : headers),
        );
    return response.data;
  }

  static Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    required bool isAuth,
  }) async {
    Response response = await getIt.get<Dio>().post(
          endPoint,
          data: data,
          queryParameters: query,
          options: Options(headers: isAuth ? headersAuth : headers),
        );
    return response.data;
  }
}
