import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/favourite_page/data/repos/favourite_repo.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';

class FavouriterepoImple implements FavouriteRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getAllFavouriteData() async {
    try {
      Map<String, dynamic> response = await ApiServices.get(
        endPoint: EndPoint.getAllFavourite,
        isAuth: true,
      );
      List<ProductModel> favouriteList = [];
      for (var item in response['data']['data']) {
        favouriteList.add(ProductModel.fromJson(item['product']));
      }
      return right(favouriteList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeFavouriteProduct(
      {required int productId}) async {
    try {
      Map<String, dynamic> response = await ApiServices.post(
        endPoint: EndPoint.addFavorite,
        isAuth: true,
        data: {
          'product_id': productId,
        },
      );
      return right(response['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
