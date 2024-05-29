import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/home/data/models/category_model.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/home_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> getHomeData();
  Future<Either<Failure, List<CategoryModel>>> getCategoresData();
}
