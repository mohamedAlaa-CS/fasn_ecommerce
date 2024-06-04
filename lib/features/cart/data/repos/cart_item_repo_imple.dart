import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/cart/data/repos/cart_item_repo.dart';

class CartItemRepoImple implements CartItemRepo {
  @override
  Future<Either<Failure, String>> deleteCartItem(
      {required int cartItemId}) async {
    try {
      Map<String, dynamic> response = await ApiServices.delete(
        endPoint: EndPoint.deleteCartItem.replaceAll('4', '$cartItemId'),
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
