import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/cart/data/models/cart_model/cart_model.dart';
import 'package:fasn_ecommerce/features/cart/data/repos/cart_repo.dart';

class CartRepoImple implements CartRepo {
  @override
  Future<Either<Failure, CartModel>> getCartData() async {
    try {
      Map<String, dynamic> response =
          await ApiServices.get(endPoint: EndPoint.carts, isAuth: true);

      CartModel cartModel = CartModel.fromJson(response['data']);
      return right(cartModel);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDiorError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> addOrder({
    required int addressId,
    required int paymentMethod,
    required bool usePoints,
  }) async {
    try {
      Map<String, dynamic> response = await ApiServices.post(
        endPoint: EndPoint.orders,
        data: {
          "address_id": addressId,
          "payment_method": paymentMethod,
          "use_points": usePoints
        },
        isAuth: true,
      );

      return right(response['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
