import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addToFavorate({
    required int productId,
  });
}
