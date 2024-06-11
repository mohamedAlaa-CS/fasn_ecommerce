import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/more_page_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/order_repo/order_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/more_cubit/more_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/order_cubit/order_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;
Future<void> nitInj() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(pref);

  Dio dio = Dio();
  dio.options.baseUrl = EndPoint.baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 15);
  dio.options.receiveTimeout = const Duration(seconds: 15);
  dio.options.validateStatus = (i) => true;
  dio.interceptors.add(LogInterceptor(responseBody: true));

  getIt.registerSingleton<Dio>(dio);
  MainCubit mainCubit = MainCubit();
  getIt.registerSingleton<MainCubit>(mainCubit);
  MoreCubit moreCubit = MoreCubit(MorePageRepoImple());
  getIt.registerSingleton<MoreCubit>(moreCubit);
  OrderCubit orderCubit = OrderCubit(OrderRepoImple());
  getIt.registerSingleton<OrderCubit>(orderCubit);
}
