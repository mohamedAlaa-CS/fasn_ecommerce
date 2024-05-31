import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';

abstract class ProductRepo {
  Future<Either<Failure, String>> addToFavorate({
    required int productId,
  });
}
