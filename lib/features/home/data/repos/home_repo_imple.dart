import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/home/data/models/category_model.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/home_model.dart';
import 'package:fasn_ecommerce/features/home/data/repos/home_repo.dart';

class HomeRepoImple implements HomeRepo {
  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    try {
      Map<String, dynamic> response =
          await ApiServices.get(endPoint: EndPoint.home);

      return right(HomeModel.fromJson(response["data"]));
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDiorError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategoresData() async {
    try {
      Map<String, dynamic> response =
          await ApiServices.get(endPoint: EndPoint.categories);
      List<CategoryModel> categories = [];
      for (var item in response["data"]["data"]) {
        categories.add(CategoryModel.fromJson(item));
      }

      return right(categories);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDiorError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }
}
