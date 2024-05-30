import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/category/data/repos/category_repo.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';

class CategoryRepoImple implements CategoryRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getProductsOfCategpryData(
      {required int categoryId}) async {
    try {
      Map<String, dynamic> response = await ApiServices.get(
        endPoint: EndPoint.products,
        query: {'category_id': categoryId},
      );
      List<ProductModel> productsOfCategoryList = [];
      for (var item in response['data']['data']) {
        productsOfCategoryList.add(ProductModel.fromJson(item));
      }
      return right(productsOfCategoryList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
