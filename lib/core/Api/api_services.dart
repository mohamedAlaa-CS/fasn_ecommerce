import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/di/injections.dart';
import 'package:fasn_ecommerce/core/utils/local_data.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';

class ApiServices {
  static Map<String, dynamic> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'lang': MainCubit.getFalse.isEnglish ? 'en' : 'ar',
      };
  static Map<String, dynamic> get headersAuth => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'lang': MainCubit.getFalse.isEnglish ? 'en' : 'ar',
        'Authorization': LocalData.token ?? ''
      };
  static Future<Map<String, dynamic>> get({
    required String endPoint,
    Object? data,
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
    Object? data,
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

  static Future<Map<String, dynamic>> put({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? query,
    required bool isAuth,
  }) async {
    Response response = await getIt.get<Dio>().put(
          endPoint,
          data: data,
          queryParameters: query,
          options: Options(headers: isAuth ? headersAuth : headers),
        );
    return response.data;
  }

  static Future<Map<String, dynamic>> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? query,
    required bool isAuth,
  }) async {
    Response response = await getIt.get<Dio>().delete(
          endPoint,
          data: data,
          queryParameters: query,
          options: Options(headers: isAuth ? headersAuth : headers),
        );
    return response.data;
  }
}
