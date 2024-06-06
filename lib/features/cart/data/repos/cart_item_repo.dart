import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';

abstract class CartItemRepo {
  Future<Either<Failure, String>> updateCart({
    required int cartItemId,
    required int quantity,
  });
  Future<Either<Failure, String>> deleteCartItem({
    required int cartItemId,
  });
}
