import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<ProductModel>>> getProductsOfCategpryData({
    required int categoryId,
  });
}
