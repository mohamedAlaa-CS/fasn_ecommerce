import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/category/data/repos/product_repo.dart';

class ProductRepoImple implements ProductRepo {
  @override
  Future<Either<Failure, String>> addToFavorate(
      {required int productId}) async {
    try {
      Map<String, dynamic> response = await ApiServices.post(
        endPoint: EndPoint.addFavorite,
        isAuth: true,
        data: {'product_id': productId},
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
