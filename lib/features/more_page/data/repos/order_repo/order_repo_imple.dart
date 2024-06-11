import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/get_oreders_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/oreder_details_model/oreder_details_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/order_repo/order_repo.dart';

class OrderRepoImple implements OrderRepo {
  @override
  Future<Either<Failure, List<GetOredersModel>>> getMyOrders() async {
    try {
      Map<String, dynamic> response = await ApiServices.get(
        endPoint: EndPoint.orders,
        isAuth: true,
      );
      List<GetOredersModel> ordersList = [];
      for (var item in response['data']['data']) {
        ordersList.add(GetOredersModel.fromJson(item));
      }
      return right(ordersList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, OrederDetailsModel>> getOrderDetails(
      {required int orderId}) async {
    try {
      Map<String, dynamic> response = await ApiServices.get(
        endPoint: EndPoint.orderDetails.replaceAll('4', '$orderId'),
        isAuth: true,
      );

      return right(OrederDetailsModel.fromJson(response['data']));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
