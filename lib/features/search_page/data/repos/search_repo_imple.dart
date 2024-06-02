import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/search_page/data/repos/search_repo.dart';

class SerachRepoImple implements SearchRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getSearchData(
      {required String text}) async {
    try {
      Map<String, dynamic> response = await ApiServices.post(
        endPoint: EndPoint.search,
        isAuth: true,
        data: {'text': text},
      );
      List<ProductModel> searchedList = [];
      for (var item in response['data']['data']) {
        searchedList.add(ProductModel.fromJson(item));
      }
      return Right(searchedList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
