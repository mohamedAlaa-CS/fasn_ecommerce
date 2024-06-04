import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, List<ProductModel>>> getAllFavouriteData();
  Future<Either<Failure, String>> removeFavouriteProduct(
      {required int productId});
}
