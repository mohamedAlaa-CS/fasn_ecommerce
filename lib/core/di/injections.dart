import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;
Future<void> nitInj() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(pref);

  Dio dio = Dio();
  dio.options.baseUrl = EndPoint.baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 11);
  dio.options.receiveTimeout = const Duration(seconds: 11);
  dio.options.validateStatus = (i) => true;
  dio.interceptors.add(LogInterceptor(responseBody: true));

  getIt.registerSingleton<Dio>(dio);
  MainCubit mainCubit = MainCubit();
  getIt.registerSingleton<MainCubit>(mainCubit);
}
